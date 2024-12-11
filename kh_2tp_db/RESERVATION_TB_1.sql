--MINI PROJECT
--예약_시퀀스 생성
CREATE SEQUENCE R_NO_SEQ
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE;

-- 예약 테이블
CREATE TABLE RESERVATION_TB (
    r_no INTEGER NOT NULL PRIMARY KEY,            -- 예약 번호
    user_id VARCHAR2(20) NOT NULL,                -- 예약자 ID
    user_name VARCHAR2(20) NOT NULL,              -- 예약자명
    store_no INTEGER NOT NULL,                    -- 매장 번호
    store_name VARCHAR2(50) NOT NULL,             -- 매장명
    store_phone VARCHAR2(15) NOT NULL,            -- 매장 전화번호
    r_person_cnt INTEGER NOT NULL,                -- 예약 인원수
    r_time DATE NOT NULL,                         -- 예약 시간 (날짜와 시간 포함)
    r_submit_time DATE DEFAULT SYSDATE,           -- 예약 제출 시간
    brand_name VARCHAR2(20) NOT NULL,             -- 브랜드명

    -- 외래키 제약 조건
    CONSTRAINT fk_reservation_user
        FOREIGN KEY (user_id)
        REFERENCES USER_TB (user_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_reservation_store
        FOREIGN KEY (store_no)
        REFERENCES STORE_TB (store_no)
        ON DELETE CASCADE,

    -- UNIQUE 제약조건
    CONSTRAINT unique_reservation1 UNIQUE (r_time),
    CONSTRAINT unique_reservation2 UNIQUE (r_no, r_time),
    CONSTRAINT unique_reservation3 UNIQUE (user_id, store_no, store_name, r_time, r_submit_time)
);

--예약_더미 데이터 생성
INSERT INTO RESERVATION_TB (r_no, user_id, user_name, store_no, store_name, store_phone, r_person_cnt, r_time, r_submit_time, brand_name)
VALUES (R_NO_SEQ.NEXTVAL, 'asdf1234', '두둥탁', '8', '롤링파스타 가로수길점', '02-543-5688', 3, TO_DATE('2024-12-03 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'), '롤링파스타');

INSERT INTO RESERVATION_TB (r_no, user_id, user_name, store_no, store_name, store_phone, r_person_cnt, r_time, r_submit_time, brand_name)
VALUES (R_NO_SEQ.NEXTVAL, 'qwer1234', '둥두둥', '8', '롤링파스타 가로수길점', '02-543-5688', 5, TO_DATE('2024-12-03 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'), '롤링파스타');

INSERT INTO RESERVATION_TB (r_no, user_id, user_name, store_no, store_name, store_phone, r_person_cnt, r_time, r_submit_time, brand_name)
VALUES (R_NO_SEQ.NEXTVAL, 'qwer1234', '둥두둥', '7', '한신포차 중앙대점', '02-817-5238', 5, TO_DATE('2024-12-03 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'), '한신포차');

INSERT INTO RESERVATION_TB (r_no, user_id, user_name, store_no, store_name, store_phone, r_person_cnt, r_time, r_submit_time, brand_name)
VALUES (R_NO_SEQ.NEXTVAL, 'qwer1234', '둥두둥', '7', '한신포차 중앙대점', '02-817-5238', 5, TO_DATE('2024-12-03 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'), '한신포차');


-- 더미 데이터 삭제
DELETE FROM RESERVATION_TB WHERE STORE_NO = '8';
DELETE FROM RESERVATION_TB WHERE STORE_NO = '7';


--예약_테스트용 쿼리문
SELECT * FROM RESERVATION_TB;	/*전체 예약 조회*/

DROP TABLE RESERVATION_TB;		/*예약 테이블 삭제*/

DROP SEQUENCE R_NO_SEQ;			/*예약 시퀀스 삭제*/

DELETE 

--DELETE FROM MEMBER_INFO WHERE MEMBER_ID = ;

COMMIT;


