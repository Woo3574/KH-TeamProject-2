--MINI PROJECT
--매장_시퀀스 생성
CREATE SEQUENCE STORE_NO_SEQ
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE;

--매장_테이블 생성
CREATE TABLE STORE_TB(
	store_no INTEGER NOT NULL PRIMARY KEY, -- 매장번호
	brand_name VARCHAR2(20) NOT NULL, -- 브랜드명
	store_name VARCHAR2(50) NOT NULL, -- 지점명
	store_hour VARCHAR2(20)	NOT NULL, -- 매장 시간
	store_addr VARCHAR2(100) NOT NULL, -- 매장 주소
	store_map VARCHAR2(50) NOT NULL, -- 매장 위치(위도, 경도)
	store_phone VARCHAR2(15) NOT NULL, -- 매장 연락처
	--UNIQUE 제약조건
	CONSTRAINT unique_store UNIQUE (store_name),
	CONSTRAINT unique_store2 UNIQUE (store_name, store_phone)
);

--매장_더미 데이터 생성
INSERT INTO STORE_TB (store_no, brand_name, store_name, store_hour, store_addr, store_map, store_phone)
VALUES (STORE_NO_SEQ.NEXTVAL, '빽다방', '빽다방 압구정역점', '08:00 - 22:00', '서울특별시 강남구 압구정로 156', '37.525900628636165, 127.02674815154175', '02-3446-0410');

INSERT INTO STORE_TB (store_no, brand_name, store_name, store_hour, store_addr, store_map, store_phone)
VALUES (STORE_NO_SEQ.NEXTVAL, '빽다방', '빽다방 대치동학원가점', '08:00 - 22:00', '서울특별시 강남구 도곡로77길 8', '37.49890042146514, 127.05864289147813', '02-553-1515');

INSERT INTO STORE_TB (store_no, brand_name, store_name, store_hour, store_addr, store_map, store_phone)
VALUES (STORE_NO_SEQ.NEXTVAL, '빽다방', '빽다방 신논현역점', '08:00 - 22:00', '서울특별시 서초구 사평대로 367', '37.504368304702986, 127.02312138903574', '02-548-0410');

INSERT INTO STORE_TB (store_no, brand_name, store_name, store_hour, store_addr, store_map, store_phone)
VALUES (STORE_NO_SEQ.NEXTVAL, '역전우동', '역전우동 회기역점', '10:00 - 22:00', '서울특별시 동대문구 회기로 186', '37.5898042030099, 127.056449633583', '02-957-0410');

INSERT INTO STORE_TB (store_no, brand_name, store_name, store_hour, store_addr, store_map, store_phone)
VALUES (STORE_NO_SEQ.NEXTVAL, '역전우동', '역전우동 홍대입구역점', '10:00 - 22:00', '서울특별시 마포구 어울마당로 127-1', '37.555951920751724, 126.92407827775432', '02-3144-0417');

INSERT INTO STORE_TB (store_no, brand_name, store_name, store_hour, store_addr, store_map, store_phone)
VALUES (STORE_NO_SEQ.NEXTVAL, '한신포차', '한신포차 홍대점', '17:00 - 01:00', '서울특별시 마포구 잔다리로 13', '37.5505767556212, 126.921607658947', '02-3143-0410');

INSERT INTO STORE_TB (store_no, brand_name, store_name, store_hour, store_addr, store_map, store_phone)
VALUES (STORE_NO_SEQ.NEXTVAL, '한신포차', '한신포차 중앙대점', '17:00 - 01:00', '서울특별시 동작구 흑석로 115', '37.5087881988654, 126.961409298742', '02-817-5238');

INSERT INTO STORE_TB (store_no, brand_name, store_name, store_hour, store_addr, store_map, store_phone)
VALUES (STORE_NO_SEQ.NEXTVAL, '롤링파스타', '롤링파스타 가로수길점', '11:00 - 21:00', '서울특별시 강남구 가로수길 16', '37.5190185886303, 127.0233566700615', '02-543-5688');

INSERT INTO STORE_TB (store_no, brand_name, store_name, store_hour, store_addr, store_map, store_phone)
VALUES (STORE_NO_SEQ.NEXTVAL, '롤링파스타', '롤링파스타 성신여대점', '11:00 - 21:00', '서울특별시 성북구 동소문로22길 5', '37.5928112876896, 127.017595928971', '02-927-7779');

--매장_테스트용 쿼리문
SELECT * FROM STORE_TB;		/*전체 매장 조회*/

DROP TABLE STORE_TB;		/*매장 테이블 삭제*/

DROP SEQUENCE STORE_NO_SEQ;	/*매장 시퀀스 삭제*/




ALTER TABLE STORE
DROP COLUMN RV_AVG;

SELECT * FROM STORE;