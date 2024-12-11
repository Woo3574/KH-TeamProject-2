--MINI PROJECT
--리뷰_시퀀스 생성
CREATE SEQUENCE RV_NO_SEQ
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE;

--리뷰_테이블 생성
CREATE TABLE REVIEW_TB (
	rv_no INTEGER NOT NULL PRIMARY KEY,	/*리뷰 번호*/
	user_id VARCHAR2(20) NOT NULL,		/*사용자 아이디*/
	rv_date DATE DEFAULT SYSDATE,		/*리뷰 작성일*/
	store_name VARCHAR2(50),			/*예약 매장명*/
	r_submit_time DATE DEFAULT SYSDATE,	/*예약 완료 날짜/시간*/
	r_no INTEGER NOT NULL,				/*예약 번호*/
	rv_price DECIMAL(3, 1) NOT NULL,	/*별점(가격)*/
	rv_taste DECIMAL(3, 1) NOT NULL,	/*별점(맛)*/
	rv_vibe DECIMAL(3, 1) NOT NULL,		/*별점(분위기)*/
	rv_kind DECIMAL(3, 1) NOT NULL,		/*별점(친절도)*/
	--	제약조건
	CONSTRAINT fk_review_reservation
		FOREIGN KEY (r_no, r_submit_time)
		REFERENCES RESERVATION_TB (r_no, r_submit_time)
		ON DELETE CASCADE,
	CONSTRAINT fk_review_user
		FOREIGN KEY (user_id)
		REFERENCES USER_TB (user_id)
		ON DELETE CASCADE,
	CONSTRAINT fk_review_store
		FOREIGN KEY (store_name)
		REFERENCES STORE_TB (store_name)
		ON DELETE CASCADE,
	-- 별점 범위(0~5) 제한
    CONSTRAINT chk_rating_range CHECK (rv_price BETWEEN 0.0 AND 5.0),
    CONSTRAINT chk_taste_range CHECK (rv_taste BETWEEN 0.0 AND 5.0),
    CONSTRAINT chk_vibe_range CHECK (rv_vibe BETWEEN 0.0 AND 5.0),
    CONSTRAINT chk_kind_range CHECK (rv_kind BETWEEN 0.0 AND 5.0)
);

--리뷰_더미 데이터 생성
INSERT INTO REVIEW_TB (rv_no, user_id, rv_date, store_name, r_submit_time, r_no, rv_price, rv_taste, rv_vibe, rv_kind)
VALUES (RV_NO_SEQ.NEXTVAL, 'asdf1234', TO_DATE('2024-11-29', 'YYYY-MM-DD'), '롤링파스타 가로수길점', TO_DATE('2024-11-28', 'YYYY-MM-DD'), 1, 5.0, 4.5, 4.0, 5.0);

--리뷰_테스트용 쿼리문
SELECT * FROM REVIEW_TB;	/*전체 리뷰 조회*/

DROP TABLE REVIEW_TB;		/*리뷰 테이블 삭제*/

DROP SEQUENCE RV_NO_SEQ;	/*리뷰 시퀀스 삭제*/

--DELETE FROM MEMBER_INFO WHERE MEMBER_ID = ;

COMMIT;