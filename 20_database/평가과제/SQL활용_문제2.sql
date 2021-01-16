-- 1. MEMBER 테이블의 NAME 컬럼에 MEMBER_IDX_NAME 이라는 인덱스를 만드시오
CREATE INDEX MEMBER_IDX_NAME ON MEMBER(NAME);

-- 2. MEMBER 테이블과 BOARD 테이블을 조인하여 MEMBER 테이블의 아이디, 성명, 전화번호, 이메일과 
-- BOARD테이블의 글번호, 제목, 작성일 정보를 조회할 수 있는 뷰(VIEW_MEMBER_BOARD)를 만드시오
CREATE VIEW VIEW_MEMBER_BOARD
AS SELECT M.ID AS 아이디, M.NAME AS 성명, M.PHONE AS 전화번호, M.EMAIL AS 이메일,
    B.BNO AS 글번호, B.TITLE AS 제목, B.REGDATE AS 작성일정보
FROM MEMBER M FULL OUTER JOIN BOARD B
    ON M.ID = B.ID;
    
-- 출력
SELECT * FROM VIEW_MEMBER_BOARD;

-- 3. 홍길동이 작성한 글을 MEMBER 테이블과 BOARD 테이블을 조인해서 성명, 글 제목, 작성일을 작성일 순으로 조회하시오.
SELECT M.NAME AS 성명, B.TITLE AS 제목, B.REGDATE AS 작성일
FROM MEMBER M INNER JOIN BOARD B
    ON M.ID = B.ID
ORDER BY 작성일;