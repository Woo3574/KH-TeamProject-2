import { Outlet, useLocation } from "react-router-dom";
import styled from "styled-components";
import NavBar1 from "../components/NavBar1";
import NavBar2 from "../components/NavBar2";
import NavBar3 from "../components/NavBar3";
import PCHome from "../components/PCHome";
import { useState, useEffect, useCallback } from "react";
import AxiosApi from "../api/AxiosApi";

const StyledHeader = styled.header`
  width: 100%;
  height: 260px;

  @media (max-width:760px) {
    width: 100%;
    height: 70px;
    display: flex;
    flex-direction: row;
  }
`;

const StyledMain = styled.main`
  height: calc(100vh - 260px);

  @media (max-width:760px) {
    width: 100%;
    height: calc(100vh - 170px);
  }
`;

const Layout = () => {
  // 카테고리 Dropdown 목록
  const [brandName, setBrandName] = useState("");
  const [reservationTime, setReservationTime] = useState("");
  const [region, setRegion] = useState("");
  const location = useLocation(); // 현재 경로 가져오기

  // Main 화면 띄어주는 Component에 Data 전달 (조건 검색 후 받은 Data[])
  const [dataReceivedAfterSearch, setDataReceivedAfterSearch] = useState([]); // 검색된 매장들

  // 컴포넌트가 처음 로드될 때, 기본적으로 모든 매장을 가져오는 검색
  const getDataFromServerAndUpdateStoreList = useCallback(
    async (region, brandName, reservationTime) => {
      try {
        // console.log("검색 조건:", { region, brandName, reservationTime }); // 파라미터 확인
        // API 호출을 통해 조건에 맞는 데이터를 가져옵니다.
        const response = await AxiosApi.navBarSearching(region, brandName, reservationTime);

        // if (response.data && response.data.length > 0) {
        //   console.log("검색된 매장들:", response.data);
        // } else {
        //   console.log("검색된 매장이 없습니다.");
        // }
        setDataReceivedAfterSearch(response); // 검색된 매장들 상태 업데이트
      } catch (error) {
        console.error("검색 실패:", error);
      }
    },
    []
  );

  useEffect(() => {
    getDataFromServerAndUpdateStoreList(region, brandName, reservationTime);
  }, [getDataFromServerAndUpdateStoreList, region, brandName, reservationTime]);


  // 위에는 PCHome Data통신----------아래는 MobileHome Data 통신---------------------------------------------------------------------------
  const [mobileSearchData, setMobileSearchDAta] = useState("");

  const handleSearch = useCallback(async (searchData) => {
    console.log("검색어:", searchData); // 검색어 확인
    if (searchData === mobileSearchData) {
      console.log("검색어가 동일하므로 API 호출을 생략합니다.");
      return;
    }
    setMobileSearchDAta(searchData);
  
    if (searchData) {
      try {
        const rsp = await AxiosApi.getMobileHomeData(searchData);
        setDataReceivedAfterSearch(rsp);
      } catch (error) {
        console.error("검색 실패:", error);
      }
    } else {
      getDataFromServerAndUpdateStoreList(region, brandName, reservationTime);
    }
  }, [mobileSearchData, region, brandName, reservationTime, getDataFromServerAndUpdateStoreList]);
  
   

  
  return (
    <>
      <StyledHeader>
      <NavBar1 onSearch={(searchData) => {
        console.log("onSearch 호출됨, searchData:", searchData);
        handleSearch(searchData);
      }} />
        <NavBar2
          getDataFromServerAndUpdateStoreList={
            getDataFromServerAndUpdateStoreList
          }
        />
        <NavBar3 />
      </StyledHeader>

      <StyledMain>
        {/* 디버깅용 상태 출력 */}
        {console.log("현재 stores 상태:", dataReceivedAfterSearch)}{""}
        {location.pathname === "/" && (
        <PCHome dataReceivedAfterSearch={dataReceivedAfterSearch} />
      )}
        <Outlet />
      </StyledMain>
    </>
  );
};

export default Layout;
