import { useState, useRef, useCallback } from "react";
import AxiosApi from "../../api/AxiosApi";
import { useNavigate, useLocation } from "react-router-dom";
import { Rating } from "@mui/material";
import { Container, ReviewUser, ReviewForm, RatingBox, ReviewRating, ReviewButton, ReviewContent } from "../../components/ReviewComponent";

const EditReview = () => {
    const location = useLocation(); // URL에서 쿼리 파라미터 받기
    const navigate = useNavigate();
    const queryParams = new URLSearchParams(location.search);

    const [userId, setUserId] = useState(queryParams.get('userId'));  // 사용자 ID
    const [storeName, setStoreName] = useState(queryParams.get('storeName'));  // 매장명
    const [rSubmitTime, setRSubmitTime] = useState(queryParams.get('rSubmitTime'));  // 예약 날짜
    const [rTime, setRTime] = useState(queryParams.get('rTime'));  // 예약 날짜/시간
    const [rvPrice, setRvPrice] = useState(parseFloat(queryParams.get('rvPrice'))); // 별점(가격)
    const [rvTaste, setRvTaste] = useState(parseFloat(queryParams.get('rvTaste'))); // 별점(맛)
    const [rvVibe, setRvVibe] = useState(parseFloat(queryParams.get('rvVibe')));   // 별점(분위기)
    const [rvKind, setRvKind] = useState(parseFloat(queryParams.get('rvKind')));   // 별점(친절도)
    const [rvContent, setRvContent] = useState(queryParams.get('rvContent'));   // 리뷰 텍스트

    const handleSubmit = async(e) => {
        e.preventDefault();

        const reviewData = {
            userId: userId,
            storeName: storeName,
            rSubmitTime: rSubmitTime,
            rTime: rTime,
            rvPrice: rvPrice,
            rvTaste: rvTaste,
            rvVibe: rvVibe,
            rvKind: rvKind,
            rvContent: rvContent
        };

        console.log("제출된 리뷰 수정 데이터:", reviewData);
        try {
            const response = await AxiosApi.reviewUpdate(reviewData);
            console.log(response);
            alert('리뷰가 수정되었습니다!');
            navigate("/auth"); // 수정 성공 시 리뷰 리스트 페이지로 이동
        } catch (error) {
            console.error(error.response ? error.response.data : error.message);
            alert('리뷰 수정 중 오류가 발생했습니다: ' + error.message);
        }
    };

    const textRef = useRef();
        const handleResizeHeight = useCallback(() => {
        textRef.current.style.height = textRef.current.scrollHeight + "px";
    }, []);

    return (
        <Container>
            <h2>리뷰 수정</h2>
            <ReviewForm onSubmit={handleSubmit}>
                <div>
                    <ReviewUser
                        type="text"
                        value={userId}
                        onChange={(e) => setUserId(e.target.value)}
                        required
                        readOnly
                    />님
                </div>
                <div>
                    <ReviewUser
                        type="text"
                        value={rSubmitTime}
                        onChange={(e) => setRSubmitTime(e.target.value)}
                        required
                        readOnly
                    />
                    &nbsp;
                    <ReviewUser
                        type="text"
                        value={rTime}
                        onChange={(e) => setRTime(e.target.value)}
                        required
                        readOnly
                    />
                    <span>:00 에 방문하신</span>
                </div>
                <div>
                    <span>'</span>
                    <ReviewUser
                        type="text"
                        value={storeName}
                        onChange={(e) => setStoreName(e.target.value)}
                        required
                        readOnly
                    />
                    <span>' 이 어떠셨는지 별점을 남겨주세요!</span>
                </div>
                <RatingBox>
                    <ReviewRating>
                        <label>가격</label>
                        <Rating
                            name="price-rating"
                            value={rvPrice}
                            onChange={(e, newValue) => setRvPrice(newValue)}
                            required
                            precision={0.5}
                        />
                    </ReviewRating>
                    <ReviewRating>
                        <label>맛</label>
                        <Rating
                            name="taste-rating"
                            value={rvTaste}
                            onChange={(e, newValue) => setRvTaste(newValue)}
                            required
                            precision={0.5}
                        />
                    </ReviewRating>
                    <ReviewRating>
                        <label>분위기</label>
                        <Rating
                            name="vibe-rating"
                            value={rvVibe}
                            onChange={(e, newValue) => setRvVibe(newValue)}
                            required
                            precision={0.5}
                        />
                    </ReviewRating>
                    <ReviewRating>
                        <label>친절도</label>
                        <Rating
                            name="kindness-rating"
                            value={rvKind}
                            onChange={(e, newValue) => setRvKind(newValue)}
                            required
                            precision={0.5}
                        />
                    </ReviewRating>
                </RatingBox>
                <ReviewContent
                    type="textarea"
                    maxLength="200"
                    ref={textRef}
                    value={rvContent}
                    onChange={(e) => setRvContent(e.target.value)}
                    placeholder="내용을 입력해주세요. 200자 이내. 생략 가능"
                    onInput={handleResizeHeight} 
                />
                <ReviewButton type="submit">리뷰 수정</ReviewButton>
            </ReviewForm>
        </Container>
    );
};

export default EditReview;