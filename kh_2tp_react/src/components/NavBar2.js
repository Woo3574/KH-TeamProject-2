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
`;

const NavBar2 = ({ getDataFromServerAndUpdateStoreList }) => {
  return (
    <>
      <Background>
        <SearchBox>
        <StoreSearch
              getDataFromServerAndUpdateStoreList={
                getDataFromServerAndUpdateStoreList
              }
            />
        </SearchBox>
      </Background>
    </>
  );
};

export default NavBar2;
