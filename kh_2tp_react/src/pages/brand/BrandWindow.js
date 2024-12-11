import { useParams } from "react-router-dom";
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
  .container {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 20px;
  }
  .brandWrapper {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 20px;
    margin-bottom: 40px;
  }
  .brandLogo {
    width: 1680px;
    height: 300px;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
    background-color: #f1f1f1;
    border-radius: 10px;
  }
  .stores {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
    width: 80%;
    margin-top: 20px;
  }
  .storeBox {
    width: 100%;
    height: 276px;
    background-color: #f1f1f1;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    position: relative;
  }
  .storeBoxUp {
    width: 100%;
    height: 100%;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
  }
  .storeBoxDown {
    padding: 10px;
    display: flex;
    flex-direction: column;
  }
  .storeName {
    font-size: 16px;
  }
  .storeInfo {
    font-size: 14px;
  }
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
          return b.avgRatingVO.averageRating - a.avgRatingVO.averageRating
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
        <div className="container">
          <div className="brandWrapper">
            {/* 브랜드 로고 이미지 */}
            <div
              className="brandLogo"
              style={{ backgroundImage: `url(${brandData[0].brandVO.brandLogo2 || 'defaultLogoURL'})` }}
            />
          </div>

          <div className="stores">
            {brandData.map((store) => (
              <div className="storeBox" key={store.storeNo}>
                <div
                  className="storeBoxUp"
                  style={{
                    backgroundImage: `url(${store.brandVO.brandImg || 'defaultImageURL'})`, // 기본 이미지 URL 사용
                  }}
                />
                <div className="storeBoxDown">
                  <div className="storeName">{store.storeName}</div>
                  <div className="storeInfo">
                  <p style={{ color: "RED", display: "inline" }}>★ </p>
                        <p style={{ display: "inline" }}>
                          {store.avgRatingVO.averageRating}
                        </p>
                  <p 
                  style={{
                  color: "#a4a4a4",
                  display: "inline",
                  fontSize: "13px",
                  }} >
                  {store.brandVO.brandFood}ㆍ{store.storeAddr}
                  </p>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </BrandStoresBlock>
    </>
  );
};

export default BrandWindow;
