/*테이블 생성*/
-- MEMBER Table Create SQL
CREATE TABLE MEMBER
(
    ID          VARCHAR2(20)    NOT NULL, 
    NAME        VARCHAR2(30)    NOT NULL, 
    PASSWORD    VARCHAR2(20)    NOT NULL, 
    PHONE       VARCHAR2(20)    NULL, 
    EMAIL       VARCHAR2(50)    NULL, 
    CONSTRAINT MEMBER_PK PRIMARY KEY (ID)
);



-- MEMBER Table Create SQL
CREATE TABLE BOARD
(
    BNO        NUMBER            NOT NULL, 
    TITLE      VARCHAR2(150)     NOT NULL, 
    CONTENT    VARCHAR2(3000)    NOT NULL, 
    ID         VARCHAR2(20)      NOT NULL, 
    REGDATE    DATE    DEFAULT SYSDATE  NOT NULL, 
    CONSTRAINT BOARD_PK PRIMARY KEY (BNO)
);


ALTER TABLE BOARD
    ADD CONSTRAINT FK_BOARD_ID_MEMBER_ID FOREIGN KEY (ID)
        REFERENCES MEMBER (ID);

-- 데이터 입력, 수정, 삭제 작업
-- (입력)위의 데이터를 MEMBER 테이블에 입력한 후 2개를 추가로 입력(5명 입력)
INSERT INTO MEMBER(ID, NAME, PASSWORD, PHONE , EMAIL)
VALUES('hong', '홍길동', 'hong1234', '010-1111-1111', 'hong@test.com');

INSERT INTO MEMBER(ID, NAME, PASSWORD, PHONE , EMAIL)
VALUES('kim', '김유신', 'kim1234', '010-2222-2222', 'kim@test.com');

INSERT INTO MEMBER(ID, NAME, PASSWORD, PHONE , EMAIL)
VALUES('kang', '강감찬', 'kang1234', '010-3333-3333', 'kang@test.com');

INSERT INTO MEMBER(ID, NAME, PASSWORD, PHONE , EMAIL)
VALUES('give', '주다슬', 'ju1234', '010-5555-5555', 'ju@test.com');

INSERT INTO MEMBER(ID, NAME, PASSWORD, PHONE , EMAIL)
VALUES('ulji', '을지문덕', 'ulji1234', '010-6666-6666', 'ulji@test.com');

-- 출력
SELECT * FROM MEMBER;

-- 저장
COMMIT;

--(입력)BOARD 테이블에 홍길동이 작성한 게시글 2개 입력
INSERT INTO BOARD(BNO, TITLE, CONTENT, ID, REGDATE)
VALUES(1, '암행어사', '홍길동 암행어사 납시오', 'hong', '2020-12-20');

INSERT INTO BOARD(BNO, TITLE, CONTENT, ID, REGDATE)
VALUES(2, '암행어사사', '홍길동 암행어사 납시오오', 'hong', '2020-12-23');

-- 출력
SELECT * FROM BOARD;

-- 저장
COMMIT;

-- 수정
-- (수정)김유신의 전화번호와 이메일을 010-2222-1234, kim@mystudy.com 으로 수정
UPDATE member
SET PHONE = '010-2222-1234', EMAIL = 'kim@mystudy.com'
WHERE NAME = '김유신';

-- 출력
SELECT * FROM member;

-- 저장
COMMIT;

-- 삭제
-- (삭제) 추가 입력한 2명의 회원정보를 삭제
DELETE FROM MEMBER
WHERE NAME = '주다슬';

DELETE FROM MEMBER
WHERE NAME = '을지문덕';

-- 출력
SELECT * FROM member;

-- 저장
COMMIT;

--제약조건의 확인
--USER_CONS_COLUMS : 컬럼에 할당된 제약 조건 조회
--USER_CONSTRAINTS : 유저가 소유한 모든 제약 조건 조회
--제약조건의 확인
--USER_CONS_COLUMS : 컬럼에 할당된 제약 조건 조회
--USER_CONSTRAINTS : 유저가 소유한 모든 제약 조건 조회
SELECT A.TABLE_NAME,　
       A.COLUMN_NAME,
       B.CONSTRAINT_TYPE,
       DECODE(B.CONSTRAINT_TYPE,
              'P','PRIMARY KEY',
              'U','UNIQUE KEY',
              'C','CHECK OR NOT NULL',
              'R','FOREIGN KEY') CONSTRAINT_TYPE　
  FROM USER_CONS_COLUMNS A, USER_CONSTRAINTS B　　
 WHERE A.TABLE_NAME IN ('BOARD', 'MEMBER')　
   AND A.TABLE_NAME = B.TABLE_NAME　　
   AND A.CONSTRAINT_NAME = B.CONSTRAINT_NAME　　
 ORDER BY 1;


