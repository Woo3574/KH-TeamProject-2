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
  width: 40px;
  aspect-ratio: 1 / 1;
  min-width: 30px;
  min-height: 30px;
  background-color: black;
  border-radius: 50%;
  border: none;
  outline: none;
  background-image: url(https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2Fsearh.png?alt=media&token=cbfec402-d857-4edc-be0c-a8434cd526fb);
  background-size: 50% 50%;
  background-position: center;
  background-repeat: no-repeat;
  cursor: pointer;

  &:hover {
    opacity: 0.8;
  }

  &:active {
    transform: scale(0.95);
  }
`;

const NavBar1 = ({ onSearch }) => {
  const [isMobile, setIsMobile] = useState(window.innerWidth <= 760);
  const [mobileSearchData, setMobileSearchData] = useState("");

  // 화면 크기 변경 감지
  useEffect(() => {
    const handleResize = () => setIsMobile(window.innerWidth <= 760);
    window.addEventListener("resize", handleResize);
    return () => window.removeEventListener("resize", handleResize);
  }, []);

  // 검색어 상태 업데이트
  const writeData = (e) => {
    setMobileSearchData(e.target.value);
  };

  // 검색 버튼 클릭 시 부모 컴포넌트로 검색어 전달
  const handleSearch = () => {
    if (typeof onSearch === "function") {
      onSearch(mobileSearchData);  // 부모에게 검색어 전달
    } else {
      console.warn("onSearch prop이 전달되지 않았습니다.");
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

      {/* PC 화면: 오른쪽 프로필 이미지 */}
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
        /* 모바일 화면: 검색 입력 및 버튼 */
        <MobileRight>
          <WriteSearch>
            <p style={{ fontSize: "13px", fontWeight: "300" }}>찾으시는 곳이 있으신가요?</p>
            <MobileInput
              placeholder="검색해 보세요."
              value={mobileSearchData}
              onChange={writeData}  // 입력값 상태 업데이트
            />
          </WriteSearch>
          <MobileButton onClick={handleSearch} />  {/* 검색 버튼 클릭 시 handleSearch 호출 */}
        </MobileRight>
      )}
    </Background>
  );
};

export default NavBar1;
