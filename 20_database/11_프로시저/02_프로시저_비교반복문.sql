/*
    비교구문(분기처리) IF문
    IF(조건식) THEN ~ END IF;
    IF(조건식) THEN ~ ELSE ~ END IF;
    IF(조건식) THEN ~ ELSIF ~ ELSE ~ END IF;
*/

-- 홀수, 짝수를 판별
create or replace PROCEDURE PRC_IF (
    IN_NUM IN NUMBER
) AS
BEGIN -- 사용할 변수가 없으면 AS~BEGIN사이에 아무것도 없어도 됨
    DBMS_OUTPUT.PUT_LINE('입력 값 : ' || IN_NUM);
    --  홀, 짝 판별(숫자를 2로 나눈 나머지가 0이면 짝수)
    IF (MOD(IN_NUM, 2) = 0) THEN
        DBMS_OUTPUT.PUT_LINE(IN_NUM || ' : 짝수');
    ELSE
        DBMS_OUTPUT.PUT_LINE(IN_NUM || ' : 홀수');
    END IF;
END;

--===================
--입력받은 숫자값을 4로 나눈 나머지 값 확인
create or replace PROCEDURE PRC_IF2(
    IN_NUM IN NUMBER
)AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('입력값 : ' || IN_NUM);
    -- 4로 나눈 나머지 값 출력
    IF(MOD(IN_NUM, 4) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('4로 나눈 나머지 0');
    ELSIF(MOD(IN_NUM, 4) = 1) THEN
        DBMS_OUTPUT.PUT_LINE('4로 나눈 나머지 : 1');
    ELSIF(MOD(IN_NUM, 4) = 2) THEN
        DBMS_OUTPUT.PUT_LINE('4로 나눈 나머지 : 2');
    ELSE
        DBMS_OUTPUT.PUT_LINE('4로 나눈 나머지 : 3');
    END IF;
END;

--=========
-- 반복문 : FOR, WHILE
-- FOR문
-----FOR 변수 IN 초기값 ... 최종값 LOOP ~ END LOOP;
------------------------------
-- 숫자 하나를 입력받아서 합계 출력(1~N 까지의 합)
create or replace PROCEDURE PRC_FOR_SUM(
    IN_NUM IN NUMBER
)AS
    V_SUM NUMBER:= 0; --변수선언 및 초기화(초깃값 0)
BEGIN
    -- 입력받은 값 화면 출력
    DBMS_OUTPUT.PUT_LINE('>> 입력값 : ' || IN_NUM);

    --누적 : FOR문으로 반복처리
    FOR I IN 1 .. IN_NUM LOOP
    V_SUM := V_SUM + I; --여기서 I는 위의 1~IN_NUM까지의 범위 루프를 뜻함
    DBMS_OUTPUT.PUT_LINE('>> I : ' || I);
    END LOOP;
    
    DBMS_OUTPUT.PUT('1부터' || IN_NUM || '까지의 합계 : ');
    DBMS_OUTPUT.PUT_LINE(V_SUM);
END;

--===========================
-- WHILE문
-- WHILE (조건식) LOOP ~ END LOOP;
--------------------------------
-- 숫자 하나를 입력 받아서 합계 출력(1~N까지의 합)
create or replace PROCEDURE PRC_WHILE_SUM(
    IN_NUM IN NUMBER -- IN 생략가능
)AS 
    V_SUM NUMBER := 0;
    I NUMBER := 1;

BEGIN
    -- 입력받은 값 출력
     DBMS_OUTPUT.PUT_LINE('>> 입력값 : ' || IN_NUM);
     
     WHILE(I <= IN_NUM) LOOP 
        V_SUM := V_SUM + I;
        I := I + 1;
     END LOOP;
     
     DBMS_OUTPUT.PUT_LINE('1~ ' || IN_NUM || '까지의 합계 : ' || V_SUM);
     
END;

