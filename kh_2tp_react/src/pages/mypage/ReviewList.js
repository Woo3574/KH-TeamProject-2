import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import AxiosApi from "../../api/AxiosApi";
import styled from "styled-components";
import { Rating } from "@mui/material";
import { ReviewContainer, StyledTable } from "../../components/ReviewComponent";

const ReviewLink = styled(Link)`
    text-decoration: none;
    color: #000;
    &:active {
        color: #FFF;
    } 
`
export const ReviewButton = styled.button`
    height: 40px;
    aspect-ratio: 7 / 4;
    border-radius: 5px;
    &:active {
        background-color: #000;
        color: #FFF;
    } 
`

const ReviewList = () => {
    const [reviews, setReviews] = useState([]);

    useEffect (() => {
        const getReviews = async () => {
            try {
                const rsp = await AxiosApi.reviewList();
                console.log(rsp.data);
                setReviews(rsp.data);
            } catch (e) {
                console.error("Error:", e);
                alert("서버가 응답하지 않습니다.", e);
            }
        };
        getReviews();
    }, []);

    // 리뷰 삭제 핸들러
    const onRemove = async (rvNo) => {
        if (!window.confirm("정말 삭제하시겠습니까?")) return;

        try {
            const response = await AxiosApi.reviewDelete(rvNo);
            if (response.status === 200) {
                alert("리뷰가 삭제되었습니다.");
                // 삭제된 리뷰를 제외하고 상태를 업데이트
                setReviews(reviews.filter(review => review.rvNo !== rvNo));
            } else {
                alert("리뷰 삭제에 실패했습니다.");
            }
        } catch (e) {
            console.error("Error:", e);
            alert("서버 요청 중 오류가 발생했습니다.");
        }
    };

    return (
        <ReviewContainer>
            <StyledTable>
                <thead>
                    <tr>
                        <th>리뷰 번호</th>
                        <th>사용자 아이디</th>
                        <th>리뷰 작성일</th>
                        <th>예약 매장명</th>
                        <th>방문 시간</th>
                        <th>예약 번호</th>
                        <th>별점_가격</th>
                        <th>별점_맛</th>
                        <th>별점_분위기</th>
                        <th>별점_친절도</th>
                    </tr>
                </thead>
                <tbody>
                    {reviews.length > 0 ? (
                        reviews && 
                        reviews.map(review => (
                            <tr key={review.rvNo}>
                                <td>{review.rvNo}</td>
                                <td>{review.userId}</td>
                                <td>{review.rvDate}</td>
                                <td>{review.storeName}</td>
                                <td>{review.rTime}:00</td>
                                <td>{review.rNo}</td>
                                <td>
                                    <Rating
                                        name={`price-rating-${review.rvNo}`}
                                        value={review.rvPrice}
                                        precision={0.5}
                                        readOnly
                                    />
                                </td>
                                <td>
                                    <Rating
                                        name={`taste-rating-${review.rvNo}`}
                                        value={review.rvTaste}
                                        precision={0.5}
                                        readOnly
                                    />
                                </td>
                                <td>
                                    <Rating
                                        name={`vibe-rating-${review.rvNo}`}
                                        value={review.rvVibe}
                                        precision={0.5}
                                        readOnly
                                    />
                                </td>
                                <td>
                                    <Rating
                                        name={`kind-rating-${review.rvNo}`}
                                        value={review.rvKind}
                                        precision={0.5}
                                        readOnly
                                    />
                                </td>
                                <td>
                                    <ReviewButton>
                                        <ReviewLink to={`/EditReview?userId=${review.userId}&storeName=${review.storeName}&rSubmitTime=${review.rSubmitTime}&rTime=${review.rTime}&rvPrice=${review.rvPrice}&rvTaste=${review.rvTaste}&rvVibe=${review.rvVibe}&rvKind=${review.rvKind}&rvContent=${review.rvContent}`} className="link_style">
                                            <span>리뷰 수정</span>
                                        </ReviewLink>
                                    </ReviewButton>
                                </td>
                                <td>
                                    <ReviewButton onClick={() => onRemove(review.rvNo)}>
                                        <span>리뷰 삭제</span>
                                    </ReviewButton>
                                </td>
                            </tr>
                        ))
                    ):(
                        <tr>
                            <td colSpan="13">리뷰가 없습니다.</td>
                        </tr>
                    )}
                </tbody>
            </StyledTable>
        </ReviewContainer>
    );
}

export default ReviewList;