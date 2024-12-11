// Home.js
import React from "react";
import { Link, useNavigate } from "react-router-dom";

const LoginHome = ({ setShowModal }) => {
  const navigate = useNavigate();
  const loggedInUserId = localStorage.getItem("loggedInUserId");
  

  const handleLogout = () => {
    localStorage.removeItem("loggedInUserId");
    alert("로그아웃 되었습니다.");
    navigate("/");
  };

  const handleSignupClick = () => {
    // setShowModal(true); 
    navigate("/Signup"); 
  };
  return (
    <div>
      <h1>Home</h1>
      {!loggedInUserId ? (
        <>
          <Link to="/Login">
            <button>로그인</button>
          </Link>
          <button onClick={handleSignupClick}>회원가입</button>
        </>
      ) : (
        <>
          <Link to={`/Member`}>
            <button>마이페이지</button>
          </Link>
          <button onClick={handleLogout}>로그아웃</button>
        </>
      )}
    </div>
  );
};

export default LoginHome;
