import { Outlet, useLocation } from "react-router-dom";
import styled from "styled-components";
import NavBar1 from "../components/NavBar1";
import NavBar2 from "../components/NavBar2";
import NavBar3 from "../components/NavBar3";
import PCHome from "../components/PCHome";
import { useState, useEffect, useCallback } from "react";
import AxiosApi from "../api/AxiosApi";
import MobileHome from "../components/MobileHome";

const StyledHeader = styled.header`
  width: 100%;
  height: 260px;

  @media (max-width:760px) {
    width: 100%;
    height: 160px;
    display: flex;
    flex-direction: row;
  }
`;

const StyledMain = styled.main`
  width: 100%;
  height: calc(100vh - 260px);
`;

const Layout = () => {
  // 카테고리 Dropdown 목록
  const [brandName, setBrandName] = useState("");
  const [reservationTime, setReservationTime] = useState("");
  const [region, setRegion] = useState("");
  const location = useLocation(); // 현재 경로 가져오기

  // Main 화면 띄어주는 Component에 Data 전달 (조건 검색 후 받은 Data[])
  const [PCdataReceivedAfterSearch, setPCDataReceivedAfterSearch] = useState([]); // 검색된 매장들

  // 컴포넌트가 처음 로드될 때, 기본적으로 모든 매장을 가져오는 검색
  const getPCDataFromServerAndUpdateStoreList = useCallback(
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
        setPCDataReceivedAfterSearch(response); // 검색된 매장들 상태 업데이트
      } catch (error) {
        console.error("검색 실패:", error);
      }
    },
    []
  );

  useEffect(() => {
    getPCDataFromServerAndUpdateStoreList(region, brandName, reservationTime);
  }, [getPCDataFromServerAndUpdateStoreList, region, brandName, reservationTime]);


  // {UP} PC Version Data통신----------------------------------------------------------------------------------

  // {DOWN} Mobile Version Data 통신---------------------------------------------------------------------------

  const [mobileDataReceivedAfterSearch, setMobileDataReceivedAfterSearch] = useState([]); // 검색된 매장들
   
  // NavBar1에서 받은 검색 데이터를 백엔드로 보내는 함수
  const handleSearch = async (searchData) => {
    try {
      console.log("NavBar1에서 받은 데이터:", searchData);
      
      // Axios를 이용한 API 호출
      const rsp = await AxiosApi.getMobileHomeData(searchData);

      if (rsp.data && rsp.data.length > 0) {
        console.log("백엔드에서 받은 검색 결과:", rsp.data);
      } else {
        console.log("검색 결과가 없습니다.");
      }

      // 검색 결과를 상태로 저장하여 화면에 반영
      setMobileDataReceivedAfterSearch(rsp.data || []);
    } catch (error) {
      console.error("백엔드 통신 에러:", error);
    }
  };


  //------------------------------------------------------------------------------
    const [isMobile, setIsMobile] = useState(false);
  
    useEffect(() => {
      const handleResize = () => {
        // 화면 너비가 특정 값 이하일 때 모바일로 간주 (예: 768px 이하)
        setIsMobile(window.innerWidth <= 760);
      };
  
      // 초기화 및 리사이즈 이벤트 리스너
      handleResize();
      window.addEventListener('resize', handleResize);
  
      // 클린업
      return () => window.removeEventListener('resize', handleResize);
    }, []);
  
  return (
    <>
      <StyledHeader>
      <NavBar1 onSearch={(searchData) => {
        console.log("onSearch 호출됨, searchData:", searchData);
        handleSearch(searchData);
      }} />
        <NavBar2
          getPCDataFromServerAndUpdateStoreList={
            getPCDataFromServerAndUpdateStoreList
          }
        />
        <NavBar3 />
      </StyledHeader>

      <StyledMain>
        {/* 디버깅용 상태 출력 */}
        {console.log("현재 stores 상태:", PCdataReceivedAfterSearch)}{""}
        {location.pathname === "/" && !isMobile && (
        <PCHome PCdataReceivedAfterSearch={PCdataReceivedAfterSearch} />
      )}
      {location.pathname === "/" && isMobile && (
        <MobileHome mobileDataReceivedAfterSearch={mobileDataReceivedAfterSearch} />
      )}
        <Outlet />
      </StyledMain>
    </>
  );
};

export default Layout;
