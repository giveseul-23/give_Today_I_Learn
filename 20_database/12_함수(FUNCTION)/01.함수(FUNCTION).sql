/*
    함수(FUNCTION)
    실행 후 값을 리턴(RETURN) 하는 프로그램
    <기본적인 형태>
    CREATE OR REPLACE FUNCTION FUNCTION1 
    (
      PARAM1 IN VARCHAR2 -- 파라미터 작성
    ) RETURN VARCHAR2 AS  -- 리턴 데이터 타입선언
    BEGIN
      RETURN 리턴값; -- 리턴할 값
    END FUNCTION1;
****************************/

-- BOOKID로 책제목 확인 함수(파라미터 값 : BOOKID, RETURN값 : BOOKNAME)
CREATE OR REPLACE FUNCTION FUNCTION1 (
  PARAM1 IN VARCHAR2 --파라미터 작성
) RETURN VARCHAR2 --리턴 데이터 타입선언
AS 
BEGIN
  RETURN 리턴값; --리턴 값
END;
*********************************/
-- BOOKID로 책제목 확인 함수(파라미터값 : BOOKID, RETURN값 : BOOKNAME)
create or replace FUNCTION GET_BOOKNAME (
    IN_ID IN NUMBER
) RETURN VARCHAR2 
AS
    V_BOOKNAME book.bookname%TYPE;
BEGIN
    SELECT BOOKNAME INTO V_BOOKNAME
    FROM BOOK
    WHERE BOOKID = IN_ID;
    
    RETURN V_BOOKNAME; --리턴값 전달
END;
/*
create or replace FUNCTION GET_BOOKNAME (
    IN_ID IN NUMBER 
)RETURN VARCHAR2
AS
                            --%TYPE : 같은 타입을 쓰겠다는 말
    V_BOOKNAME book.bookname%TYPE; -- 리턴값 책제목을 담아줄 V_BOOKNAME 변수선언
BEGIN
    --리턴문이 없으면 오류가 생김, 리턴문은 필수임
    DBMS_OUTPUT.PUT_LINE('IN_ID : ' || IN_ID);
    RETURN V_BOOKNAME;
END;*/

--함수의 사용
SELECT BOOKID, BOOKNAME, GET_BOOKNAME(BOOKID)
FROM BOOK;
------
--SELECT 절에 사용자함수 사용
SELECT O.*, get_bookname(o.bookid) AS BOOKNAME
FROM ORDERS O; -- 여기다가 적어줘야 함

--WHERE 절에 사용
SELECT O.*, get_bookname(o.bookid) AS BOOKNAME
FROM ORDERS O
WHERE get_bookname(o.bookid) = '야구를 부탁해'; 

--==================
/*
실습 - 고객 ID 값을 받아서 고객명을 돌려주는 함수 작성(CUSTOMER 테이블 사용)
1. 함수작성 : GET_CUSTNAME
2. 함수를 사용해서 ORDERS 테이블 데이터 조회
    GET_BOOKNAME, GET_CUSTNAME 함수사용 주문(판매)정보와 책제목, 고객명 조회
************************/
CREATE OR REPLACE FUNCTION GET_CUSTNAME 
(
--요기 안에는 매개변수가 들어옴
  IN_ID IN NUMBER 
  
) RETURN VARCHAR2 
AS
    C_CNAME CUSTOMER.NAME%TYPE;
BEGIN
    SELECT NAME INTO C_CNAME
    FROM CUSTOMER
    WHERE CUSTID = IN_ID;
    
    RETURN C_CNAME;
END;

SELECT GET_CUSTNAME(CUSTID)
FROM CUSTOMER;

--SELECT O.*, GET_CUSTNAME(CUSTID) AS CUSTNAME FROM ORDERS O;

SELECT O.*, GET_CUSTNAME(O.CUSTID) AS CUSTNAME, get_bookname(o.bookid) AS BOOKNAME FROM ORDERS O
WHERE GET_CUSTNAME(O.CUSTID) = '김연아';

/*
            --서브쿼리도 가능
SELECT O.*, (SELECT BOOKNAME FROM BOOK WHERE BOOKID = O.BOOKID) AS BOOKNAME 
FROM ORDERS O;
*/

--함수와 동일한 결과를 얻을 수 있음, 하지만 대용량 데이터에서는 문제가 될 수 있기에 함수를 사용하는 것이 더 효율적이다.
SELECT O.*, B.BOOKNAME, C.NAME 
FROM ORDERS O, BOOK B, CUSTOMER C
WHERE O.BOOKID = B.BOOKID -- JOIN 조건
AND O.CUSTID = C.CUSTID -- JOIN 조건
AND C.NAME = '박지성'; -- 이건 WHERE 조건

-- ANSI 형태
SELECT O.*, B.BOOKNAME, C.NAME 
FROM ORDERS O INNER JOIN BOOK B
    ON o.bookid = b.bookid --조인조건
    INNER JOIN CUSTOMER C
    ON o.custid = c.custid --조인조건
WHERE c.name = '김연아'; --WHERE 조건