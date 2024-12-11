import { useState, useRef, useCallback } from "react";
import AxiosApi from "../../api/AxiosApi";
import { useNavigate, useLocation } from "react-router-dom";
import { Rating } from "@mui/material";
import { Container, ReviewUser, ReviewForm, RatingBox, ReviewRating, ReviewButton, ReviewContent } from "../../components/ReviewComponent";

const AddReview = () => {
    const location = useLocation(); // URL에서 쿼리 파라미터 받기
    const navigate = useNavigate();
    const queryParams = new URLSearchParams(location.search);

    // const [brandName, setBrandName] = useState(queryParams.get('brandName'));  // 브랜드명
    const [userId, setUserId] = useState(queryParams.get('userId'));  // 사용자 ID
    const [storeName, setStoreName] = useState(queryParams.get('storeName'));  // 매장명
    const [rSubmitTime, setRSubmitTime] = useState(queryParams.get('rSubmitTime'));  // 예약 날짜
    const [rTime, setRTime] = useState(queryParams.get('rTime'));  // 예약 시간
    const [rvPrice, setRvPrice] = useState(0); // 별점(가격)
    const [rvTaste, setRvTaste] = useState(0); // 별점(맛)
    const [rvVibe, setRvVibe] = useState(0);   // 별점(분위기)
    const [rvKind, setRvKind] = useState(0);   // 별점(친절도)
    const [rvContent, setRvContent] = useState([]);   // 리뷰 텍스트

    const isButtonEnabled = rvPrice > 0 && rvTaste > 0 && rvVibe > 0 && rvKind > 0;
  
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

        try {
            const response = await AxiosApi.reviewInsert(reviewData);
            console.log(response);
            alert('리뷰가 추가되었습니다!');
            navigate("/reservation"); // 추가 성공 시 리뷰 리스트 페이지로 이동
        } catch (error) {
            console.error(error.response ? error.response.data : error.message);
            alert('리뷰 추가 중 오류가 발생했습니다: ' + error.message);
        }
    };

    const textRef = useRef();
        const handleResizeHeight = useCallback(() => {
        textRef.current.style.height = textRef.current.scrollHeight + "px";
    }, []);


/*     const brandStyles = {
        "한신포차": {
          border: "2px solid #ff3920",  // Nike에 대한 스타일
        },
        "Adidas": {
          backgroundColor: "#E1E1E1", 
          color: "#333",
          border: "2px solid #000",  // Adidas에 대한 스타일
        },
    };
      
    const currentBrandStyle = brandStyles[brandName] || {}; */

    return (
        // <Container style={currentBrandStyle}>
        <Container>
            <h2>리뷰 추가</h2>
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
                <ReviewButton type="submit" disabled={!isButtonEnabled}>리뷰 추가</ReviewButton>
            </ReviewForm>
        </Container>
    );
};

export default AddReview;