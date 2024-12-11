/* eslint-disable react/jsx-pascal-case */
import { Link } from "react-router-dom";
import styled from "styled-components";

const Background = styled.div`
  width: 100%;
  height: 80px;
  top: 0;
  left: 0;
  display: flex;
  flex-direction: row;
  justify-content: space-between; /* 양쪽 끝으로 배치 */
  align-items: center; /* 세로 가운데 정렬 */
  position: fixed;
  z-index: 1000; /* 다른 요소들 위에 표시되도록 설정 */
  background-color: #fff; /* 배경 색 */
`;

const Left = styled.div`
  margin-left: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
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
  text-align: center;
  img {
    height: 48px;
  }
`;

const NavBar1 = () => {
  return (
    <>
      <Background>
        <Left>
          <Link to="/">
            <img
              src="https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F00백부커02B.png?alt=media&token=9bccec14-c221-42c0-8342-16f463bcb1f0"
              alt="Logo"
            />
          </Link>
        </Left>
        <Right>
          <Link to="/LoginHome">
          <img
            src="https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FProfile.png?alt=media&token=6f3e2ec4-737f-4646-9d52-254c21319266"
            alt="Profile"
          />
          </Link>
        </Right>
      </Background>
    </>
  );
};

export default NavBar1;
