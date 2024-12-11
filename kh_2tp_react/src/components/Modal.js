// Modal.js
import React from "react";
import styled from "styled-components";

// 모달 컴포넌트
const Modal = ({ show, onClose, children }) => {
  if (!show) return null; // show가 false면 아무것도 렌더링 하지 않음

  return (
    <ModalOverlay onClick={onClose}>
      <ModalContent onClick={(e) => e.stopPropagation()}>
        {" "}
        {/* 클릭 시 모달 내부 클릭은 무시 */}
        <CloseButton onClick={onClose}>×</CloseButton>
        {children}
      </ModalContent>
    </ModalOverlay>
  );
};

// 모달 오버레이 (배경)
const ModalOverlay = styled.div`
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5); // 반투명 배경
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000; // 모달이 다른 요소들 위에 보이도록
`;

// 모달 콘텐츠 (내용 부분)
const ModalContent = styled.div`
  background-color: white;
  padding: 40px; // 패딩을 좀 더 크게 설정하여 여백을 추가
  border-radius: 8px;
  width: 600px; // 너비를 600px로 늘림
  max-width: 90%; // 화면이 작아지면 최대 90%로 크기 조정
  max-height: 80%; // 화면 크기에 비례하여 최대 높이 조정
  overflow-y: auto; // 내용이 많으면 스크롤 추가
  position: relative;

  @media (max-width: 768px) {
    width: 90%; // 작은 화면에서는 90%로 크기 설정
    max-width: 500px; // 더 작은 크기 조정
  }
`;

// 닫기 버튼
const CloseButton = styled.button`
  position: absolute;
  top: 10px;
  right: 10px;
  background: none;
  border: none;
  font-size: 30px;
  cursor: pointer;
  color: #333;
`;

export default Modal;
