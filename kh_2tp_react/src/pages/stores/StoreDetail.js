import { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import StoreDetailReservation from "./StoreDetailReservation";
import StoreDetailMap from "./StoreDetailMap";
import StoreDetailMenu from "./StoreDetailMenu";
import AxiosApi from "../../api/AxiosApi";
import styled from "styled-components";
import { PhoneFilled } from "@ant-design/icons";
import Rating from "@mui/material/Rating";

const StoreName = styled.div`
  box-sizing: border-box;
  margin-top: 5vh;
  width: 90vw;
  height: 40px;
  left: 3vw;
  margin-left: 10px;
  font-size: 1.8em;
  font-weight: 500;
  font-family: "Noto Sans KR", sans-serif;
  display: flex;
  position: relative;
`;

const Container = styled.div`
  box-sizing: border-box;
  display: flex;
  align-items: flex-start;
`;

const StoreDetailLeft = styled.div`
  box-sizing: border-box;
  left: 0;
  width: 50vw;
  height: auto;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: left;
  position: relative;
  overflow-x: hidden;
  overflow-y: auto;
`;

const BrandImgContainer = styled.div`
  box-sizing: border-box;
  margin-top: 2vh;
  left: 3vw;
  width: 44vw;
  height: 24vw;
  aspect-ratio: 2 / 1.2;
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
  border-radius: 50px;
  background-color: #f0f0f0;
`;

const BrandImage = styled.img`
  box-sizing: border-box;
  margin: 0;
  padding: 0;
  display: block;
  width: 100%;
  object-fit: contain;
`;

const StoreInfoContainer = styled.div`
  box-sizing: border-box;
  margin-top: 2vh;
  left: 3vw;
  width: 44vw;
  height: 110px;
  position: relative;
  display: flex;
  justify-content: space-between;
  flex-direction: column;
  gap: 10px;
  flex-wrap: wrap;
`;

const StoreAddrAndPhoneContainer = styled.div`
  box-sizing: border-box;
  position: relative;
  top: 0;
  left: 1vw;
  width: 26vw;
  display: flex;
  align-content: left;
  flex-direction: column;
`;
const StoreAddr = styled.div`
  box-sizing: border-box;
  margin-top: 5px;
  font-size: 1.2em;
  font-weight: 400;
  text-align: left;
`;

const StoreHourContainer = styled.div`
  box-sizing: border-box;
  margin-top: 5px;
  font-size: 1.2em;
  font-weight: 400;
  text-align: left;
  position: relative;
`;

const StorePhoneContainer = styled.div`
  box-sizing: border-box;
  margin-top: 15px;
  display: flex;
  gap: 10px;
  position: relative;
`;

const StorePhone = styled.div`
  box-sizing: border-box;
  font-size: 1.4em;
  font-weight: 500;
  text-align: left;
  position: relative;
`;

const StorePhoneImg = styled.div`
  box-sizing: border-box;
  margin-left: 0;
  display: flex;
  padding-top: 5px;
  width: 30px;
  height: 30px;
  font-size: 2em;
  position: relative;
`;

const StoreRatingContainer = styled.div`
  box-sizing: border-box;
  top: 0;
  left: 3vw;
  position: relative;
  width: 18vw;
  display: flex;
`;

const StoreRatingText = styled.div`
  box-sizing: border-box;
  width: 30%;
  font-size: 1.15em;
  font-weight: 400;
  position: relative;
  line-height: 1.5em;
`;

const StoreRatingStars = styled.div`
  box-sizing: border-box;
  width: 70%;
  position: relative;
  display: block;
`;

const BrandMapContainer = styled.div`
  box-sizing: border-box;
  margin-top: 1vh;
  left: 3vw;
  width: 44vw;
  height: 24vw;
  aspect-ratio: 2 / 1.2;
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
  border-radius: 50px;
  background-color: #f0f0f0;
`;

const StoreLeftMenuTitle = styled.div`
  box-sizing: border-box;
  margin-top: 5vh;
  width: 80%;
  height: 40px;
  left: 3vw;
  margin-left: 10px;
  font-size: 1.5em;
  font-weight: 500;
  font-family: "Noto Sans KR", sans-serif;
  position: relative;
`;

const BrandMenuContainer = styled.div`
  margin-top: 1vh;
  box-sizing: border-box;
  left: 3vw;
  width: 44vw;
  height: 24vw;
  aspect-ratio: 2 / 1.2;
  position: relative;
  display: flex;
  justify-content: left;
  align-items: top;
  overflow: hidden;
  border-radius: 10px;
  gap: 10px;
  overflow-x: auto;
`;

const StoreDetailRight = styled.div`
  box-sizing: border-box;
  margin-top: 0;
  right: 0;
  width: 50vw;
  height: auto;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: left;
  position: sticky;
  top: 0;
  overflow-y: auto;
  overflow-x: hidden;
`;

const StoreReservationContainer = styled.div`
  box-sizing: border-box;
  margin-top: 2vh;
  width: 50vw;
  margin-left: 10px;
  position: relative;
`;

const StoreDetail = () => {
  const { storeNo } = useParams();
  const [store, setStore] = useState(null);
  const [ratings, setRatings] = useState([]);

  // 특정 매장 조회
  useEffect(() => {
    const getEachStore = async () => {
      try {
        const response = await AxiosApi.getEachStore(storeNo);
        setStore(response);
      } catch (error) {
        console.error("특정 매장 조회 오류 : ", error);
      }
    };
    getEachStore();
  }, [storeNo]);

  // 별점 조회
  useEffect(() => {
    const getRatingResults = async () => {
      try {
        const response = await AxiosApi.getRatingResults(storeNo);
        console.log(response);
        setRatings(response);
      } catch (error) {
        console.error("별점 가져오기 오류: ", error);
      }
    };
    getRatingResults();
  }, [storeNo]);

  // 리뷰 평점 계산
  const calculateAverageRating = (ratings) => {
    if (!ratings || ratings.length === 0) return 0;

    const totalPrice = ratings.reduce((sum, rating) => sum + rating.rvPrice, 0);
    const totalTaste = ratings.reduce((sum, rating) => sum + rating.rvTaste, 0);
    const totalVibe = ratings.reduce((sum, rating) => sum + rating.rvVibe, 0);
    const totalKind = ratings.reduce((sum, rating) => sum + rating.rvKind, 0);

    const numberOfRatings = ratings.length;
    const roundToNearestHalf = (value) => Math.round(value * 2) / 2; // 0.5 단위로 반올림

    const avgPrice = roundToNearestHalf(totalPrice / numberOfRatings);
    const avgTaste = roundToNearestHalf(totalTaste / numberOfRatings);
    const avgVibe = roundToNearestHalf(totalVibe / numberOfRatings);
    const avgKind = roundToNearestHalf(totalKind / numberOfRatings);

    return { avgPrice, avgTaste, avgVibe, avgKind };
  };

  const { avgPrice, avgTaste, avgVibe, avgKind } =
    calculateAverageRating(ratings);

  // store 데이터 로드 전 로딩 처리
  if (!store) {
    return <p>Store Loading</p>;
  }

  // 영업 중/영업 종료 상태 계산
  const openHour = parseInt(store.brandOpen, 10);
  const closeHour = parseInt(store.brandClose, 10);
  const currentHour = new Date().getHours();

  const isOpen =
    currentHour >= openHour && currentHour < closeHour
      ? `영업 중 · ${closeHour}:00에 영업 종료`
      : `영업 종료 · ${openHour}:00에 영업 시작`;

  return (
    <>
      <StoreName>{store.storeName}</StoreName>
      <Container>
        <StoreDetailLeft>
          <BrandImgContainer>
            <BrandImage src={store.brandImg2} />
          </BrandImgContainer>
          <StoreInfoContainer>
            <StoreAddrAndPhoneContainer>
              <StoreAddr>
                <p>{store.storeAddr}</p>
              </StoreAddr>
              <StoreHourContainer>
                <p>{isOpen}</p>
              </StoreHourContainer>
              <StorePhoneContainer>
                <StorePhone>
                  <p>{store.storePhone}</p>
                </StorePhone>
                <StorePhoneImg>
                  <PhoneFilled style={{ fontSize: "20px" }} />
                </StorePhoneImg>
              </StorePhoneContainer>
            </StoreAddrAndPhoneContainer>
            <StoreRatingContainer>
              <StoreRatingText>
                가격
                <br />맛<br />
                분위기
                <br />
                친절함
                <br />
              </StoreRatingText>
              <StoreRatingStars>
                <Rating
                  name="half-rating-read"
                  defaultValue={avgPrice}
                  precision={0.5}
                  readOnly
                />
                <br />
                <Rating
                  name="half-rating-read"
                  defaultValue={avgTaste}
                  precision={0.5}
                  readOnly
                />
                <br />
                <Rating
                  name="half-rating-read"
                  defaultValue={avgVibe}
                  precision={0.5}
                  readOnly
                />
                <br />
                <Rating
                  name="half-rating-read"
                  defaultValue={avgKind}
                  precision={0.5}
                  readOnly
                />
                <br />
              </StoreRatingStars>
            </StoreRatingContainer>
          </StoreInfoContainer>
          <StoreLeftMenuTitle>{store.storeName} 지도</StoreLeftMenuTitle>
          <BrandMapContainer>
            <StoreDetailMap />
          </BrandMapContainer>
          <StoreLeftMenuTitle>{store.storeName} 메뉴</StoreLeftMenuTitle>
          <BrandMenuContainer>
            <StoreDetailMenu />
          </BrandMenuContainer>
        </StoreDetailLeft>

        <StoreDetailRight>
          <StoreReservationContainer>
            <StoreDetailReservation />
          </StoreReservationContainer>
        </StoreDetailRight>
      </Container>
    </>
  );
};

export default StoreDetail;
