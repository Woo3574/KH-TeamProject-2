-- RESERVATION 테이블 생성
CREATE TABLE RESERVATION_TB (
    R_NO INTEGER NOT NULL PRIMARY KEY,            								/* 예약번호 */
    R_TIME VARCHAR2(20) NOT NULL,                        						/* 예약 시간 (날짜와 시간 포함) */
    R_PERSON_CNT INTEGER NOT NULL,             				   					/* 예약 인원수 */
    R_SUBMIT_TIME DATE DEFAULT SYSDATE,											/* 예약버튼 누른 시간 */
    USER_ID VARCHAR2(20) NOT NULL,                								/* 예약자ID */
    USER_NAME VARCHAR2(20) NOT NULL,             								/* 예약자명 */
	STORE_NO INTEGER NOT NULL, 													/* 매장번호 */
    STORE_NAME VARCHAR2(100) NOT NULL,             								/* 매장명 */
    STORE_PHONE VARCHAR2(15) NOT NULL,         			   						/* 매장 전화번호 */
    BRAND_NAME VARCHAR2(20) NOT NULL,             								/* 브랜드명 */
    -- FK 제약 조건
    CONSTRAINT FK_RESERVATION_USER
        FOREIGN KEY (USER_ID, USER_NAME)
        REFERENCES USER_TB (USER_ID, USER_NAME)
        ON DELETE CASCADE,
    CONSTRAINT FK_RESERVATION_STORE
        FOREIGN KEY (STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
        REFERENCES STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
        ON DELETE CASCADE,
    -- UNIQUE 제약조건
    CONSTRAINT UNIQUE_RESERVATION1 UNIQUE (R_NO, R_TIME, R_SUBMIT_TIME, USER_ID, STORE_NAME) 	/* REVIEW */
);


-- R_NO 시퀀스 생성
CREATE SEQUENCE R_NO_SEQ
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE;


--RESERVATION 더미 데이터 생성
INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, R_SUBMIT_TIME, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '17', 3, SYSDATE, 'testid01',
U.USER_NAME, 1, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid01' AND S.STORE_NO = 1;

INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, R_SUBMIT_TIME, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '18', 5, SYSDATE, 'testid02',
U.USER_NAME, 1, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid02' AND S.STORE_NO = 1;

INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, R_SUBMIT_TIME, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '20', 4, SYSDATE, 'testid03',
U.USER_NAME, 1, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid03' AND S.STORE_NO = 1;

INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, R_SUBMIT_TIME, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '17', 2, SYSDATE, 'testid04',
U.USER_NAME, 6, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid04' AND S.STORE_NO = 6;

INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, R_SUBMIT_TIME, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '19', 6, SYSDATE, 'testid05',
U.USER_NAME, 6, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid05' AND S.STORE_NO = 6;

INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, R_SUBMIT_TIME, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '20', 1, SYSDATE, 'testid06',
U.USER_NAME, 6, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid06' AND S.STORE_NO = 6;

INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, R_SUBMIT_TIME, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '24', 1, SYSDATE, 'testid07',
U.USER_NAME, 14, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid07' AND S.STORE_NO = 14;

INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, R_SUBMIT_TIME, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '26', 1, SYSDATE, 'testid08',
U.USER_NAME, 14, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid08' AND S.STORE_NO = 14;


-- RESERVATION 테스트용 쿼리문
SELECT * FROM RESERVATION_TB;	/* 전체 데이터 조회 */

DELETE FROM RESERVATION_TB WHERE STORE_NO = '6'; /* 매장명 단위로 데이터 삭제 */

DROP SEQUENCE R_NO_SEQ;			/* R_NO 시퀀스 삭제 */

DROP TABLE RESERVATION_TB;		/* RESERVATION 테이블 삭제 */

COMMIT;

INSERT INTO RESERVATION_TB 
            (R_NO, R_TIME, R_PERSON_CNT, R_SUBMIT_TIME, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
            SELECT R_NO_SEQ.NEXTVAL, 19, 5, SYSDATE, 'testid01', U.USER_NAME, 1, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME
            FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid01' AND S.STORE_NO = 1;