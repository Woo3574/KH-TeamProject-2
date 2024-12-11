--MINI PROJECT
--예약시간_시퀀스 생성
CREATE SEQUENCE R_TIME_NO_SEQ
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE;

--예약시간_테이블 생성
CREATE TABLE R_TIME_TB (
	r_time_no INTEGER NOT NULL PRIMARY KEY,	/*예약시간 번호*/
	brand_name VARCHAR2(20) NOT NULL,		/*브랜드명*/
	store_name VARCHAR2(50) NOT NULL,		/*지점명*/
	r_hour_01 INTEGER NOT NULL,
	r_hour_02 INTEGER NOT NULL,
	r_hour_03 INTEGER NOT NULL,
	r_hour_04 INTEGER NOT NULL,
	r_hour_05 INTEGER NOT NULL,
	r_hour_06 INTEGER NOT NULL,
	r_hour_07 INTEGER NOT NULL,
	r_hour_08 INTEGER NOT NULL,
	r_hour_09 INTEGER NOT NULL,
	r_hour_10 INTEGER NOT NULL,
	r_hour_11 INTEGER NOT NULL,
	r_hour_12 INTEGER NOT NULL,
	r_hour_13 INTEGER NOT NULL,
	r_hour_14 INTEGER NOT NULL,
	r_hour_15 INTEGER NOT NULL,
	r_hour_16 INTEGER NOT NULL,
	r_hour_17 INTEGER NOT NULL,
	r_hour_18 INTEGER NOT NULL,
	r_hour_19 INTEGER NOT NULL,
	r_hour_20 INTEGER NOT NULL,
	r_hour_21 INTEGER NOT NULL,
	r_hour_22 INTEGER NOT NULL,
	r_hour_23 INTEGER NOT NULL,
	r_hour_24 INTEGER NOT NULL
);

--예약시간_더미 데이터 생성
INSERT INTO R_TIME_TB (r_time_no, brand_name, store_name, r_hour_01, r_hour_02, r_hour_03, r_hour_04, r_hour_05, r_hour_06, r_hour_07, r_hour_08,
					r_hour_09, r_hour_10, r_hour_11, r_hour_12, r_hour_13, r_hour_14, r_hour_15, r_hour_16, r_hour_17, r_hour_18, r_hour_19,
					r_hour_20, r_hour_21, r_hour_22, r_hour_23, r_hour_24)
VALUES (R_TIME_NO_SEQ.NEXTVAL, '롤링파스타', '롤링파스타 가로수길점', 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1);

/*INSERT INTO R_TIME_TB (r_time_no, brand_name, store_name, r_hour_01, r_hour_02, r_hour_03, r_hour_04, r_hour_05, r_hour_06, r_hour_07, r_hour_08,
					r_hour_09, r_hour_10, r_hour_11, r_hour_12, r_hour_13, r_hour_14, r_hour_15, r_hour_16, r_hour_17, r_hour_18, r_hour_19,
					r_hour_20, r_hour_21, r_hour_22, r_hour_23, r_hour_24)
VALUES (R_TIME_NO_SEQ.NEXTVAL, '롤링파스타', '롤링파스타 가로수길점', '00:00-01:00', '01:00-02:00', '02:00-03:00', '03:00-04:00', '04:00-05:00', '05:00-06:00', '06:00-07:00', '07:00-08:00',
		'08:00-09:00', '09:00-10:00', '10:00-11:00', '11:00-12:00', '12:00-13:00', '13:00-14:00', '14:00-15:00', '15:00-16:00', '16:00-17:00',
		'17:00-18:00', '18:00-19:00', '19:00-20:00', '20:00-21:00', '21:00-22:00', '22:00-23:00', '23:00-24:00');*/
	
--예약시간_테스트용 쿼리문
SELECT * FROM R_TIME_TB;	/*전체 예약시간 조회*/

DROP TABLE R_TIME_TB;		/*예약시간 테이블 삭제*/

DROP SEQUENCE R_TIME_NO_SEQ; /*예약시간 시퀀스 삭제*/

--DELETE FROM MEMBER_INFO WHERE MEMBER_ID = ;

COMMIT;