-- USER 테이블 생성
CREATE TABLE USER_TB (
	USER_NO INTEGER NOT NULL PRIMARY KEY,					/* 회원번호 */
	USER_ID VARCHAR2(20) NOT NULL,							/* ID */
	USER_PW VARCHAR2(20) NOT NULL,							/* PW */
	USER_NAME VARCHAR2(20) NOT NULL,						/* 이름 */
	USER_MAIL VARCHAR2(100) NOT NULL,						/* 메일 */
	USER_BIRTH DATE NOT NULL,								/* 생년월일 */
	USER_PHONE VARCHAR2(13) NOT NULL,						/* 전화번호 */
	USER_IMG VARCHAR2(500) NOT NULL,						/* 프로필 이미지 URL */
	--UNIQUE 제약조건
    CONSTRAINT UNIQUE_USER1 UNIQUE (USER_ID, USER_NAME) 	/* RESERVATION */
);


-- USER_NO 시퀀스 생성
CREATE SEQUENCE USER_NO_SEQ
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE;


-- USER 더미 데이터 생성
INSERT INTO USER_TB (USER_NO, USER_ID, USER_PW, USER_NAME, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG)
VALUES (USER_NO_SEQ.NEXTVAL, 'testid01', 'testpw01', '테스트이름01', 'test01@gmail.com', '2001-01-01', '010-0001-0001', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FDefault_Profile.png?alt=media&token=8def32c4-cf3f-45f1-a737-970eb0a59757');

INSERT INTO USER_TB (USER_NO, USER_ID, USER_PW, USER_NAME, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG)
VALUES (USER_NO_SEQ.NEXTVAL, 'testid02', 'testpw02', '테스트이름02', 'test02@gmail.com', '2002-02-02', '010-0002-0002', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FDefault_Profile.png?alt=media&token=8def32c4-cf3f-45f1-a737-970eb0a59757');

INSERT INTO USER_TB (USER_NO, USER_ID, USER_PW, USER_NAME, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG)
VALUES (USER_NO_SEQ.NEXTVAL, 'testid03', 'testpw03', '테스트이름03', 'test03@gmail.com', '2003-03-03', '010-0003-0003', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FDefault_Profile.png?alt=media&token=8def32c4-cf3f-45f1-a737-970eb0a59757');

INSERT INTO USER_TB (USER_NO, USER_ID, USER_PW, USER_NAME, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG)
VALUES (USER_NO_SEQ.NEXTVAL, 'testid04', 'testpw04', '테스트이름04', 'test04@gmail.com', '2004-04-04', '010-0004-0004', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FDefault_Profile.png?alt=media&token=8def32c4-cf3f-45f1-a737-970eb0a59757');

INSERT INTO USER_TB (USER_NO, USER_ID, USER_PW, USER_NAME, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG)
VALUES (USER_NO_SEQ.NEXTVAL, 'testid05', 'testpw05', '테스트이름05', 'test05@gmail.com', '2005-05-05', '010-0005-0005', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FDefault_Profile.png?alt=media&token=8def32c4-cf3f-45f1-a737-970eb0a59757');

INSERT INTO USER_TB (USER_NO, USER_ID, USER_PW, USER_NAME, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG)
VALUES (USER_NO_SEQ.NEXTVAL, 'testid06', 'testpw06', '테스트이름06', 'test06@gmail.com', '2006-06-06', '010-0006-0006', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FDefault_Profile.png?alt=media&token=8def32c4-cf3f-45f1-a737-970eb0a59757');

INSERT INTO USER_TB (USER_NO, USER_ID, USER_PW, USER_NAME, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG)
VALUES (USER_NO_SEQ.NEXTVAL, 'testid07', 'testpw07', '테스트이름07', 'test07@gmail.com', '2007-07-07', '010-0007-0007', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FDefault_Profile.png?alt=media&token=8def32c4-cf3f-45f1-a737-970eb0a59757');

INSERT INTO USER_TB (USER_NO, USER_ID, USER_PW, USER_NAME, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG)
VALUES (USER_NO_SEQ.NEXTVAL, 'testid08', 'testpw08', '테스트이름08', 'test08@gmail.com', '2008-08-08', '010-0008-0008', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FDefault_Profile.png?alt=media&token=8def32c4-cf3f-45f1-a737-970eb0a59757');

INSERT INTO USER_TB (USER_NO, USER_ID, USER_PW, USER_NAME, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG)
VALUES (USER_NO_SEQ.NEXTVAL, 'testid09', 'testpw09', '테스트이름09', 'test09@gmail.com', '2009-09-09', '010-0009-0009', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FDefault_Profile.png?alt=media&token=8def32c4-cf3f-45f1-a737-970eb0a59757');

INSERT INTO USER_TB (USER_NO, USER_ID, USER_PW, USER_NAME, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG)
VALUES (USER_NO_SEQ.NEXTVAL, 'testid10', 'testpw10', '테스트이름10', 'test10@gmail.com', '2010-10-10', '010-0010-0010', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FDefault_Profile.png?alt=media&token=8def32c4-cf3f-45f1-a737-970eb0a59757');


-- USER 테스트용 쿼리문
SELECT * FROM USER_TB;						/* 전체 데이터 조회 */

DELETE FROM USER_TB WHERE USER_ID = '';		/* ID 단위로 데이터 삭제 */

DROP SEQUENCE USER_NO_SEQ;  				/* USER_NO 시퀀스 삭제 */

DROP TABLE USER_TB;							/* USER 테이블 삭제 */

COMMIT;
