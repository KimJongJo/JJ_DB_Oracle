
CREATE TABLE MAJOR(
		MAJOR_NO NUMBER PRIMARY KEY,
		MAJOR_NM VARCHAR2(100) NOT NULL
);


CREATE TABLE STUDENT(
		STUDENT_ID NUMBER PRIMARY KEY,
		STUDENT_NAME VARCHAR2(20) NOT NULL,
		GENDER VARCHAR2(3) CHECK (GENDER IN ('남','여')),
		BIRTH DATE,
		MAJOR_NO NUMBER REFERENCES MAJOR (MAJOR_NO) ON DELETE SET NULL
);


COMMENT ON COLUMN MAJOR.MAJOR_NO IS '학과번호';
COMMENT ON COLUMN MAJOR.MAJOR_NM IS '학과명';
COMMENT ON COLUMN STUDENT.STUDENT_ID IS '학번';
COMMENT ON COLUMN STUDENT.STUDENT_NAME IS '이름';
COMMENT ON COLUMN STUDENT.GENDER IS '성별';
COMMENT ON COLUMN STUDENT.BIRTH IS '생년월일 : "YYYY-MM-DD"형식으로 작성';
COMMENT ON COLUMN STUDENT.MAJOR_NO IS '전공학과번호';

INSERT INTO MAJOR VALUES(1001,'컴퓨터공학과');
INSERT INTO MAJOR VALUES(1002,'기계공학과');
INSERT INTO MAJOR VALUES(1003,'체육학과');
INSERT INTO MAJOR VALUES(1004,'연극영화과');
INSERT INTO MAJOR VALUES(1005,'생명공학과');


INSERT INTO STUDENT
VALUES ('000001', '김종조','남','2000-03-09',1002);

INSERT INTO STUDENT
VALUES ('000002', '홍길동','남','1978-01-12',1001);

INSERT INTO STUDENT
VALUES ('000003', '유관순','여','2011-12-06',1003);

INSERT INTO STUDENT
VALUES ('000004', '징징이','남','2003-06-07',1004);

INSERT INTO STUDENT
VALUES ('000005', '고구마','여','2009-08-21',1005);


SELECT * FROM MAJOR;

SELECT * FROM STUDENT;



ALTER TABLE MAJOR COLUMN MAJOR_NM TO MAJOR_NAME;












-- 카테고리 테이블
CREATE TABLE CATEGORIES(
		CATEGORY_ID NUMBER PRIMARY KEY,
		CATEGORY_NAME VARCHAR2(100) UNIQUE
);

COMMENT ON COLUMN CATEGORIES.CATEGORY_ID IS '카테고리 ID';
COMMENT ON COLUMN CATEGORIES.CATEGORY_NAME IS '카테고리 이름';

INSERT INTO CATEGORIES VALUES(1, '스마트폰');
INSERT INTO CATEGORIES VALUES(2, 'TV');
INSERT INTO CATEGORIES VALUES(3, 'Gaming');

SELECT * FROM CATEGORIES;



-- 상품정보 테이블
CREATE TABLE PRODUCTS(
		PRODUCT_ID NUMBER PRIMARY KEY,
		PRODUCT_NAME VARCHAR2(100) NOT NULL,
		CATEGORY NUMBER REFERENCES CATEGORIES(CATEGORY_ID),
		PRICE NUMBER DEFAULT 0,
		STOCK_QUANTITY NUMBER DEFAULT 0
);

COMMENT ON COLUMN PRODUCTS.PRODUCT_ID IS '상품 코드';
COMMENT ON COLUMN PRODUCTS.PRODUCT_NAME IS '상품 이름';
COMMENT ON COLUMN PRODUCTS.CATEGORY IS '카테고리';
COMMENT ON COLUMN PRODUCTS.PRICE IS '가격';
COMMENT ON COLUMN PRODUCTS.STOCK_QUANTITY IS '재고량';


INSERT INTO PRODUCTS VALUES(101, 'Apple iPhone 12', 1, 1500000, 30);
INSERT INTO PRODUCTS VALUES(102, 'Samsung Galaxy S24', 1, 1800000, 50);
INSERT INTO PRODUCTS VALUES(201, 'LG OLED TV', 2, 3600000, 10);
INSERT INTO PRODUCTS VALUES(301, 'Sony PlayStation5', 3, 70000, 15);

SELECT * FROM PRODUCTS;

-- 고객 정보 테이블
CREATE TABLE CUSTOMERS(
		CUSTOMER_ID NUMBER PRIMARY KEY,
		NAME VARCHAR2(20) NOT NULL,
		GENDER CHAR(3) CHECK (GENDER IN('남','여')),
		ADDRESS VARCHAR2(100),
		PHONE VARCHAR(30)
);

COMMENT ON COLUMN CUSTOMERS.CUSTOMER_ID IS '고객 ID';
COMMENT ON COLUMN CUSTOMERS.NAME IS '이름';
COMMENT ON COLUMN CUSTOMERS.GENDER IS '성별';
COMMENT ON COLUMN CUSTOMERS.ADDRESS IS '주소';
COMMENT ON COLUMN CUSTOMERS.PHONE IS '전화번호';


INSERT INTO CUSTOMERS VALUES(1, '홍길동','남','서울시 성동구 왕십리','010-1111-2222');
INSERT INTO CUSTOMERS VALUES(2, '유관순','여','서울시 종로구 안국동','010-3333-1111');

SELECT * FROM CUSTOMERS;




-- 주문 정보 테이블
CREATE TABLE ORDERS(
		ORDER_ID NUMBER PRIMARY KEY,
		CUSTOMER_ID NUMBER REFERENCES CUSTOMERS(CUSTOMER_ID) ON DELETE CASCADE,
		ORDER_DATE DATE DEFAULT SYSDATE,
		STATUS CHAR(1) DEFAULT 'N',
		CHECK(STATUS IN('Y','N'))
);


COMMENT ON COLUMN ORDERS.ORDER_ID IS '주문번호';
COMMENT ON COLUMN ORDERS.CUSTOMER_ID IS '고객 ID';
COMMENT ON COLUMN ORDERS.ORDER_DATE IS '주문일';
COMMENT ON COLUMN ORDERS.STATUS IS '처리상태';


INSERT INTO ORDERS VALUES(576, 1, '2024-02-29', 'N');
INSERT INTO ORDERS VALUES(978, 2, '2024-03-11', 'Y');
INSERT INTO ORDERS VALUES(777, 2, '2024-03-11', 'N');
INSERT INTO ORDERS VALUES(134, 1, '2022-12-25', 'Y');
INSERT INTO ORDERS VALUES(499, 1, '2020-01-03', 'Y');

SELECT * FROM ORDERS;




-- 주문 상세 정보 테이블
CREATE TABLE ORDER_DETAILS(
		ORDER_DETAIL_ID NUMBER PRIMARY KEY,
		ORDER_ID NUMBER REFERENCES ORDERS(ORDER_ID) ON DELETE CASCADE,
		PRODUCT_ID NUMBER REFERENCES PRODUCTS(PRODUCT_ID) ON DELETE SET NULL,
		QUANTITY NUMBER,
		PRICE_PER_UNIT NUMBER
);

COMMENT ON COLUMN ORDER_DETAILS.ORDER_DETAIL_ID IS '주문 상세 ID';
COMMENT ON COLUMN ORDER_DETAILS.ORDER_ID IS '주문 번호';
COMMENT ON COLUMN ORDER_DETAILS.PRODUCT_ID IS '상품 코드';
COMMENT ON COLUMN ORDER_DETAILS.QUANTITY IS '수량';
COMMENT ON COLUMN ORDER_DETAILS.PRICE_PER_UNIT IS '가격';


INSERT INTO ORDER_DETAILS VALUES(111, 576, 101, 1, 1500000);
INSERT INTO ORDER_DETAILS VALUES(222, 978, 201, 2, 3600000);
INSERT INTO ORDER_DETAILS VALUES(333, 978, 102, 1, 1800000);
INSERT INTO ORDER_DETAILS VALUES(444, 777, 301, 5, 70000);
INSERT INTO ORDER_DETAILS VALUES(555, 134, 102, 1, 1800000);
INSERT INTO ORDER_DETAILS VALUES(666, 499, 201, 3, 3600000);



SELECT * FROM ORDER_DETAILS;


-- 1. 쇼핑몰 관리자가 주문은 받았으나, 아직 처리가 안된 주문을 처리하려고 한다.
-- 현재 주문 내역 중 아직 처리되지 않은 주문을 조회하시오. 😀
-- (고객명, 주문일, 처리상태)


SELECT NAME 고객명, ORDER_DATE 주문일, STATUS 처리상태
FROM CUSTOMERS
NATURAL JOIN ORDERS
WHERE STATUS = 'N';





-- 2. 홍길동 고객이 이번년도에 본인이 주문한 전체 내역을 조회하고자 한다.
-- 주문번호, 주문날짜, 처리상태 조회하시오 😀


SELECT ORDER_ID 주문번호, ORDER_DATE 주문날짜, STATUS 처리상태
FROM ORDERS
NATURAL JOIN CUSTOMERS
WHERE NAME = '홍길동'
AND EXTRACT (YEAR FROM ORDER_DATE) = 2024;




-- 3. 유관순 고객이 지금껏 주문한 상품의 수량 별 금액을 조회하려고 한다.
-- 주문번호, 상품명, 수량, 개별금액, 주문별금액을 조회하시오 😀


SELECT ORDER_ID 주문번호, PRODUCT_NAME 상품명, QUANTITY 수량, PRICE 개별금액, QUANTITY * PRICE 주문별금액합계
FROM ORDERS
NATURAL JOIN ORDER_DETAILS
NATURAL JOIN PRODUCTS
NATURAL JOIN CUSTOMERS
WHERE NAME = '유관순'
ORDER BY 1, 2;













