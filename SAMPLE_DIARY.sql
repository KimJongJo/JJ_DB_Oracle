


-- 다이어리 테이블
CREATE TABLE SAMPLE_DIARY(
	DIARY_NO NUMBER PRIMARY KEY,
	DIARY_TITLE VARCHAR2(100) NOT NULL,
	DIARY_CONTENT VARCHAR2(500) NOT NULL,
	DIARY_FEELING VARCHAR2(20) NOT NULL,
	DIARY_WEATHER VARCHAR2(20) NOT NULL,
	DIARY_DATE VARCHAR2(50) NOT NULL
);

-- DIARY_DATE의 기본값을 YYYYMMDD HH24MISS로 변경
ALTER TABLE SAMPLE_DIARY MODIFY DIARY_DATE VARCHAR2(50) DEFAULT TO_CHAR(SYSDATE,'YYYY"년"MM"월"DD"일" HH24"시" MI"분"');


COMMENT ON COLUMN "SAMPLE_DIARY".DIARY_NO IS '다이어리 번호';
COMMENT ON COLUMN "SAMPLE_DIARY".DIARY_TITLE IS '다이어리 제목';
COMMENT ON COLUMN "SAMPLE_DIARY".DIARY_CONTENT IS '다이어리 내용';
COMMENT ON COLUMN "SAMPLE_DIARY".DIARY_FEELING IS '기분';
COMMENT ON COLUMN "SAMPLE_DIARY".DIARY_WEATHER IS '날씨';
COMMENT ON COLUMN "SAMPLE_DIARY".DIARY_DATE IS '날짜';


-- SEQUENCE 생성
CREATE SEQUENCE SEQ_DIARY_NO NOCACHE;

-- sample 값 추가
INSERT INTO SAMPLE_DIARY
VALUES(SEQ_DIARY_NO.NEXTVAL, '다이어리 샘플1','오늘의 일기 이번주는 수요일이 공휴일이라서 수요일, 토요일, 일요일날 쉬는날이다. 중간에 쉬는날이 있어서 다행이다.',
'나쁘지 않음', '햇빛 쨍쨍', DEFAULT);



SELECT * FROM SAMPLE_DIARY;


