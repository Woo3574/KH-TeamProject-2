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