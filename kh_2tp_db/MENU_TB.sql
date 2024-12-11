--MINI PROJECT
--유저_시퀀스 생성
CREATE SEQUENCE MENU_NO_SEQ
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE;

--유저_테이블 생성
CREATE TABLE MENU_TB (
	menu_no INTEGER NOT NULL PRIMARY KEY,	/*회원 번호*/
	bra`nd_name VARCHAR2(20) NOT NULL,		/*브랜드명*/
	menu_name VARCHAR2(50) NOT NULL,		/*지점명*/
	menu_img VARCHAR2(200) NOT NULL		/*프로필이미지*/
);

--유저_더미 데이터 생성
INSERT INTO MENU_TB (menu_no, brand_name, menu_name, menu_img) VALUES (MENU_NO_SEQ.NEXTVAL, '롤링파스타', '알리오 올리오', 'menu_img');

--유저_테스트용 쿼리문
SELECT * FROM MENU_TB;	/*전체 리뷰 조회*/

DROP TABLE MENU_TB;		/*리뷰 테이블 삭제*/

DROP SEQUENCE MENU_NO_SEQ; /*리뷰 시퀀스 삭제*/

--DELETE FROM MEMBER_INFO WHERE MEMBER_ID = ;

COMMIT;
