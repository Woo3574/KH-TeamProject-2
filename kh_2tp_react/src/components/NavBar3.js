/* eslint-disable react/jsx-pascal-case */
import styled from "styled-components";
import { useRef, useState, useEffect } from "react";
import AxiosApi from "../api/AxiosApi";
import { useNavigate } from "react-router-dom";

const Background = styled.div`
  width: 100%;
  height: 90px;
  top: 170px;
  left: 0;
  box-sizing: border-box;
  border: 1px solid #e4e4e4;
  display: flex;
  align-items: center;
  position: fixed;
  z-index: 1000;
  background-color: #fff;
`;

const BrandContainerWrapper = styled.div`
  width: 1280px;
  margin: 0 auto;
  position: relative;
  display: flex;
  align-items: center;
  white-space: nowrap;
  overflow-x: hidden;
  scroll-behavior: smooth;
`;

const ArrowButton = styled.button`
  position: absolute;
  background-color: rgba(0, 0, 0, 0.5);
  color: white;
  border: none;
  cursor: pointer;
  z-index: 10;
  padding: 10px;
  font-size: 0.5em;
  line-height: 1.2em;
  border-radius: 30px;
  &.left-arrow {
    left: 0;
  }
  &.right-arrow {
    right: 0;
  }
`;

const FadeLeft = styled.div`
  top: 0;
  left: 0;
  position: absolute;
  width: 50px;
  height: 100%;
  background: linear-gradient(
    to right,
    rgba(255, 255, 255, 1),
    rgba(255, 255, 255, 0)
  );
  pointer-events: none;
  z-index: 5;
  margin-left: 30px;
`;

const FadeRight = styled.div`
  top: 0;
  right: 0;
  position: absolute;
  width: 50px;
  height: 100%;
  background: linear-gradient(
    to left,
    rgba(255, 255, 255, 1),
    rgba(255, 255, 255, 0)
  );
  pointer-events: none;
  z-index: 5;
  margin-right: 30px;
`;

const BrandContainer = styled.div`
  width: 1280px;
  margin: 0 30px;
  display: flex;
  align-items: center;
  gap: 12.5px;
  overflow-x: hidden;
  white-space: nowrap;
  scroll-behavior: smooth;
  position: relative;
`;

const EachBrand = styled.div`
  width: 65px;
  height: 65px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  transition: transform 0.3s ease-in-out;
  cursor: pointer;
`;

const EachImage = styled.div`
  width: 40px;
  height: 40px;
  display: flex;
  justify-content: center;
  align-items: center;
  object-fit: cover;
  img {
    height: 100%;
  }
`;

const EachText = styled.div`
  width: 65px;
  font-size: 12px;
  text-align: center;
  margin-top: 5px;
  color: #6c6c6c;
`;

const NavBar3 = () => {
  const [brandLogos, setBrandLogos] = useState([]);
  const containerRef = useRef(null);
  const navigate = useNavigate(); // 페이지 이동을 위한 훅

  // 브랜드 로고 가져오기
  useEffect(() => {
    const getBrandLogos = async () => {
      try {
        const response = await AxiosApi.getBrandLogos();
        setBrandLogos(response);
      } catch (error) {
        console.error("Error fetching brandLogos:", error);
      }
    };
    getBrandLogos();
  }, []);

  // 화살표 한번 클릭시 이동량
  const scrollAmount = 300;

  // 왼쪽 화살표 클릭
  const scrollLeft = () => {
    if (containerRef.current) {
      containerRef.current.scrollBy({
        left: -scrollAmount,
      });
    }
  };

  // 오른쪽 화살표 클릭
  const scrollRight = () => {
    if (containerRef.current) {
      containerRef.current.scrollBy({
        left: scrollAmount,
      });
      console.log(containerRef.current);
    }
  };

  return (
    <>
      <Background>
        <BrandContainerWrapper>
          <ArrowButton className="left-arrow" onClick={scrollLeft}>
            ◀
          </ArrowButton>
          <FadeLeft />

          <BrandContainer ref={containerRef}>
            {brandLogos.map((brandLogo, index) => (
              <EachBrand
                key={index}
                onClick={() => navigate(`/brand/${brandLogo.brandNo}`)}
              >
                <EachImage>
                  <img
                    src={brandLogo.brandLogo1}
                    alt={`${brandLogo.brandName}`}
                  />
                </EachImage>
                <EachText>{brandLogo.brandName}</EachText>
              </EachBrand>
            ))}
          </BrandContainer>

          <FadeRight />
          <ArrowButton className="right-arrow" onClick={scrollRight}>
            ▶
          </ArrowButton>
        </BrandContainerWrapper>
      </Background>
    </>
  );
};

export default NavBar3;
