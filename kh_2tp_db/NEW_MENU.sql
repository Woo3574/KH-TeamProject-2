-- MENU 테이블 생성
CREATE TABLE MENU_TB (
	MENU_NO INTEGER NOT NULL PRIMARY KEY,	/* 메뉴번호 */
	BRAND_NAME VARCHAR2(20) NOT NULL,		/* 브랜드명 */
	MENU_NAME VARCHAR2(50) NOT NULL,		/* 메뉴명 */
	MENU_IMG VARCHAR2(500) NOT NULL,		/* 메뉴사진 URL */
	--	FK 제약조건
	CONSTRAINT FK_MENU_BRAND
		FOREIGN KEY (BRAND_NAME)
		REFERENCES BRAND_TB (BRAND_NAME)
		ON DELETE CASCADE
);


-- MENU_NO 시퀀스 생성
CREATE SEQUENCE MENU_NO_SEQ
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE;


-- MENU 더미 데이터 생성
INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '빽보이피자', '슈퍼빽보이피자', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F01%EB%B9%BD%EB%B3%B4%EC%9D%B4%ED%94%BC%EC%9E%9001%EC%8A%88%ED%8D%BC%EB%B9%BD%EB%B3%B4%EC%9D%B4%ED%94%BC%EC%9E%90.jpg?alt=media&token=fbac699b-c2e2-49b2-8d7f-3bc6c0969a2c');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '빽보이피자', '울트라빽보이피자', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F01%EB%B9%BD%EB%B3%B4%EC%9D%B4%ED%94%BC%EC%9E%9002%EC%9A%B8%ED%8A%B8%EB%9D%BC%EB%B9%BD%EB%B3%B4%EC%9D%B4%ED%94%BC%EC%9E%90.jpg?alt=media&token=b9134cc5-464c-4838-b9d3-636304d46322');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '빽보이피자', '체다콘치즈피자', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F01%EB%B9%BD%EB%B3%B4%EC%9D%B4%ED%94%BC%EC%9E%9003%EC%B2%B4%EB%8B%A4%EC%BD%98%EC%B9%98%EC%A6%88%ED%94%BC%EC%9E%90.jpg?alt=media&token=75466cf6-57fb-4b81-817c-3a5da9990f58');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '빽보이피자', '열탄불고기피자', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F01%EB%B9%BD%EB%B3%B4%EC%9D%B4%ED%94%BC%EC%9E%9004%EC%97%B4%ED%83%84%EB%B6%88%EA%B3%A0%EA%B8%B0%ED%94%BC%EC%9E%90.jpg?alt=media&token=318dd886-081f-4fdc-a7ff-f750e61818cf');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '빽보이피자', '동글동글감자밭피자', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F01%EB%B9%BD%EB%B3%B4%EC%9D%B4%ED%94%BC%EC%9E%9005%EB%8F%99%EA%B8%80%EB%8F%99%EA%B8%80%EA%B0%90%EC%9E%90%EB%B0%AD%ED%94%BC%EC%9E%90.jpg?alt=media&token=57f9a546-927e-4c63-a184-ce2806290e00');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '역전우동', '옛날우동', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F02%EC%97%AD%EC%A0%84%EC%9A%B0%EB%8F%9901%EC%98%9B%EB%82%A0%EC%9A%B0%EB%8F%99.png?alt=media&token=a339d331-3832-4ce5-9380-e4af598fc80c');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '역전우동', '모둠어묵우동', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F02%EC%97%AD%EC%A0%84%EC%9A%B0%EB%8F%9902%EB%AA%A8%EB%91%A0%EC%96%B4%EB%AC%B5%EC%9A%B0%EB%8F%99.png?alt=media&token=a5fb07f9-4b0a-49f4-acba-df482bca9849');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '역전우동', '김치우동', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F02%EC%97%AD%EC%A0%84%EC%9A%B0%EB%8F%9903%EA%B9%80%EC%B9%98%EC%9A%B0%EB%8F%99.png?alt=media&token=2c133d97-f547-4583-9da5-160a83d7357e');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '역전우동', '새우튀김우동', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F02%EC%97%AD%EC%A0%84%EC%9A%B0%EB%8F%9904%EC%83%88%EC%9A%B0%ED%8A%80%EA%B9%80%EC%9A%B0%EB%8F%99.png?alt=media&token=c6f7a26f-32e1-4946-a951-20777a44e3e0');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '역전우동', '야채튀김우동', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F02%EC%97%AD%EC%A0%84%EC%9A%B0%EB%8F%9905%EC%95%BC%EC%B1%84%ED%8A%80%EA%B9%80%EC%9A%B0%EB%8F%99.png?alt=media&token=fbaf4bb0-82b5-4728-839e-769894ed4c86');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '빽다방', '아메리카노', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F03%EB%B9%BD%EB%8B%A4%EB%B0%A901%EC%95%84%EB%A9%94%EB%A6%AC%EC%B9%B4%EB%85%B8.png?alt=media&token=ac9a1b92-3fed-4179-9a7f-89633f140f18');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '빽다방', '원조커피', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F03%EB%B9%BD%EB%8B%A4%EB%B0%A902%EC%9B%90%EC%A1%B0%EC%BB%A4%ED%94%BC.png?alt=media&token=ebbaec6a-f64d-4f1b-975c-5348bec1b82c');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '빽다방', '달달연유라떼', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F03%EB%B9%BD%EB%8B%A4%EB%B0%A903%EB%8B%AC%EB%8B%AC%EC%97%B0%EC%9C%A0%EB%9D%BC%EB%96%BC.png?alt=media&token=bb64b434-dea5-4498-9326-2e83b28ee699');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '빽다방', '카페모카', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F03%EB%B9%BD%EB%8B%A4%EB%B0%A904%EC%B9%B4%ED%8E%98%EB%AA%A8%EC%B9%B4.png?alt=media&token=6affc40b-1aca-4bfc-b803-0ecaecda7d16');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '빽다방', '아이스크림카페라떼', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F03%EB%B9%BD%EB%8B%A4%EB%B0%A905%EC%95%84%EC%9D%B4%EC%8A%A4%ED%81%AC%EB%A6%BC%EC%B9%B4%ED%8E%98%EB%9D%BC%EB%96%BC.png?alt=media&token=9a760205-7000-4beb-a3ff-da0c7e094042');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '홍콩반점', '짬뽕', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F04%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%9001%EC%A7%AC%EB%BD%95.jpg?alt=media&token=0339fdd0-717a-482d-9ce9-7f5dff34d745');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '홍콩반점', '짜장면', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F04%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%9002%EC%A7%9C%EC%9E%A5%EB%A9%B4.jpg?alt=media&token=4b7392d7-3900-4eb4-bfde-de704dc8dfd9');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '홍콩반점', '탕수육', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F04%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%9003%ED%83%95%EC%88%98%EC%9C%A1.jpg?alt=media&token=fba68137-7b7a-4687-b21e-e3aba24412e7');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '홍콩반점', '군만두', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F04%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%9004%EA%B5%B0%EB%A7%8C%EB%91%90.jpg?alt=media&token=a65f5cac-5743-4806-badd-8ac86d6fba6b');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '홍콩반점', '멘보샤', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F04%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%9005%EB%A9%98%EB%B3%B4%EC%83%A4.jpg?alt=media&token=3b106db8-d028-45fc-b24e-98dfa8e0f6eb');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '롤링파스타', '로제크림쉬림프파스타', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F05%EB%A1%A4%EB%A7%81%ED%8C%8C%EC%8A%A4%ED%83%8001%EB%A1%9C%EC%A0%9C%ED%81%AC%EB%A6%BC%EC%89%AC%EB%A6%BC%ED%94%84%ED%8C%8C%EC%8A%A4%ED%83%80.jpg?alt=media&token=f5ff2c45-df06-40de-988b-70b80d87e2c0');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '롤링파스타', '까르보나라파스타', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F05%EB%A1%A4%EB%A7%81%ED%8C%8C%EC%8A%A4%ED%83%8002%EA%B9%8C%EB%A5%B4%EB%B3%B4%EB%82%98%EB%9D%BC.jpg?alt=media&token=16ac5f4b-dc21-45cc-91a2-21c0abaf9237');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '롤링파스타', '매운크림파스타', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F05%EB%A1%A4%EB%A7%81%ED%8C%8C%EC%8A%A4%ED%83%8003%EB%A7%A4%EC%9A%B4%ED%81%AC%EB%A6%BC%ED%8C%8C%EC%8A%A4%ED%83%80.jpg?alt=media&token=bf410712-c00b-47e3-b80d-676a5d96c7fc');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '롤링파스타', '찹스테이크', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F05%EB%A1%A4%EB%A7%81%ED%8C%8C%EC%8A%A4%ED%83%8004%EC%B0%B9%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.jpg?alt=media&token=f224ece0-4065-4ab2-bd22-78cbcd888118');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '롤링파스타', '고르곤졸라피자', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F05%EB%A1%A4%EB%A7%81%ED%8C%8C%EC%8A%A4%ED%83%8005%EA%B3%A0%EB%A5%B4%EA%B3%A4%EC%A1%B8%EB%9D%BC%ED%94%BC%EC%9E%90.jpg?alt=media&token=6b93d8ca-ac7b-4e39-bc84-79cce4297425');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '한신포차', '한신무뼈닭발', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F06%ED%95%9C%EC%8B%A0%ED%8F%AC%EC%B0%A801%ED%95%9C%EC%8B%A0%EB%AC%B4%EB%BC%88%EB%8B%AD%EB%B0%9C.jpg?alt=media&token=d35b1a85-ad18-4733-8328-1fe0d5816ec2');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '한신포차', '한신통닭', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F06%ED%95%9C%EC%8B%A0%ED%8F%AC%EC%B0%A802%ED%95%9C%EC%8B%A0%ED%86%B5%EB%8B%AD.jpg?alt=media&token=eee65bc7-019c-4295-8e95-4b14c7d70b93');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '한신포차', '고추장석쇠불고기', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F06%ED%95%9C%EC%8B%A0%ED%8F%AC%EC%B0%A803%EA%B3%A0%EC%B6%94%EC%9E%A5%EC%84%9D%EC%87%A0%EB%B6%88%EA%B3%A0%EA%B8%B0.jpg?alt=media&token=bade8878-1147-4c25-811b-6a61ad9f3041');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '한신포차', '꼬치어묵탕', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F06%ED%95%9C%EC%8B%A0%ED%8F%AC%EC%B0%A804%EA%BC%AC%EC%B9%98%EC%96%B4%EB%AC%B5%ED%83%95.jpg?alt=media&token=91bf8c60-dcc9-46be-a248-922fcdc631d7');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '한신포차', '고흥유자하이볼', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F06%ED%95%9C%EC%8B%A0%ED%8F%AC%EC%B0%A805%EA%B3%A0%ED%9D%A5%EC%9C%A0%EC%9E%90%ED%95%98%EC%9D%B4%EB%B3%BC.jpg?alt=media&token=6847e246-823d-4234-a1db-bc1a83a1e9aa');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '백스비어', '치즈김치철판볶음밥', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F07%EB%B0%B1%EC%8A%A4%EB%B9%84%EC%96%B401%EC%B9%98%EC%A6%88%EA%B9%80%EC%B9%98%EC%B2%A0%ED%8C%90%EB%B3%B6%EC%9D%8C%EB%B0%A5.jpg?alt=media&token=fba51ac2-c70e-44f3-8a37-28304b06d2be');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '백스비어', '빽타코', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F07%EB%B0%B1%EC%8A%A4%EB%B9%84%EC%96%B402%EB%B9%BD%ED%83%80%EC%BD%94.jpg?alt=media&token=684bf783-0e9d-4351-a844-3b29adbebee5');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '백스비어', '짜계치', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F07%EB%B0%B1%EC%8A%A4%EB%B9%84%EC%96%B403%EC%A7%9C%EA%B3%84%EC%B9%98.jpg?alt=media&token=4cb9ff0a-d210-4a0f-9ee5-fcab341e18ff');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '백스비어', '아이스황도', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F07%EB%B0%B1%EC%8A%A4%EB%B9%84%EC%96%B404%EC%95%84%EC%9D%B4%EC%8A%A4%ED%99%A9%EB%8F%84.jpg?alt=media&token=987b3453-88c0-49a0-8345-b407778b1b8e');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '백스비어', '빽라거', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F07%EB%B0%B1%EC%8A%A4%EB%B9%84%EC%96%B405%EB%B9%BD%EB%9D%BC%EA%B1%B0.jpg?alt=media&token=eefd7953-1120-4249-aec6-65d0039970b9');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '새마을식당', '열탄불고기', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F08%EC%83%88%EB%A7%88%EC%9D%84%EC%8B%9D%EB%8B%B901%EC%97%B4%ED%83%84%EB%B6%88%EA%B3%A0%EA%B8%B0.jpg?alt=media&token=bd36764b-378d-4d4b-b202-0f276dc7df38');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '새마을식당', '한돈모둠한판', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F08%EC%83%88%EB%A7%88%EC%9D%84%EC%8B%9D%EB%8B%B902%ED%95%9C%EB%8F%88%EB%AA%A8%EB%91%A0%ED%95%9C%ED%8C%90.jpg?alt=media&token=ee885caf-0533-43ea-9c46-154c51a1ad38');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '새마을식당', '한돈생삼겹살', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F08%EC%83%88%EB%A7%88%EC%9D%84%EC%8B%9D%EB%8B%B903%ED%95%9C%EB%8F%88%EC%83%9D%EC%82%BC%EA%B2%B9%EC%82%B4.jpg?alt=media&token=924bd15d-6acd-4dc9-abe2-d657784bea5e');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '새마을식당', '7분돼지김치', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F08%EC%83%88%EB%A7%88%EC%9D%84%EC%8B%9D%EB%8B%B9047%EB%B6%84%EB%8F%BC%EC%A7%80%EA%B9%80%EC%B9%98.jpg?alt=media&token=7c1e0f34-859b-490c-aadf-5f71ee27d8e1');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '새마을식당', '빽라면', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F08%EC%83%88%EB%A7%88%EC%9D%84%EC%8B%9D%EB%8B%B905%EB%B9%BD%EB%9D%BC%EB%A9%B4.jpg?alt=media&token=5900195b-3042-429e-8ee8-390ef71873ea');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '제순식당', '제순세트', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F09%EC%A0%9C%EC%88%9C%EC%8B%9D%EB%8B%B901%EC%A0%9C%EC%88%9C%EC%84%B8%ED%8A%B8.jpg?alt=media&token=e062b9ac-f8a5-4bc1-9dfa-8fb38c4f3692');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '제순식당', '닭순세트', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F09%EC%A0%9C%EC%88%9C%EC%8B%9D%EB%8B%B902%EB%8B%AD%EC%88%9C%EC%84%B8%ED%8A%B8.jpg?alt=media&token=9aad2595-d9fb-413c-9ed9-9a7038c6be02');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '제순식당', '제육정식', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F09%EC%A0%9C%EC%88%9C%EC%8B%9D%EB%8B%B903%EC%A0%9C%EC%9C%A1%EC%A0%95%EC%8B%9D.jpg?alt=media&token=ac7a68e7-d1f2-4d83-9929-81e374b25f0f');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '제순식당', '홍순두부정식', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F09%EC%A0%9C%EC%88%9C%EC%8B%9D%EB%8B%B904%ED%99%8D%EC%88%9C%EB%91%90%EB%B6%80%EC%A0%95%EC%8B%9D.jpg?alt=media&token=05a35a5f-0d33-4fb5-9dfc-76bec11abc8c');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '제순식당', '닭튀김정식', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F09%EC%A0%9C%EC%88%9C%EC%8B%9D%EB%8B%B905%EB%8B%AD%ED%8A%80%EA%B9%80%EC%A0%95%EC%8B%9D.jpg?alt=media&token=dc140eb3-9d01-4878-b21b-f79911713e1e');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '리춘시장', '누룽지꿔바로우', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F10%EB%A6%AC%EC%B6%98%EC%8B%9C%EC%9E%A501%EB%88%84%EB%A3%BD%EC%A7%80%EA%BF%94%EB%B0%94%EB%A1%9C%EC%9A%B0.PNG?alt=media&token=3dd39c29-49b8-4f05-b7ef-09741790800d');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '리춘시장', '멘바샥', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F10%EB%A6%AC%EC%B6%98%EC%8B%9C%EC%9E%A502%EB%A9%98%EB%B0%94%EC%83%A5.PNG?alt=media&token=405ad7f2-6d47-45c1-8cde-8fecb85ca9ce');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '리춘시장', '고추듬뿍유린기', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F10%EB%A6%AC%EC%B6%98%EC%8B%9C%EC%9E%A503%EA%B3%A0%EC%B6%94%EB%93%AC%EB%BF%8D%EC%9C%A0%EB%A6%B0%EA%B8%B0.PNG?alt=media&token=f0229357-a578-4839-a509-a7d9bf32426b');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '리춘시장', '마라탕', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F10%EB%A6%AC%EC%B6%98%EC%8B%9C%EC%9E%A504%EB%A7%88%EB%9D%BC%ED%83%95.PNG?alt=media&token=64cd0910-5e77-4c58-92f4-5f43784c2aae');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '리춘시장', '뚝배기어향가지', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F10%EB%A6%AC%EC%B6%98%EC%8B%9C%EC%9E%A505%EB%9A%9D%EB%B0%B0%EA%B8%B0%EC%96%B4%ED%96%A5%EA%B0%80%EC%A7%80.PNG?alt=media&token=a16ee5b6-8a09-4dc9-812c-d549b3381739');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '고투웍', '베이스', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F11%EA%B3%A0%ED%88%AC%EC%9B%8D01%EB%B2%A0%EC%9D%B4%EC%8A%A4.jpg?alt=media&token=c2ec1dce-97b0-4138-ba4c-97c3a4951b1b');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '고투웍', '메인', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F11%EA%B3%A0%ED%88%AC%EC%9B%8D02%EB%A9%94%EC%9D%B8.jpg?alt=media&token=c9f9ec67-1b3a-418d-b55c-cfe30268f084');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '고투웍', '마라탕면', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F11%EA%B3%A0%ED%88%AC%EC%9B%8D03%EB%A7%88%EB%9D%BC%ED%83%95%EB%A9%B4.jpg?alt=media&token=a2c96887-f103-4ef1-9bc0-e2b68b6c48f9');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '고투웍', '게살계란국', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F11%EA%B3%A0%ED%88%AC%EC%9B%8D04%EA%B2%8C%EC%82%B4%EA%B3%84%EB%9E%80%EA%B5%AD.PNG?alt=media&token=5960c20d-04bc-4742-9fc0-ba1a66d422d4');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '고투웍', '마라군만두', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F11%EA%B3%A0%ED%88%AC%EC%9B%8D05%EB%A7%88%EB%9D%BC%EA%B5%B0%EB%A7%8C%EB%91%90.PNG?alt=media&token=526eade2-7e52-4490-96e3-afcda5a2fd42');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '홍콩분식', '짬뽕떡볶이', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F12%ED%99%8D%EC%BD%A9%EB%B6%84%EC%8B%9D01%EC%A7%AC%EB%BD%95%EB%96%A2%EB%B3%B6%EC%9D%B4.jpg?alt=media&token=592aee15-94cc-4062-be9a-f1b6f89b79fd');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '홍콩분식', '로제짬뽕떡볶이', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F12%ED%99%8D%EC%BD%A9%EB%B6%84%EC%8B%9D02%EB%A1%9C%EC%A0%9C%EC%A7%AC%EB%BD%95%EB%96%A1%EB%B3%B6%EC%9D%B4.jpg?alt=media&token=c7c65f76-105e-4128-ad91-21748b41e72c');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '홍콩분식', '직화무뼈닭발떡볶이', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F12%ED%99%8D%EC%BD%A9%EB%B6%84%EC%8B%9D03%EC%A7%81%ED%99%94%EB%AC%B4%EB%BC%88%EB%8B%AD%EB%B0%9C%EB%96%A1%EB%B3%B6%EC%9D%B4.jpg?alt=media&token=fb57f359-34e9-46d5-95a3-b9693349238e');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '홍콩분식', '마라떡볶이', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F12%ED%99%8D%EC%BD%A9%EB%B6%84%EC%8B%9D04%EB%A7%88%EB%9D%BC%EB%96%A1%EB%B3%B6%EC%9D%B4.jpg?alt=media&token=2500c101-1523-4c46-8d55-3fa11c84ee21');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '홍콩분식', '오리지널떡볶이', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F12%ED%99%8D%EC%BD%A9%EB%B6%84%EC%8B%9D05%EC%98%A4%EB%A6%AC%EC%A7%80%EB%84%90%EB%96%A1%EB%B3%B6%EC%9D%B4.jpg?alt=media&token=f97c2bd2-e3b4-47a8-9859-7091de023b87');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '백종원의쌈밥', '대패삼겹살쌈밥정식', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F13%EC%8C%88%EB%B0%A501%EB%8C%80%ED%8C%A8%EC%82%BC%EA%B2%B9%EC%82%B4%EC%8C%88%EB%B0%A5%EC%A0%95%EC%8B%9D.jpg?alt=media&token=73a7f5be-ad0b-467b-95a0-2fcaad07e4ec');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '백종원의쌈밥', '차돌박이쌈밥정식', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F13%EC%8C%88%EB%B0%A502%EC%B0%A8%EB%8F%8C%EB%B0%95%EC%9D%B4%EC%8C%88%EB%B0%A5%EC%A0%95%EC%8B%9D.jpg?alt=media&token=9c3d5284-72ea-4dbd-827a-d61e3779d05e');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '백종원의쌈밥', '생삼겹살쌈밥정식', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F13%EC%8C%88%EB%B0%A503%EC%83%9D%EC%82%BC%EA%B2%B9%EC%82%B4%EC%8C%88%EB%B0%A5%EC%A0%95%EC%8B%9D.jpg?alt=media&token=2a2df5a1-376d-4ee6-bad8-f15190a5850b');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '백종원의쌈밥', '칼집삼겹살쌈밥정식', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F13%EC%8C%88%EB%B0%A504%EC%B9%BC%EC%A7%91%EC%82%BC%EA%B2%B9%EC%82%B4%EC%8C%88%EB%B0%A5%EC%A0%95%EC%8B%9D.jpg?alt=media&token=7f261212-7503-429a-8514-660b2d0e54ea');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '백종원의쌈밥', '고추장/간장대패제육', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F13%EC%8C%88%EB%B0%A505%EA%B3%A0%EC%B6%94%EC%9E%A5%EA%B0%84%EC%9E%A5%EB%8C%80%ED%8C%A8%EC%A0%9C%EC%9C%A1.jpg?alt=media&token=9b66e730-8b44-4d3b-b40c-217eee91193e');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '본가', '우삼겹', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F14%EB%B3%B8%EA%B0%8001%EC%9A%B0%EC%82%BC%EA%B2%B9.jpg?alt=media&token=9f941d3e-51a0-4bc0-a162-06f42b9c5fb7');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '본가', 'LA양념갈비', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F14%EB%B3%B8%EA%B0%8002LA%EC%96%91%EB%85%90%EA%B0%88%EB%B9%84.jpg?alt=media&token=f7fd51a7-d8d2-4db4-b569-4e053bd8d628');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '본가', '본가모둠', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F14%EB%B3%B8%EA%B0%8003%EB%B3%B8%EA%B0%80%EB%AA%A8%EB%91%A0.jpg?alt=media&token=028fd799-e860-448f-b867-7cf00a239d53');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '본가', '우삼겹정식', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F14%EB%B3%B8%EA%B0%8004%EC%9A%B0%EC%82%BC%EA%B2%B9%EC%A0%95%EC%8B%9D.jpg?alt=media&token=d541e8b3-ff7d-4be1-a2c7-920012614b1f');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '본가', '본가비빔밥', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F14%EB%B3%B8%EA%B0%8005%EB%B3%B8%EA%B0%80%EB%B9%84%EB%B9%94%EB%B0%A5.jpg?alt=media&token=c772a8c0-b7a9-4894-a867-8f30b8af0b46');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '인생설렁탕', '설렁탕', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F15%EC%9D%B8%EC%83%9D%EC%84%A4%EB%A0%81%ED%83%9501%EC%84%A4%EB%A0%81%ED%83%95.jpg?alt=media&token=fab7a84e-7f75-40a8-911a-d28679cc6ac4');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '인생설렁탕', '순대국', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F15%EC%9D%B8%EC%83%9D%EC%84%A4%EB%A0%81%ED%83%9502%EC%88%9C%EB%8C%80%EA%B5%AD.jpg?alt=media&token=de6a6173-4616-40c2-85cf-12f036241ab5');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '인생설렁탕', '직화제육볶음', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F15%EC%9D%B8%EC%83%9D%EC%84%A4%EB%A0%81%ED%83%9503%EC%A7%81%ED%99%94%EC%A0%9C%EC%9C%A1%EB%B3%B6%EC%9D%8C.jpg?alt=media&token=8635e542-b224-4d8e-8421-69b90347bb85');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '인생설렁탕', '직화스지정식', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F15%EC%9D%B8%EC%83%9D%EC%84%A4%EB%A0%81%ED%83%9504%EC%A7%81%ED%99%94%EC%8A%A4%EC%A7%80%EC%A0%95%EC%8B%9D.jpg?alt=media&token=87fdc268-cea1-4be6-9a58-aea119d93bcb');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '인생설렁탕', '직화소불고기&냉면세트', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F15%EC%9D%B8%EC%83%9D%EC%84%A4%EB%A0%81%ED%83%9505%EC%A7%81%ED%99%94%EC%86%8C%EB%B6%88%EA%B3%A0%EA%B8%B0%EB%83%89%EB%A9%B4%EC%84%B8%ED%8A%B8.jpg?alt=media&token=a51f3581-cfa4-4884-b962-dc744dd5182e');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '막이오름', '수육전골', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F16%EB%A7%89%EC%9D%B4%EC%98%A4%EB%A6%8401%EC%88%98%EC%9C%A1%EC%A0%84%EA%B3%A8.jpg?alt=media&token=3361c4d4-fd5c-4054-ba9c-b353a791e800');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '막이오름', '우대창전골', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F16%EB%A7%89%EC%9D%B4%EC%98%A4%EB%A6%8402%EC%9A%B0%EB%8C%80%EC%B0%BD%EC%A0%84%EA%B3%A8.jpg?alt=media&token=b424e9ee-94f7-4fd0-b5f1-340ee2e07095');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '막이오름', '크림바지락술찜', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F16%EB%A7%89%EC%9D%B4%EC%98%A4%EB%A6%8403%ED%81%AC%EB%A6%BC%EB%B0%94%EC%A7%80%EB%9D%BD%EC%88%A0%EC%B0%9C.jpg?alt=media&token=36420e3d-7e95-46d1-b874-21b3d7e9eed7');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '막이오름', '눈꽃베이컨감자전', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F16%EB%A7%89%EC%9D%B4%EC%98%A4%EB%A6%8404%EB%88%88%EA%BD%83%EB%B2%A0%EC%9D%B4%EC%BB%A8%EA%B0%90%EC%9E%90%EC%A0%84.jpg?alt=media&token=afa9fafd-8682-436e-aa19-f6bb09f1e833');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '막이오름', '빽햄김치전', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F16%EB%A7%89%EC%9D%B4%EC%98%A4%EB%A6%8405%EB%B9%BD%ED%96%84%EA%B9%80%EC%B9%98%EC%A0%84.jpg?alt=media&token=a9660c61-de64-433d-9314-647aeeaa3d82');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '연돈볼카츠', '연돈볼카츠', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F17%EC%97%B0%EB%8F%88%EB%B3%BC%EC%B9%B4%EC%B8%A001%EC%97%B0%EB%8F%88%EB%B3%BC%EC%B9%B4%EC%B8%A0.jpg?alt=media&token=5e4298db-6e4a-44ed-a617-92245103cd3c');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '연돈볼카츠', '치즈볼카츠', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F17%EC%97%B0%EB%8F%88%EB%B3%BC%EC%B9%B4%EC%B8%A002%EC%B9%98%EC%A6%88%EB%B3%BC%EC%B9%B4%EC%B8%A0.jpg?alt=media&token=67422d37-5a2e-4d09-adb4-7552113d6c54');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '연돈볼카츠', '청양볼카츠', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F17%EC%97%B0%EB%8F%88%EB%B3%BC%EC%B9%B4%EC%B8%A003%EC%B2%AD%EC%96%91%EB%B3%BC%EC%B9%B4%EC%B8%A0.jpg?alt=media&token=76e889ca-1de8-47c0-a0cc-1b40d04cc963');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '연돈볼카츠', '볼카츠샌드', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F17%EC%97%B0%EB%8F%88%EB%B3%BC%EC%B9%B4%EC%B8%A004%EB%B3%BC%EC%B9%B4%EC%B8%A0%EC%83%8C%EB%93%9C.jpg?alt=media&token=aa06b57c-ee36-49e2-9cb4-62a1d42c95f3');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '연돈볼카츠', '트리플볼카츠박스', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F17%EC%97%B0%EB%8F%88%EB%B3%BC%EC%B9%B4%EC%B8%A005%ED%8A%B8%EB%A6%AC%ED%94%8C%EB%B3%BC%EC%B9%B4%EC%B8%A0%EB%B0%95%EC%8A%A4.jpg?alt=media&token=e49f35fc-fe1e-4dbc-a6cb-1ad627f8adc7');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '돌배기집', '돌배기사합', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F18%EB%8F%8C%EB%B0%B0%EA%B8%B0%EC%A7%9101%EB%8F%8C%EB%B0%B0%EA%B8%B0%EC%82%AC%ED%95%A9.jpg?alt=media&token=90ab0827-e518-488f-92c8-480c2ce7d836');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '돌배기집', '해물삼합', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F18%EB%8F%8C%EB%B0%B0%EA%B8%B0%EC%A7%9102%ED%95%B4%EB%AC%BC%EC%82%BC%ED%95%A9.jpg?alt=media&token=6057c48a-b014-45cf-b922-173bc8f74d77');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '돌배기집', '프라임모둠', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F18%EB%8F%8C%EB%B0%B0%EA%B8%B0%EC%A7%9103%ED%94%84%EB%9D%BC%EC%9E%84%EB%AA%A8%EB%91%A0.jpg?alt=media&token=d1feaeb6-71a0-45fb-8303-ac6dce48f03d');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '돌배기집', '돌배기', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F18%EB%8F%8C%EB%B0%B0%EA%B8%B0%EC%A7%9104%EB%8F%8C%EB%B0%B0%EA%B8%B0.jpg?alt=media&token=3a5b92ae-e4c4-438f-98b7-7348d0b72a49');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '돌배기집', '돌배기대창찌개', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F18%EB%8F%8C%EB%B0%B0%EA%B8%B0%EC%A7%9105%EB%8F%8C%EB%B0%B0%EA%B8%B0%EB%8C%80%EC%B0%BD%EC%B0%8C%EA%B0%9C.jpg?alt=media&token=745cd6ab-03d2-4a02-9447-be99365f2b8b');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '미정국수', '멸치국수', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F19%EB%AF%B8%EC%A0%95%EA%B5%AD%EC%88%9801%EB%A9%B8%EC%B9%98%EA%B5%AD%EC%88%98.jpg?alt=media&token=f4096ba5-272d-45af-b629-99449857a293');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '미정국수', '만두국수', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F19%EB%AF%B8%EC%A0%95%EA%B5%AD%EC%88%9802%EB%A7%8C%EB%91%90%EA%B5%AD%EC%88%98.jpg?alt=media&token=76f05de3-ec19-4bca-b175-34e12029c7a0');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '미정국수', '간비국수', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F19%EB%AF%B8%EC%A0%95%EA%B5%AD%EC%88%9803%EA%B0%84%EB%B9%84%EA%B5%AD%EC%88%98.jpg?alt=media&token=1d777c8f-cc47-4ee6-bed4-29eb8268fe35');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '미정국수', '김치제육덮밥', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F19%EB%AF%B8%EC%A0%95%EA%B5%AD%EC%88%9804%EA%B9%80%EC%B9%98%EC%A0%9C%EC%9C%A1%EB%8D%AE%EB%B0%A5.jpg?alt=media&token=5ef98005-9b23-442b-9841-052c4405e859');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '미정국수', '쫀득해만두', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F19%EB%AF%B8%EC%A0%95%EA%B5%AD%EC%88%9805%EC%AB%80%EB%93%9D%ED%95%B4%EB%A7%8C%EB%91%90.jpg?alt=media&token=d9eea989-f19a-4d11-82bd-7869e4a31074');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '백철판', '매운철판닭갈비', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F20%EB%B0%B1%EC%B2%A0%ED%8C%9001%EB%A7%A4%EC%9A%B4%EC%B2%A0%ED%8C%90%EB%8B%AD%EA%B0%88%EB%B9%84.png?alt=media&token=52b80e9b-84ba-4dc1-9193-ceaeaea38d81');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '백철판', '쭈삼철판볶음', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F20%EB%B0%B1%EC%B2%A0%ED%8C%9002%EC%AD%88%EC%82%BC%EC%B2%A0%ED%8C%90%EB%B3%B6%EC%9D%8C.png?alt=media&token=039db302-07cf-429c-a0a3-07119ecb8a12');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '백철판', '우삼겹철판볶음', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F20%EB%B0%B1%EC%B2%A0%ED%8C%9003%EC%9A%B0%EC%82%BC%EA%B2%B9%EC%B2%A0%ED%8C%90%EB%B3%B6%EC%9D%8C.png?alt=media&token=664a1869-e637-4837-abea-96d2b9afd284');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '백철판', '우주떡볶이', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F20%EB%B0%B1%EC%B2%A0%ED%8C%9004%EC%9A%B0%EC%A3%BC%EB%96%A1%EB%B3%B6%EC%9D%B4.png?alt=media&token=4bd0a4f1-80f5-4197-8e6b-dec4b169e587');

INSERT INTO MENU_TB (MENU_NO, BRAND_NAME, MENU_NAME, MENU_IMG)
VALUES (MENU_NO_SEQ.NEXTVAL, '백철판', '비빔막국수', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F%EB%A9%94%EB%89%B4%EC%82%AC%EC%A7%84%2F20%EB%B0%B1%EC%B2%A0%ED%8C%9005%EB%B9%84%EB%B9%94%EB%A7%89%EA%B5%AD%EC%88%98.png?alt=media&token=cb5636bf-ead7-455c-8846-dbc17a15d068');


-- MENU 테스트용 쿼리문

SELECT * FROM MENU_TB;						/* 전체 데이터 조회 */

DELETE FROM MENU_TB WHERE BRAND_NAME = ; 	/* 브랜드 단위로 데이터 삭제 */

DROP SEQUENCE MENU_NO_SEQ; 					/* MENU_NO 시퀀스 삭제*/

DROP TABLE MENU_TB;							/* MENU 테이블 삭제 */

COMMIT;
