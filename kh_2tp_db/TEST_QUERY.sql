CREATE SEQUENCE reservation_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE TABLE test_reservations (
    reservation_id NUMBER PRIMARY KEY,   -- 예약 ID (PK)
    customer_name VARCHAR2(50) NOT NULL, -- 고객 이름
    phone_number VARCHAR2(15) NOT NULL, -- 고객 전화번호
    reservation_date DATE NOT NULL,     -- 예약 날짜
    reservation_time VARCHAR2(8) NOT NULL, -- 예약 시간
    num_people NUMBER NOT NULL,        -- 인원 수
    special_request VARCHAR2(255),      -- 특별 요청 사항 (NULL 허용)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- 예약 생성 시간
);

CREATE OR REPLACE TRIGGER reservations_bi
BEFORE INSERT ON reservations
FOR EACH ROW
BEGIN
    :NEW.reservation_id := reservation_seq.NEXTVAL;
END;

INSERT INTO test_reservations (customer_name, phone_number, reservation_date, reservation_time, num_people, special_request)
VALUES
    ('홍길동', '010-1234-5678', TO_DATE('2024-12-01', 'YYYY-MM-DD'), '12:00:00', 2, '창가 자리 부탁드립니다.');
INSERT INTO reservations (customer_name, phone_number, reservation_date, reservation_time, num_people, special_request)
VALUES
    ('김철수', '010-9876-5432', TO_DATE('2024-12-01', 'YYYY-MM-DD'), '13:00:00', 3, NULL);
INSERT INTO reservations (customer_name, phone_number, reservation_date, reservation_time, num_people, special_request)
VALUES
    ('이영희', '010-1111-2222', TO_DATE('2024-12-01', 'YYYY-MM-DD'), '14:00:00', 4, '아기 의자 준비 부탁드립니다.');
INSERT INTO reservations (customer_name, phone_number, reservation_date, reservation_time, num_people, special_request)
VALUES
    ('박민수', '010-3333-4444', TO_DATE('2024-12-01', 'YYYY-MM-DD'), '15:00:00', 2, NULL);
INSERT INTO reservations (customer_name, phone_number, reservation_date, reservation_time, num_people, special_request)
VALUES
    ('최지우', '010-5555-6666', TO_DATE('2024-12-01', 'YYYY-MM-DD'), '16:00:00', 1, '조용한 자리 요청');
INSERT INTO reservations (customer_name, phone_number, reservation_date, reservation_time, num_people, special_request)
VALUES
    ('한가인', '010-7777-8888', TO_DATE('2024-12-01', 'YYYY-MM-DD'), '17:00:00', 5, '단체 테이블 필요');
INSERT INTO reservations (customer_name, phone_number, reservation_date, reservation_time, num_people, special_request)
VALUES
    ('장동건', '010-9999-0000', TO_DATE('2024-12-01', 'YYYY-MM-DD'), '18:00:00', 3, NULL);
INSERT INTO reservations (customer_name, phone_number, reservation_date, reservation_time, num_people, special_request)
VALUES
    ('송중기', '010-1212-3434', TO_DATE('2024-12-01', 'YYYY-MM-DD'), '19:00:00', 4, '채식 메뉴 요청');
INSERT INTO reservations (customer_name, phone_number, reservation_date, reservation_time, num_people, special_request)
VALUES
    ('강호동', '010-5656-7878', TO_DATE('2024-12-01', 'YYYY-MM-DD'), '20:00:00', 2, NULL);
INSERT INTO reservations (customer_name, phone_number, reservation_date, reservation_time, num_people, special_request)
VALUES
    ('이효리', '010-8888-9999', TO_DATE('2024-12-01', 'YYYY-MM-DD'), '21:00:00', 2, '기념일 케이크 준비 가능 여부 확인');


DROP TABLE reservations;		/*테이블 삭제*/
DROP SEQUENCE reservation_seq; /*시퀀스 삭제*/

COMMIT;