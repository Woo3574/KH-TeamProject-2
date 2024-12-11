import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import AxiosApi from "../../api/AxiosApi";
import styled from "styled-components";
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

const Reservation = () => {
    const [reservations, setReservations] = useState("");

    useEffect (() => {
        const getReservations = async () => {
            try {
                const rsp = await AxiosApi.reservationList();
                console.log(rsp.data);
                setReservations(rsp.data);
            } catch (e) {
                console.error("Error:", e);
                alert("서버가 응답하지 않습니다.", e);
            }
        };
        getReservations();
    }, []);

    return (
        <ReviewContainer>
            <StyledTable>
                <thead>
                    <tr>
                        <th>예약 번호</th>
                        <th>사용자 아이디</th>
                        <th>예약자명</th>
                        <th>매장 번호</th>
                        <th>매장명</th>
                        <th>매장 연락처</th>
                        <th>예약 인원</th>
                        <th>방문 예정 시간</th>
                        <th>예약완료일</th>
                        <th>브랜드명</th>
                    </tr>
                </thead>
                <tbody>
                    {reservations.length > 0 ? (
                        reservations &&
                        reservations.map(reservation => (
                            <tr key={reservation.userId}>
                                <td>{reservation.rNo}</td>
                                <td>{reservation.userId}</td>
                                <td>{reservation.userName}</td>
                                <td>{reservation.storeNo}</td>
                                <td>{reservation.storeName}</td>
                                <td>{reservation.storePhone}</td>
                                <td>{reservation.rPersonCnt}</td>
                                <td>{reservation.rTime}:00</td>
                                <td>{reservation.rSubmitTime}</td>
                                <td>{reservation.brandName}</td>
                                <td>
                                    {!reservation.hasReview && ( // hasReview가 false일 때만 버튼 렌더링
                                        <ReviewButton>
                                            <ReviewLink to={`/AddReview?userId=${reservation.userId}&storeName=${reservation.storeName}&rSubmitTime=${reservation.rSubmitTime}&rTime=${reservation.rTime}&brandName=${reservation.brandName}`} className="link_style">
                                                <span>리뷰 추가</span>
                                            </ReviewLink>
                                        </ReviewButton>
                                    )}
                                </td>
                            </tr>
                        ))
                    ):(
                        <tr>
                            <td colSpan="11">예약 내역이 없습니다.</td>
                        </tr>
                    )}
                </tbody>
            </StyledTable>
        </ReviewContainer>
    );
}

export default Reservation;