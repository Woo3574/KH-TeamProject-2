// EditProfile.js
import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import Input from "../../components/InputComponent";
import Button from "../../components/ButtonComponent";
import { Container, Items } from "../../components/SignupComponent";
import AxiosApi from "../../api/AxiosApi";
import { storage } from "../../api/Firebase";
import styled from "styled-components";
import Modal from "../../components/Modal";

const DEFAULT_PROFILE_URL =
  "https://firebasestorage.googleapis.com/v0/b/project-mini-db956.firebasestorage.app/o/default_profile.png?alt=media&token=6ccfd06d-4d99-4c7b-b603-1baf0517116b";

const MemberInfo = () => {
  const navigate = useNavigate();

  // State for user data
  const [userInfo, setUserInfo] = useState({
    userId: "",
    userName: "",
    userMail: "",
    userPhone: "",
    userBirth: "",
    userImg: DEFAULT_PROFILE_URL,
    userPw: "",
  });

  // Editable fields
  const [inputName, setInputName] = useState("");
  const [inputMail, setInputMail] = useState("");
  const [inputPw, setInputPw] = useState(""); // Current password
  const [inputBirth, setInputBirth] = useState("");

  // Validations
  const [mailMessage, setMailMessage] = useState("");
  const [pwMessage, setPwMessage] = useState("");
  const [isMail, setIsMail] = useState(true);
  const [isPw, setIsPw] = useState(true);
  const [isName, setIsName] = useState(false);

  // Profile image
  const [file, setFile] = useState(null);
  const [profileUrl, setProfileUrl] = useState(DEFAULT_PROFILE_URL);

  // Modal state for password change
  const [showPasswordModal, setShowPasswordModal] = useState(false);
  const [currentPassword, setCurrentPassword] = useState(""); // For password verification
  const [newPassword, setNewPassword] = useState("");
  const [confirmNewPassword, setConfirmNewPassword] = useState("");
  const [isPasswordMatch, setIsPasswordMatch] = useState(true);
  const [passwordMessage, setPasswordMessage] = useState("");

  useEffect(() => {
    const fetchUserInfo = async () => {
      const userId = localStorage.getItem("loggedInUserId");
      try {
        const response = await AxiosApi.getMemberInfo(userId);
        const userData = response.data;

        if (userData) {
          setUserInfo(userData);
          setInputName(userData.userName);
          setInputMail(userData.userMail);
          setInputBirth(
            userData.userBirth ? userData.userBirth.substring(0, 10) : ""
          );
          setProfileUrl(userData.userImg || DEFAULT_PROFILE_URL);
        }
      } catch (error) {
        console.error("Failed to fetch user data:", error);
      }
    };

    fetchUserInfo();
  }, []);

  const handleFileInputChange = (e) => {
    const selectedFile = e.target.files[0];
    if (selectedFile && selectedFile.type.startsWith("image/")) {
      setFile(selectedFile);
      const reader = new FileReader();
      reader.onloadend = () => {
        setProfileUrl(reader.result);
      };
      reader.readAsDataURL(selectedFile);
    } else {
      alert("유효한 이미지 파일만 선택해주세요.");
    }
  };

  const onChangeMail = (e) => {
    setInputMail(e.target.value);
    const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    if (!emailRegex.test(e.target.value)) {
      setMailMessage("이메일 형식이 올바르지 않습니다.");
      setIsMail(false);
    } else {
      setMailMessage("올바른 형식입니다.");
      setIsMail(true);
    }
  };

  const onChangePw = (e) => {
    const passwordRegex =
      /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

    const passwordCurrent = e.target.value;
    setInputPw(passwordCurrent);
    if (!passwordRegex.test(passwordCurrent)) {
      setPwMessage("숫자+영문자+특수문자 조합으로 8자리 이상 입력해주세요!");
      setIsPw(false);
    } else {
      setPwMessage("안전한 비밀번호입니다.");
      setIsPw(true);
    }
  };

  const onClickSaveChanges = async () => {
    let finalProfileUrl = profileUrl;

    if (file) {
      try {
        const storageRef = storage.ref();
        const fileRef = storageRef.child(file.name);
        await fileRef.put(file);
        finalProfileUrl = await fileRef.getDownloadURL();
      } catch (error) {
        console.error("이미지 업로드 실패:", error);
        alert("이미지 업로드 중 문제가 발생했습니다.");
        return;
      }
    }

    // 변경된 필드만 추출
    const updatedFields = {};
    if (userInfo.USER_NAME !== inputName) updatedFields.USER_NAME = inputName;
    if (userInfo.USER_MAIL !== inputMail) updatedFields.USER_MAIL = inputMail;
    if (inputPw) updatedFields.USER_PW = inputPw;
    if (userInfo.USER_BIRTH.substring(0, 10) !== inputBirth)
      updatedFields.USER_BIRTH = inputBirth;
    if (userInfo.USER_IMG !== finalProfileUrl)
      updatedFields.USER_IMG = finalProfileUrl;

    if (Object.keys(updatedFields).length === 0) {
      alert("변경된 내용이 없습니다.");
      return;
    }

    try {
      const response = await AxiosApi.updateMemberInfo(
        userInfo.userId,
        updatedFields
      );

      if (response.data) {
        alert("회원 정보가 성공적으로 수정되었습니다.");
        navigate("/Member");
      } else {
        alert("회원 정보 수정에 실패했습니다.");
      }
    } catch (error) {
      console.error("서버 응답 실패:", error);
      alert("서버가 응답하지 않습니다.");
    }
  };

  const handlePasswordChange = () => {
    const loggedInUserPassword = localStorage.getItem("loggedInUserPassword");

    if (currentPassword === loggedInUserPassword) {
      if (newPassword === confirmNewPassword) {
        setPasswordMessage("비밀번호가 수정되었습니다.");
        setIsPasswordMatch(true);
        // 로컬스토리지에 새로운 비밀번호 저장
        localStorage.setItem("loggedInUserPassword", newPassword);
        setUserInfo({ ...userInfo, userPw: newPassword }); // Update user info state
        setShowPasswordModal(false);
      } else {
        setPasswordMessage("비밀번호 확인이 일치하지 않습니다.");
        setIsPasswordMatch(false);
      }
    } else {
      setPasswordMessage("현재 비밀번호가 잘못되었습니다.");
      setIsPasswordMatch(false);
    }
  };

  return (
    <Container>
      <ProfileWrapper>
        <ProfileImage>
          <img src={profileUrl} alt="Profile" />
          <FileInputLabel>
            +
            <FileInput
              type="file"
              accept="image/*"
              onChange={handleFileInputChange}
            />
          </FileInputLabel>
        </ProfileImage>
      </ProfileWrapper>

      <Items variant="item2">
        <Input
          type="text"
          name="userName"
          placeholder="이름"
          value={inputName}
          onChange={(e) => {
            setInputName(e.target.value);
            setIsName(e.target.value.trim() !== "");
          }}
        />
      </Items>

      <Items variant="item2">
        <Input
          type="text"
          placeholder="아이디"
          value={userInfo.userId}
          disabled
        />
      </Items>

      <Items variant="item2">
        <Input
          type="email"
          name="userMail"
          placeholder="이메일"
          value={inputMail}
          onChange={onChangeMail}
        />
      </Items>
      <Items variant="hint">
        {mailMessage && (
          <span className={`message ${isMail ? "success" : "error"}`}>
            {mailMessage}
          </span>
        )}
      </Items>

      <Items variant="item2">
        <Input
          type="password"
          name="userPw"
          placeholder="비밀번호"
          value={userInfo.userPw ? "*".repeat(userInfo.userPw.length) : ""}
          disabled
        />
        <PasswordChangeButton onClick={() => setShowPasswordModal(true)}>
          비밀번호 수정
        </PasswordChangeButton>
      </Items>
      <Items variant="hint">
        {pwMessage && (
          <span className={`message ${isPw ? "success" : "error"}`}>
            {pwMessage}
          </span>
        )}
      </Items>

      <Items variant="item2">
        <Input
          type="date"
          name="userBirth"
          placeholder="생일"
          value={inputBirth}
          onChange={(e) => setInputBirth(e.target.value)}
        />
      </Items>

      <Items variant="item2">
        <Input
          type="text"
          placeholder="전화번호"
          value={userInfo.userPhone}
          disabled
        />
      </Items>

      <Items variant="item2">
        <Button enabled={isName && isMail && isPw} onClick={onClickSaveChanges}>
          저장
        </Button>
      </Items>

      {showPasswordModal && (
        <Modal
          show={showPasswordModal}
          onClose={() => setShowPasswordModal(false)}
        >
          <h2>비밀번호 변경</h2>
          <Input
            type="password"
            placeholder="현재 비밀번호"
            value={currentPassword}
            onChange={(e) => setCurrentPassword(e.target.value)}
          />
          <Input
            type="password"
            placeholder="새 비밀번호"
            value={newPassword}
            onChange={(e) => setNewPassword(e.target.value)}
          />
          <Input
            type="password"
            placeholder="새 비밀번호 확인"
            value={confirmNewPassword}
            onChange={(e) => setConfirmNewPassword(e.target.value)}
          />
          <span className={`message ${isPasswordMatch ? "success" : "error"}`}>
            {passwordMessage}
          </span>
          <Button onClick={handlePasswordChange}>변경</Button>
        </Modal>
      )}
    </Container>
  );
};

const ProfileWrapper = styled.div`
  display: flex;
  justify-content: center;
`;

const ProfileImage = styled.div`
  position: relative;
  width: 150px;
  height: 150px;
  border-radius: 50%;
  overflow: hidden;
  border: 2px solid #ccc;

  img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
`;

const FileInputLabel = styled.label`
  position: absolute;
  bottom: 5px;
  right: 5px;
  background-color: rgba(0, 0, 0, 0.5);
  color: white;
  padding: 5px;
  cursor: pointer;
`;

const FileInput = styled.input`
  display: none;
`;

const PasswordChangeButton = styled.button`
  margin-top: 10px;
  background-color: #007bff;
  color: white;
  padding: 5px 10px;
  border: none;
  cursor: pointer;
  border-radius: 5px;
`;

export default MemberInfo;
