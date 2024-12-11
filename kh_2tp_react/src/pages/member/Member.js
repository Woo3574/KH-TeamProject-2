import React, { useState, useEffect } from "react";
import styled from "styled-components";
import { useNavigate } from "react-router-dom";
import AxiosApi from "../../api/AxiosApi";
import { storage } from "../../api/Firebase"; // Firebase 가져오기

// 스타일 정의
const Container = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
  background-color: #f9f9f9;
`;

const UserInfo = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 10px;
  background-color: white;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
`;

const UserImage = styled.img`
  width: 100px;
  height: 100px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid #007bff;
  display: ${(props) =>
    props.isLoading ? "none" : "block"}; /* 로딩 중에는 이미지 숨기기 */
`;

const MemberName = styled.h2`
  font-size: 20px;
  color: #333;
`;

const ErrorMessage = styled.div`
  color: red;
  font-size: 14px;
`;

// 마이페이지 컴포넌트
const Member = () => {
  const [member, setMember] = useState(null); // 사용자 정보 상태
  const [userImage, setUserImage] = useState(null); // 사용자 이미지  상태
  const [isLoading, setIsLoading] = useState(true); // 이미지 로딩 상태
  const [error, setError] = useState(""); // 에러 메시지 상태
  const navigate = useNavigate(); // 네비게이션 훅

  useEffect(() => {
    const fetchMemberData = async () => {
      const userId = localStorage.getItem("loggedInUserId"); // 로컬스토리지에서 userId 가져오기

      try {
        const response = await AxiosApi.getMemberInfo(userId); // 서버에서 사용자 정보 가져오기
        setMember(response.data); // 사용자 정보 상태 업데이트

        const userImg = response.data.userImg; // DB에서 이미지 URL 가져오기
        if (userImg) {
          setUserImage(userImg); // DB에서 받아온 URL을 바로 사용
          setIsLoading(false); // 이미지 URL이 있을 때 로딩 종료
        } else {
          setUserImage(""); // 이미지가 없으면 기본 이미지로 설정
          setIsLoading(false); // 로딩 종료
        }
      } catch (err) {
        setError("사용자 정보를 불러오는 중 오류가 발생했습니다.");
        console.error(err);
        setIsLoading(false); // 오류 발생 시에도 로딩 종료
      }
    };

    fetchMemberData();
  }, [navigate]);

  const handleEditClick = () => {
    navigate("/member/MemberInfo"); // 멤버 수정 페이지로 이동
  };

  return (
    <Container>
      <UserInfo>
        {/* 이미지 로딩 중에는 기본 이미지를 숨기고, 실제 이미지를 보여줌 */}
        {isLoading ? (
          <UserImage
            src="https://firebasestorage.googleapis.com/v0/b/project-mini-db956.firebasestorage.app/o/default_profile.png?alt=media&token=6ccfd06d-4d99-4c7b-b603-1baf0517116b"
            alt="기본 이미지"
            isLoading={isLoading}
          />
        ) : (
          <UserImage
            src={
              userImage ||
              "https://firebasestorage.googleapis.com/v0/b/project-mini-db956.firebasestorage.app/o/default_profile.png?alt=media&token=6ccfd06d-4d99-4c7b-b603-1baf0517116b"
            }
            alt="Profile"
            isLoading={isLoading}
          />
        )}

        <MemberName>
          {member ? `${member.userName}님, 안녕하세요!` : "불러오는중"}
        </MemberName>
        {error && <ErrorMessage>{error}</ErrorMessage>}

        <EditButton onClick={handleEditClick}>멤버 수정</EditButton>
      </UserInfo>
    </Container>
  );
};

const EditButton = styled.button`
  background-color: #4caf50;
  color: white;
  border: none;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin-top: 20px;
  cursor: pointer;

  &:hover {
    background-color: #45a049;
  }
`;

export default Member;
