import styled from "styled-components";
import { useState, useMemo, useRef } from "react";
import { Link } from "react-router-dom";

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

const MobileHomeItemBlock = styled.div`
  width: 100%;
  box-sizing: border-box;
  display: flex;
  align-items: center;
  flex-direction: column;
  background-color: #fff;
`;

const DropdownContainer = styled.div`
  width: 100%;
  height: 30px;
  display: flex;
  justify-content: right;
  position: relative;
`;

const Dropdown = styled.select`
  height: 30px; /* 드롭다운의 고정 높이 */
  text-align: 30px;
  padding-left: 30px;
  font-size: 0.5em;
  border: none;
  border-bottom: 1px solid black;
  margin-right: 10px;
  margin-bottom: 10px;
  background-color: #fff;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  width: 120px;
  appearance: none;
  background-image: url("data:image/svg+xml;utf8,<svg fill='black' height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'><path d='M7 10l5 5 5-5z'/></svg>");
  background-repeat: no-repeat;
  background-position: right 2px center;
  &:focus {
    outline: none;
  }
  & option {
    padding: 10px;
    background-color: black;
    color: white;
  }
  & option:checked {
    background-color: black;
    color: white;
  }
`;

const Background = styled.div`
  width: 760px;
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  white-space: nowrap;
  scroll-behavior: smooth;
`;

const BrandContainer = styled.div`
  box-sizing: border-box;
  width: 100%;
  display: flex;
  flex-direction: column;  // 세로로 나열되도록 변경
  align-items: center;
  gap: 20px;
  position: relative;
`;

const BrandMain = styled.div`
  box-sizing: border-box;
  width: 195px;
  height: 160px;
  margin-top: 10px;
  margin-bottom: 10px;
  box-sizing: border-box;
  background-color: #e3e3e3;
  border-radius: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
`;

const BrandName = styled.div`
   box-sizing: border-box;
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 1.2em;  // 브랜드 이름 크기
  font-weight: bold;  // 브랜드 이름 강조
  color: black;
  background-color: #e3e3e3;  // 배경색 추가 (로고가 없을 때 대비용)
  border-radius: 10px;
`;

const StoresContainer = styled.div`
  width: 1060px;
  padding-left: 70px;
  padding-right: 70px;
  margin: 0 auto;
  position: relative;
  display: flex;
  flex-direction: column;  // 세로로 나열되도록 변경
  align-items: center;
  gap: 20px;
`;

const Stores = styled.div`
  box-sizing: border-box;
  display: flex;
  gap: 20px;
  width: 920px;
  white-space: nowrap;
  scroll-behavior: smooth;
  overflow-x: hidden;
  position: relative;
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

const ArrowButton = styled.button`
  position: absolute;
  width: 50px;
  height: 160px;
  background-color: #e3e3e3;
  color: black;
  border: none;
  cursor: pointer;
  z-index: 10;
  padding: 10px;
  font-size: 1em;
  border-radius: 10px;
  &.left-arrow {
    left: 0;
  }
  &.right-arrow {
    right: 0;
  }
`;

const MobileHome = ({ mobileDataReceivedAfterSearch }) => {
  const [sortType, setSortType] = useState("name");
  const [sortByDistance, setSortByDistance] = useState(false);
  const containerRefs = useRef([]);

  const setRef = (index) => (element) => {
    containerRefs.current[index] = element; // 해당 인덱스에 DOM 요소 할당
  };

  const referenceLat = 37.500666760224306;
  const referenceLon = 127.03646889929213;

  const stores = useMemo(() => {
    return Array.isArray(mobileDataReceivedAfterSearch) &&
      mobileDataReceivedAfterSearch.length > 0
      ? mobileDataReceivedAfterSearch.reduce((acc, curr) => {
          const brand = acc.find(
            (item) => item.brand.brandName === curr.brandVO.brandName
          );
          if (brand) {
            brand.stores.push(curr);
          } else {
            acc.push({
              brand: curr.brandVO,
              stores: [curr],
            });
          }
          return acc;
        }, [])
      : [];
  }, [mobileDataReceivedAfterSearch]);

  const sortedStores = useMemo(() => {
    return stores.map((brandData) => {
      let sortedStores = [...brandData.stores];

      if (sortByDistance) {
        sortedStores.sort((a, b) => {
          const distanceA = calculateDistance(
            referenceLat,
            referenceLon,
            a.storeLat,
            a.storeLon
          );
          const distanceB = calculateDistance(
            referenceLat,
            referenceLon,
            b.storeLat,
            b.storeLon
          );
          return distanceA - distanceB;
        });
      } else if (sortType === "name") {
        sortedStores.sort((a, b) => a.storeName.localeCompare(b.storeName));
      } else if (sortType === "rating") {
        sortedStores.sort(
          (a, b) => b.avgRatingVO.averageRating - a.avgRatingVO.averageRating
        );
      }

      return { ...brandData, stores: sortedStores };
    });
  }, [stores, sortType, sortByDistance]);

  if (!sortedStores || sortedStores.length === 0) {
    return <div>No stores available</div>;
  }

  const scrollLeft = (index) => {
    const ref = containerRefs.current[index];
    if (ref) {
      ref.scrollBy({
        left: -300,
        behavior: "smooth",
      });
    }
  };

  const scrollRight = (index) => {
    const ref = containerRefs.current[index];
    if (ref) {
      ref.scrollBy({
        left: 300,
        behavior: "smooth",
      });
    }
  };

  const handleSortChange = (e) => {
    const value = e.target.value;
    if (value === "distance") {
      setSortType(null);
      setSortByDistance((prev) => !prev);
    } else {
      setSortType(value);
      setSortByDistance(false);
    }
  };

  return (
    <>
      <MobileHomeItemBlock>
        <DropdownContainer>
          <Dropdown onChange={handleSortChange}>
            <option value="" hidden>
              정렬 방식 선택
            </option>
            <option value="name">자음순</option>
            <option value="rating">별점순</option>
            <option value="distance">거리순</option>
          </Dropdown>
        </DropdownContainer>
        <Background>
          <BrandContainer>
            {sortedStores.map((brandData, index) => (
              <div key={brandData.brand.brandName}>
                <StyledLink
                  to={`/brand/${brandData.brand.brandNo}`}
                  key={brandData.brand.brandNo}
                >
                  <BrandMain>
                    <BrandName>
                      {brandData.brand.brandName} {/* 브랜드 이름 표시 */}
                    </BrandName>
                  </BrandMain>
                </StyledLink>

                <StoresContainer>
                  <ArrowButton
                    className="left-arrow"
                    onClick={() => scrollLeft(index)}
                  >
                    &lt;
                  </ArrowButton>
                  <Stores ref={setRef(index)}>
                    {brandData.stores.map((store) => (
                      <StyledLink to={`/stores/${store.storeNo}`} key={store.storeNo}>
                        <EachStore>
                          <EachImage
                            style={{
                              backgroundImage: `url(${brandData.brand.brandImg1})`,
                            }}
                          ></EachImage>
                          <EachTextContainer>
                            <EachText1>{store.storeName}</EachText1>
                            <EachText2>
                              <p style={{ color: "RED", display: "inline" }}>
                                ★{" "}
                              </p>
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
                  </Stores>
                  <ArrowButton
                    className="right-arrow"
                    onClick={() => scrollRight(index)}
                  >
                    &gt;
                  </ArrowButton>
                </StoresContainer>
              </div>
            ))}
          </BrandContainer>
        </Background>
      </MobileHomeItemBlock>
    </>
  );
};

export default MobileHome;