--MINI PROJECT
--유저_시퀀스 생성
CREATE SEQUENCE USER_NO_SEQ
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE;

--유저_테이블 생성
CREATE TABLE USER_TB (
	user_no INTEGER NOT NULL PRIMARY KEY,	/*회원 번호*/
	user_name VARCHAR2(20) NOT NULL,		/*사용자 이름*/
	user_id VARCHAR2(20) NOT NULL,			/*사용자 아이디*/
	user_pw VARCHAR2(20) NOT NULL,			/*비밀번호*/
	user_mail VARCHAR2(20) NOT NULL,		/*메일*/
	user_birth DATE NOT NULL,				/*생년월일*/
	user_phone VARCHAR2(13) NOT NULL,		/*전화번호*/
	user_img VARCHAR2(200) NOT NULL,		/*프로필이미지*/
	--UNIQUE 제약조건
    CONSTRAINT unique_user UNIQUE (user_id),
    CONSTRAINT unique_user2 UNIQUE (user_phone),
    CONSTRAINT unique_user3 UNIQUE (user_id, user_name)
);

--유저_더미 데이터 생성
INSERT INTO USER_TB (user_no, user_name, user_id, user_pw, user_mail, user_birth, user_phone, user_img)
VALUES (USER_NO_SEQ.NEXTVAL, '두둥탁', 'asdf1234', 'qwer1234', 'asdf1234@gmail.com', '2001-06-15', '010-1234-5678', 'gs://kh-firebase-50b3f.firebasestorage.app/택2.jpg');

INSERT INTO USER_TB (user_no, user_name, user_id, user_pw, user_mail, user_birth, user_phone, user_img)
VALUES (USER_NO_SEQ.NEXTVAL, '둥두둥', 'qwer1234', 'asdf1234', 'qwer1234@naver.com', '2001-04-14', '010-5678-1234', 'gs://kh-firebase-50b3f.firebasestorage.app/랍1.jpg');

--유저_테스트용 쿼리문
SELECT * FROM USER_TB;	/*전체 유저 조회*/

DROP TABLE USER_TB;		/*유저 테이블 삭제*/

DROP SEQUENCE USER_NO_SEQ; /*유저 시퀀스 삭제*/

--DELETE FROM MEMBER_INFO WHERE MEMBER_ID = ;

COMMIT;