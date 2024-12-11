// ButtonComponent.js
import styled from "styled-components";
import React from "react";

const StyledButton = styled.button`
  background-color: ${({ disabled }) => (disabled ? "#ccc" : "#007bff")};
  color: ${({ disabled }) => (disabled ? "#666" : "#fff")};
  padding: 10px 20px;
  border: none;
  cursor: ${({ disabled }) => (disabled ? "not-allowed" : "pointer")};
  font-size: 16px;
`;

const ButtonComponent = ({ disabled, onClick, children }) => {
  return (
    <StyledButton disabled={disabled} onClick={onClick}>
      {children}
    </StyledButton>
  );
};

const Button = styled.button`
  width: 100%;
  padding: 15px;
  background-color: #4caf50;
  color: white;
  font-size: 18px;
  border: none;
  border-radius: 5px;
  cursor: pointer;

  &:hover {
    background-color: #45a049;
  }

  &:disabled {
    background-color: #ccc;
    cursor: not-allowed;
  }
`;

export default ButtonComponent;
