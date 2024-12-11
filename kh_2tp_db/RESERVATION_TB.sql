--MINI PROJECT
--예약_시퀀스 생성
CREATE SEQUENCE R_NO_SEQ
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE;

--예약_테이블 생성
CREATE TABLE RESERVATION_TB (
	r_no INTEGER NOT NULL PRIMARY KEY,	/*예약 번호*/
	user_id VARCHAR2(20) NOT NULL,		/*예약자 ID*/
	user_name VARCHAR2(20) NOT NULL,	/*예약자명*/
	store_name VARCHAR2(50) NOT NULL,	/*지점명*/
	store_phone VARCHAR2(15) NOT NULL, 	/*매장 연락처*/
	r_person_cnt INTEGER NOT NULL,		/*방문 인원*/
	r_time VARCHAR2(20) NOT NULL,		/*방문 시간*/
	r_submit_time DATE DEFAULT SYSDATE,	/*예약 완료 날짜/시간*/
	--	외래키제약조건
	CONSTRAINT fk_reservation_user
		FOREIGN KEY (user_id, user_name)
		REFERENCES USER_TB (user_id, user_name)
		ON DELETE CASCADE,
	CONSTRAINT fk_reservation_store
		FOREIGN KEY (store_name, store_phone)
		REFERENCES STORE_TB (store_name, store_phone)
		ON DELETE CASCADE,
	--UNIQUE 제약조건
	CONSTRAINT unique_reservation UNIQUE (r_time),
	CONSTRAINT unique_reservation2 UNIQUE (r_no, r_submit_time),
	CONSTRAINT unique_reservation3 UNIQUE (user_id, store_name, r_time, r_submit_time)
);

--예약_더미 데이터 생성
INSERT INTO RESERVATION_TB (r_no, user_id, user_name, store_name, store_phone, r_person_cnt, r_time, r_submit_time)
VALUES (R_NO_SEQ.NEXTVAL, 'asdf1234', '두둥탁', '롤링파스타 가로수길점', '02-543-5688', 3, '13:00', TO_DATE('2024-11-28', 'YYYY-MM-DD'));

INSERT INTO RESERVATION_TB (r_no, user_id, user_name, store_name, store_phone, r_person_cnt, r_time, r_submit_time)
VALUES (R_NO_SEQ.NEXTVAL, 'qwer1234', '둥두둥', '롤링파스타 가로수길점', '02-543-5688', 5, '15:00', TO_DATE('2024-11-28', 'YYYY-MM-DD'));

INSERT INTO RESERVATION_TB (r_no, user_id, user_name, store_name, store_phone, r_person_cnt, r_time, r_submit_time)
VALUES (R_NO_SEQ.NEXTVAL, 'qwer1234', '둥두둥', '한신포차 중앙대점', '02-817-5238', 5, '23:00', TO_DATE('2024-11-28', 'YYYY-MM-DD'));

--예약_테스트용 쿼리문
SELECT * FROM RESERVATION_TB;	/*전체 예약 조회*/

DROP TABLE RESERVATION_TB;		/*예약 테이블 삭제*/

DROP SEQUENCE R_NO_SEQ;			/*예약 시퀀스 삭제*/

--DELETE FROM MEMBER_INFO WHERE MEMBER_ID = ;

COMMIT;