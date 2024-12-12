import { Link } from "react-router-dom";
import styled from "styled-components";
import { useEffect, useState } from "react";

const Background = styled.div`
  width: 100%;
  height: 80px;
  top: 0;
  left: 0;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  position: fixed;
  z-index: 1000;
  background-color: #fff;

  @media (max-width: 760px) {
    height: 70px;
    padding: 15px;
  }
`;

const Left = styled.div`
  margin-left: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;

  img {
    width: 76px;
  }
`;

const Right = styled.div`
  margin-right: 40px;
  display: flex;
  align-items: center;
  justify-content: center;

  img {
    height: 48px;
  }

  @media (max-width: 760px) {
      display: none;
  }
`;

// 모바일 화면시 ------------------------------------------------------------

const MobileRight = styled.div`
  width: 60%;
  height: 100%;
  padding: 15px;
  border: none;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
`;

const WriteSearch = styled.div`
display: flex;
flex-direction: column;
`;

const MobileInput = styled.input`
  width: 100%;
  height: 20px;
  font-size: 13px;
  border: none;
`;

const MobileButton = styled.button`
  width: 40px; /* 원의 너비 */
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

const NavBar1 = ({onSearch}) => {
  const [isMobile, setIsMobile] = useState(window.innerWidth <= 760);
  const [mobileSearchData, setMobileSearchData] = useState("");

  // 화면 크기 변경 감지
  useEffect(() => {
    const handleResize = () => setIsMobile(window.innerWidth <= 760);
    window.addEventListener("resize", handleResize);
    return () => window.removeEventListener("resize", handleResize);
  }, []);

  const writeData = (e) => {
    setMobileSearchData(e.target.value)
  }

 
  const handleSearch = () => {
    if (typeof onSearch === "function") {
      onSearch(mobileSearchData);
    } else {
      console.warn("onSearch prop이132 전달되지 않았습니다.");
    }
  };

  return (
    <Background>
      <Left>
        <Link to="/">
          <img
            src="https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F00백부커02B.png?alt=media&token=9bccec14-c221-42c0-8342-16f463bcb1f0"
            alt="Logo"
          />
        </Link>
      </Left>
      {!isMobile ? (
        <Right>
          <Link to="/LoginHome">
            <img
              src="https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FProfile.png?alt=media&token=6f3e2ec4-737f-4646-9d52-254c21319266"
              alt="Profile"
            />
          </Link>
        </Right>
      ) : (     
        <MobileRight>
          <WriteSearch>
              <p style={{fontSize: '13px', fontWeight:'300'}}>찾으시는 곳이 있으신가요?</p>
              <MobileInput placeholder="검색해 보세요." value={mobileSearchData} onChange={writeData}/>
          </WriteSearch>
          <MobileButton onClick={handleSearch}/>
        </MobileRight>
      )}
    </Background>
  );
};

export default NavBar1;
