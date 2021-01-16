--PL/SQL 프로시저(PROCEDURE)
SET SERVEROUTPUT ON; -- 서버 출력정보 표시 설정

DECLARE -- 변수선언
    V_EMPID NUMBER(5);
    V_NAME VARCHAR2(30);
BEGIN -- 실행문 시작
    V_EMPID := 100; --치환문(대입문) 부호 :=
    V_NAME := '홍길동';
    
    DBMS_OUTPUT.PUT_LINE(V_EMPID || ' : ' || V_NAME); -- -> 자바의 println()메소드와 동일한 기능
END; -- 실행문 끝(프로시저 끝)

------------------------
-- BOOK 테이블 데이터 중 일부를 화면 출력
DECLARE
    V_BOOKID NUMBER(2);
    V_BOOKNAME VARCHAR2(40);
    V_PUBLISHER VARCHAR2(40);
    V_PRICE NUMBER(8);
    
BEGIN
    -- SELECT ~ INTO ~ FROM 형태로 DB데이터 선택하고 INTO 절의 변수에 저장
    -- 주의 1개의 데이터만 처리가능
    SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE
    INTO V_BOOKID, V_BOOKNAME, V_PUBLISHER, V_PRICE
    FROM BOOK
    WHERE BOOKID = 1;
    
    DBMS_OUTPUT.put_line(V_BOOKID || ', ' || v_bookname || ', ' || v_publisher || ', ' || v_price);
END;

--======================================
/* 저장프로시저(Stroed procedure)
매개변수(파라미터, parameter) 유형
- IN : 입력을 받기만 하는 매개변수(기본값)
- OUT : 출력만 하는 매개변수
        (값을 받을 수는 없고, 프로시저 실행 후 호출한 곳으로 변수를 통해 값 전달)
- IN OUT : 입력도 받고, 값을 변수를 통해 출력도 함
*********************************************/
--프로시저 선언부
CREATE OR REPLACE PROCEDURE BOOK_DISP 
--매개변수 선언부 : ( ) 안에 작성, 구분문자 콤마(,)
(
    IN_BOOKID IN NUMBER
)
AS --변수 선언부(AS 또는 IS ~ BEGIN 문 사이)
    V_BOOKID NUMBER(2);
    V_BOOKNAME VARCHAR2(40);
    V_PUBLISHER VARCHAR2(40);
    V_PRICE NUMBER(8);
BEGIN
    SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE
    INTO V_BOOKID, V_BOOKNAME, V_PUBLISHER, V_PRICE
    FROM BOOK
    WHERE BOOKID = IN_BOOKID;
    
    DBMS_OUTPUT.PUT_LINE(V_BOOKID ||', '|| V_BOOKNAME ||','||
            V_PUBLISHER ||', '|| V_PRICE);
END;
-------------------------
-- 프로시저 실행 : EXECUTE 프로시저명;
EXECUTE BOOK_DISP(3);
EXEC BOOK_DISP(4);

-- 프로시저 삭제 : DROP PROCEDURE 프로시저명;
DROP PROCEDURE BOOK_DISP;

--==================================================
-- 프로시저 OUT 매개변수 사용 프로시저
create or replace PROCEDURE GET_BOOKINFO (
    IN_BOOKID IN NUMBER,
    OUT_BOOKNAME OUT VARCHAR2,
    OUT_PUBLISHER OUT VARCHAR2,
    OUT_PRICE OUT NUMBER
) AS
    -- %TYPE 사용 : 테이블명.컬럼명%TYPE
    -- 테이블 컬럼과 동일한 타입으로 선언(참조방식)
    V_BOOKID BOOK.BOOKID%TYPE; --이렇게 쓰는 이유는 만약 NUMBER(2) 라고 잡아줬을때 NUMBER에 100을 넣으면 2를 넘기때문에 오류가 발생한다.
    V_BOOKNAME BOOK.BOOKNAME%TYPE;
    V_PUBLISHER BOOK.PUBLISHER%TYPE;
    V_PRICE BOOK.PRICE%TYPE;
BEGIN
    --매개변수 값 출력 확인
    DBMS_OUTPUT.PUT_LINE('매개변수값: ' ||IN_BOOKID ||',-'|| OUT_BOOKNAME
            ||'-,'|| OUT_PUBLISHER ||','|| OUT_PRICE);
    
    SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE
    INTO V_BOOKID, V_BOOKNAME, V_PUBLISHER, V_PRICE
    FROM BOOK
    WHERE BOOKID = IN_BOOKID;
    
    --호출한 곳으로 데이터를 전달하기 위해서 OUT 유형의 변수에 저장
    --OUT은 프로시저 자체 안에서는 알수가없고 호출하는 곳에서 확인이 가능하다
    OUT_BOOKNAME := V_BOOKNAME;
    OUT_PUBLISHER := V_PUBLISHER;
    OUT_PRICE := V_PRICE;
    
    DBMS_OUTPUT.PUT_LINE(V_BOOKID ||', '|| V_BOOKNAME ||','||
            V_PUBLISHER ||', '|| V_PRICE);
END;

--==================
-- 위의 프로시저를 호출해서 OUT으로 전달된 값 확인
create or replace PROCEDURE GET_BOOKINFO_TEST 
(
  IN_BOOKID IN NUMBER 
) AS 
    V_BOOKNAME book.bookname%TYPE;
    V_PUBLISHER book.publisher%TYPE;
    V_PRICE book.price%TYPE;
BEGIN
  DBMS_OUTPUT.PUT_LINE('입력받은 값(ID) : ' || IN_BOOKID);
  
  --GET_BOOKINFO 프로시저 실행(호출)
  get_bookinfo(IN_BOOKID, V_BOOKNAME, v_publisher ,V_PRICE);
  
  --GET_BOOKINFO 프로시저 실행(호출) 후 전달받은 값 확인
  DBMS_OUTPUT.PUT_LINE('BOOKINFO OUT 값 : ' || V_BOOKNAME || '/' || v_publisher || '/' || v_price);
END;

--=================================
/*
실습 프로시저 가성하고 실행하기
고객테이블(CUSTOMER)에 있는 데이터 조회 프로시저 작성
- 프로시저명 : GET_CUSTINFO
- 입력받는 값 : 고객ID
- 처리 : 입력받은 고객 ID에 해당하는 데이터를 찾아서 화면출력
- 출력항목 : 고객ID, 고객명, 주소,   전화번호
*/

