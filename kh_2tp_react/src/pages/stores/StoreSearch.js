import { useEffect, useState } from "react";
import styled from "styled-components";
import AxiosApi from "../../api/AxiosApi";
import { useNavigate } from "react-router-dom";

const Container =styled.div`
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  
  @media (max-width:760px) {
    display: none;
  }
`;

const SearchBox = styled.div`
  width: 72%;
  height: 65px;
  border: 1px solid #d9d9d9;
  border-radius: 50px;
  box-shadow: 0px 2px 10px 2px rgba(0, 0, 0, 0.1);
  display: flex;
  justify-content: center;
  align-items: center;

  @media (max-width:780px) {
    height: auto;
  
  }
`;

const DropdownContainer = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  gap: calc(6px + 1vw); /* 드롭다운 간의 간격을 20px로 설정 */
`;

const Dropdown = styled.select`
  width: 100%;
  height: 100%;
  padding: 10px 15px;
  font-size: 16px;
  border: none;
  border-radius: 5px;
  margin-right: 10px;
  background-color: #fff;
  font-size: calc(5px + 0.8vw);
  cursor: pointer;
  transition: all 0.3s ease;

  &:hover {
    border-color: #3498db;
  }

  &:focus {
    border-color: #3498db;
    outline: none;
  }

  option {
    width: 100%;

  }

  @media (max-width: 768px) {
    font-size: calc(5px + 1vw); // 작은 화면에서의 최소 글자 크기
    padding: 5px 10px; // 작은 화면에서 패딩 조정
  }

`;

const Button = styled.button`
  width: 13vw; /* 원의 너비 */
  aspect-ratio: 1 / 1; /* 넓이와 높이를 1 : 1 비율로 유지 시킴 */
  min-width: 30px;
  min-height: 30px;
  background-color: black; /* 원의 배경색 */
  border-radius: 50%; /* 둥근 모양 */
  border: none; /* 기본 버튼 테두리 제거 */
  outline: none; /* 포커스 시 나타나는 테두리 제거 */
  background-image: url(https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2Fsearh.png?alt=media&token=cbfec402-d857-4edc-be0c-a8434cd526fb); /* 동적으로 이미지 경로 설정 */
  background-size: 50% 50%; /* 이미지 크기 맞춤 */
  background-position: center; /* 이미지 위치 */
  background-repeat: no-repeat; /* 이미지가 반복되지 않도록 설정 */
  cursor: pointer; /* 클릭 가능한 포인터 */

  /* 호버 및 클릭 시 효과 */
  &:hover {
    opacity: 0.8; /* 호버 효과 */
  }

  &:active {
    transform: scale(0.95); /* 클릭 시 살짝 축소 */
  }
`;

//--------------------------------------------------------------------------------------------------------

const StoreSearch = ({ getPCDataFromServerAndUpdateStoreList }) => {
  const [categories, setCategories] = useState({
    region: [],
    brandName: [],
  });

  const [regionValue, setRegionValue] = useState("");
  const [brandNameValue, setBrandNameValue] = useState("");
  const [reservationTimeValue, setReservationTimeValue] = useState("");
  const navigate = useNavigate(); // useNavigate 훅 사용

  // 메인 화면 가져오기
  useEffect(() => {
    const fetchCategories = async () => {
      try {
        const response = await AxiosApi.getCategories();
        setCategories({
          region: response.region || [],
          brandName: response.brandName || [],
        });
      } catch (error) {
        console.error("카테고리 목록 가져오기 실패:", error);
      }
    };
    fetchCategories();
  }, []);

  // NavBar 예약 시간 선택
  const reservationTimes = Array.from({ length: 24 }, (_, index) => {
    return `${index + 1}:00`; 
  });

  const handleSearchButtonClick = () => {
    getPCDataFromServerAndUpdateStoreList(regionValue, brandNameValue, reservationTimeValue);
    navigate("/"); // main 화면으로 이동
  };


  return (
  
    <Container>
      <SearchBox>
        <DropdownContainer>
          <Dropdown value={regionValue} onChange={(e) => setRegionValue(e.target.value)}>
            <option value="">지역 선택</option>
            {categories.region.map((item, index) => (
              <option key={index} value={item}>{item}</option>
            ))}
          </Dropdown>

          <Dropdown value={brandNameValue} onChange={(e) => setBrandNameValue(e.target.value)}>
            <option value="">브랜드 선택</option>
            {categories.brandName.map((item, index) => (
              <option key={index} value={item}>{item}</option>
            ))}
          </Dropdown>

          <Dropdown value={reservationTimeValue} onChange={(e) => setReservationTimeValue(e.target.value)}>
            <option value="">예약 시간 선택</option>
            {reservationTimes.map((time, index) => (
              <option key={index} value={time}>{time}</option>
            ))}
          </Dropdown>

          <Button onClick={handleSearchButtonClick} />
        </DropdownContainer>
      </SearchBox>
    </Container>
  );
};

export default StoreSearch;
