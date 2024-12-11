import { useParams, Link } from "react-router-dom";
import { useEffect, useState } from "react";
import AxiosApi from "../../api/AxiosApi";
import styled from "styled-components";

// 두 위도-경도 좌표 간의 거리를 계산하는 Haversine 공식
const calculateDistance = (lat1, lon1, lat2, lon2) => {
  // 각도를 라디안으로 변환하는 함수
  const toRad = (value) => (value * Math.PI) / 180;

  const R = 6371; // 지구의 반지름 (단위: 킬로미터)

  // 위도와 경도의 차이를 라디안으로 변환
  const deltaLat = toRad(lat2 - lat1); // 위도의 차이
  const deltaLon = toRad(lon2 - lon1); // 경도의 차이

  // Haversine 공식에서 사용되는 값 계산
  const a =
    Math.sin(deltaLat / 2) * Math.sin(deltaLat / 2) + // 위도 차이에 대한 함수
    Math.cos(toRad(lat1)) * // 첫 번째 좌표의 위도에 대한 함수
      Math.cos(toRad(lat2)) * // 두 번째 좌표의 위도에 대한 함수
      Math.sin(deltaLon / 2) *
      Math.sin(deltaLon / 2); // 경도 차이에 대한 함수

  // 두 점 간의 중앙각을 계산
  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

  // 거리를 계산하여 반환 (단위: 킬로미터)
  return R * c;
};

const SortBy = styled.div`
  display: flex;
  justify-content: end;
  margin-top: 10px;
  margin-right: 100px;

  /* 3D effect on the buttons */
  perspective: 230px;

  button {
    width: 80px;
    height: 30px;
    line-height: 30px;
    font-weight: 600;
    background: none;
    border: none;
    cursor: pointer;
    position: relative;
    overflow: hidden;
    perspective: inherit; /* Ensure that perspective is inherited from the parent */
  }

  button span {
    display: block;
    position: absolute;
    width: 100%;
    height: 100%;
    border: 2px solid #000;
    text-align: center;
    box-sizing: border-box;
    transition: all 0.3s ease-in-out;
    transform-style: preserve-3d;
    font-size: 12px;
    top: 0;
    left: 0;
    transform-origin: 50% 50%;
  }

  /* First span - initial rotation state */
  button span:nth-child(1) {
    box-shadow: -7px -7px 20px 0px #fff9, -4px -4px 5px 0px #fff9,
      7px 7px 20px 0px #0002, 4px 4px 5px 0px #0001;
    -webkit-transform: rotateX(90deg);
    -moz-transform: rotateX(90deg);
    transform: rotateX(90deg);
    -webkit-transform-origin: 50% 50% -20px;
    -moz-transform-origin: 50% 50% -20px;
    transform-origin: 50% 50% -20px;
    transform: rotateX(90deg); /* Initially rotated vertically */
  }

  /* Second span - initially in view */
  button span:nth-child(2) {
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
    transform: rotateX(0deg);
    -webkit-transform-origin: 50% 50% -20px;
    -moz-transform-origin: 50% 50% -20px;
    transform-origin: 50% 50% -20px;
  }

  /* Hover state */
  button:hover span:nth-child(1) {
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
    transform: rotateX(0deg);
  }

  button:hover span:nth-child(2) {
    background: #e0e5ec;
    color: #e0e5ec;
    -webkit-transform: rotateX(-90deg);
    -moz-transform: rotateX(-90deg);
    transform: rotateX(-90deg);
  }
`;

const BrandStoresBlock = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 20px;
`;

const BrandContainer = styled.div`
  width: 1280px;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 20px;
  margin-bottom: 20px;
  background-color: #e3e3e3;
  border-radius: 10px;
`;

const BrandLogo = styled.div`
  width: 300px;
  height: 300px;
  background-size: contain;
  background-repeat: no-repeat;
  background-position: center;
  border-radius: 10px;
`;

const StoresContainer = styled.div`
  width: 1280px;
  padding-left: 3.5px;
  padding-bottom: 100px;
  margin: 0 auto;
  position: relative;
  display: flex;
  align-items: center;
  white-space: nowrap;
  justify-content: baseline;
  gap: 20px;
`;

const EachStore = styled.div`
  box-sizing: border-box;
  width: 195px;
  height: 160px;
  border-radius: 10px;
  background-color: #e3e3e3;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  position: relative;
`;

const EachImage = styled.div`
  box-sizing: border-box;
  width: 195px;
  height: 140px;
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
`;

const EachTextContainer = styled.div`
  box-sizing: border-box;
  padding-left: 10px;
  padding-bottom: 5px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: start;
`;

const EachText1 = styled.div`
  box-sizing: border-box;
  width: 175px;
  padding-top: 5px;
  height: 24px;
  font-size: 0.8em;
  word-wrap: break-word;
  overflow-wrap: break-word;
  word-break: break-word;
  white-space: no;
  overflow: hidden;
`;

const EachText2 = styled.div`
  box-sizing: border-box;
  font-size: 0.7em;
`;

const StyledLink = styled(Link)`
  text-decoration: none;
  color: #000;
  font-weight: bold;
  transition: color 0.3s;
`;

const BrandWindow = () => {
  const { brandNo } = useParams(); // URL 파라미터에서 brandNo 추출
  const [brandData, setBrandData] = useState(null); // 브랜드 데이터를 저장할 상태
  const [loading, setLoading] = useState(true); // 로딩 상태 관리
  const [error, setError] = useState(null); // 에러 상태 관리
  const [sortType, setSortType] = useState("name"); // 기본 정렬 방식
  const [sortByDistance, setSortByDistance] = useState(false); // 거리 기준 정렬

  // API 호출을 통해 브랜드 정보를 가져오는 함수
  useEffect(() => {
    const fetchBrandData = async () => {
      setLoading(true);
      setError(null);
      try {
        const response = await AxiosApi.getBrandDetails(brandNo);
        console.log(response); // 응답 확인
        setBrandData(response.data); // brandData 업데이트
      } catch (error) {
        console.error("Error fetching brand details: ", error); // 에러 로그 추가
        setError("Error fetching brand details: " + error.message);
      } finally {
        setLoading(false);
      }
    };

    fetchBrandData();
  }, [brandNo]);

  // 로딩 중일 때 표시할 UI
  if (loading) {
    return <div></div>;
  }

  // 에러가 발생한 경우
  if (error) {
    return <div>{error}</div>;
  }

  const sortedStores = brandData.stores
    ? brandData.stores.sort((a, b) => {
        if (sortType === "rating") {
          return b.avgRatingVO.averageRating - a.avgRatingVO.averageRating;
        } else if (sortType === "name") {
          return a.storeName.localeCompare(b.storeName);
        }
        return 0;
      })
    : [];

  return (
    <>
      <SortBy>
        <button
          onClick={() => {
            setSortType("name");
            setSortByDistance(false);
          }}
        >
          <span>CLICK</span>
          <span data-text="자음순">자음순</span>
        </button>
        <button
          onClick={() => {
            setSortType("rating");
            setSortByDistance(false);
          }}
        >
          <span>CLICK</span>
          <span data-text="별점순">별점순</span>
        </button>
        <button
          onClick={() => {
            setSortType(null);
            setSortByDistance((prev) => !prev);
          }}
        >
          <span>CLICK</span>
          <span data-text="거리순">거리순</span>
        </button>
      </SortBy>
      <BrandStoresBlock>
        <BrandContainer>
          <BrandLogo
            style={{
              backgroundImage: `url(${
                brandData[0].brandVO.brandLogo2 || "defaultLogoURL"
              })`,
            }}
          />
        </BrandContainer>

        <StoresContainer>
          {brandData.map((store) => (
            <StyledLink to={`/stores/${store.storeNo}`} key={store.storeNo}>
              <EachStore key={store.storeNo}>
                <EachImage
                  style={{
                    backgroundImage: `url(${
                      store.brandVO.brandImg1 || "defaultImageURL"
                    })`, // 기본 이미지 URL 사용
                  }}
                />
                <EachTextContainer>
                  <EachText1>{store.storeName}</EachText1>
                  <EachText2>
                    <p style={{ color: "RED", display: "inline" }}>★ </p>
                    <p style={{ display: "inline" }}>
                      {store.avgRatingVO.averageRating}
                    </p>
                    <p
                      style={{
                        color: "#a4a4a4",
                        display: "inline",
                        marginLeft: "5px",
                      }}
                    >
                      {store.brandVO.brandFood}ㆍ{store.storeAddr}
                    </p>
                  </EachText2>
                </EachTextContainer>
              </EachStore>
            </StyledLink>
          ))}
        </StoresContainer>
      </BrandStoresBlock>
    </>
  );
};

export default BrandWindow;
