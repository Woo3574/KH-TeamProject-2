import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import Button from "../../components/ButtonComponent.js";
import AxiosApi from "../../api/AxiosApi";
import { Container, Items } from "../../components/SignupComponent.js";
import Input from "../../components/InputComponent.js";
import Modal from "../../components/Modal.js";

const Login = ({ closeModal }) => {

  const [showModal, setShowModal] = useState(false);

  const [inputId, setInputId] = useState("");
  const [inputPw, setInputPw] = useState("");
  const navigate = useNavigate();

  const handleInputChange = (e, setState) => {
    setState(e.target.value);
  };

  const onClickLogin = async () => {
    try {
      const rsp = await AxiosApi.login(inputId, inputPw);
      if (rsp.data) {
        localStorage.setItem("loggedInUserId", inputId);
        alert("로그인 성공");
        // closeModal(); // 모달 닫기
        navigate("/");
      } else {
        alert("아이디 및 패스워드가 틀립니다.");
      }
    } catch (e) {
      alert("서버가 응답하지 않습니다.");
    }
  };

  return (
    <Container>
      <Items margin="10px">
        <Input
          placeholder="아이디"
          value={inputId}
          onChange={(e) => handleInputChange(e, setInputId)}
        />
      </Items>
      <Items margin="10px">
        <Input
          type="password"
          placeholder="패스워드"
          value={inputPw}
          onChange={(e) => handleInputChange(e, setInputPw)}
        />
      </Items>
      <Items margin="10px">
        <Button enabled onClick={onClickLogin}>
          SIGN IN
        </Button>
      </Items>
    </Container>
  );
};

export default Login;
