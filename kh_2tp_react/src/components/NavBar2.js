import styled from "styled-components";
import StoreSearch from "../pages/stores/StoreSearch";

const Background = styled.div`
  width: 100%;
  height: 90px;
  top: 80px;
  left: 0;
  box-sizing: border-box;
  display: flex;
  justify-content: center;
  align-items: center;
  position: fixed;
  z-index: 1000; /* 다른 요소들 위에 표시되도록 설정 */
  background-color: #fff; /* 배경 색 */
  
  @media (max-width:760px) {
    display: none;
  }
`;



const NavBar2 = ({ getPCDataFromServerAndUpdateStoreList }) => {
  return (
    <>
      <Background>
        <StoreSearch
              getPCDataFromServerAndUpdateStoreList={
                getPCDataFromServerAndUpdateStoreList
              }
            />
      </Background>
    </>
  );
};

export default NavBar2;
