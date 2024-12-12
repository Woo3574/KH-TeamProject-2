import HomeItem from "../components/HomeItems";
import GlobalStyle from "../styles/GlobalStyle";
import { useCallback, useState, useEffect } from "react";
import AxiosApi from "../api/AxiosApi";

const PCMain = () => {

  // 카테고리 Dropdown 목록  
  const [brandName, setBrandName] = useState("");
  const [reservationTime, setReservationTime] = useState("");
  const [region, setRegion] = useState("")

  
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


  return (
    <>
      <GlobalStyle />
      {/* 디버깅용 상태 출력 */}
      {console.log("현재 stores 상태:", dataReceivedAfterSearch)}
      <HomeItem dataReceivedAfterSearch={dataReceivedAfterSearch}/>
    </>
  );
};

export default PCMain;
