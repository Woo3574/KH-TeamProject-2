import { useParams, Link } from "react-router-dom";
import { useEffect, useState } from "react";
import AxiosApi from "../../api/AxiosApi";
import styled from "styled-components";

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

  return (
    <>
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