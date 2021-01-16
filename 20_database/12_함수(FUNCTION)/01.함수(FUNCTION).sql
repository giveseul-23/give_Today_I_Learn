/*
    �Լ�(FUNCTION)
    ���� �� ���� ����(RETURN) �ϴ� ���α׷�
    <�⺻���� ����>
    CREATE OR REPLACE FUNCTION FUNCTION1 
    (
      PARAM1 IN VARCHAR2 -- �Ķ���� �ۼ�
    ) RETURN VARCHAR2 AS  -- ���� ������ Ÿ�Լ���
    BEGIN
      RETURN ���ϰ�; -- ������ ��
    END FUNCTION1;
****************************/

-- BOOKID�� å���� Ȯ�� �Լ�(�Ķ���� �� : BOOKID, RETURN�� : BOOKNAME)
CREATE OR REPLACE FUNCTION FUNCTION1 (
  PARAM1 IN VARCHAR2 --�Ķ���� �ۼ�
) RETURN VARCHAR2 --���� ������ Ÿ�Լ���
AS 
BEGIN
  RETURN ���ϰ�; --���� ��
END;
*********************************/
-- BOOKID�� å���� Ȯ�� �Լ�(�Ķ���Ͱ� : BOOKID, RETURN�� : BOOKNAME)
create or replace FUNCTION GET_BOOKNAME (
    IN_ID IN NUMBER
) RETURN VARCHAR2 
AS
    V_BOOKNAME book.bookname%TYPE;
BEGIN
    SELECT BOOKNAME INTO V_BOOKNAME
    FROM BOOK
    WHERE BOOKID = IN_ID;
    
    RETURN V_BOOKNAME; --���ϰ� ����
END;
/*
create or replace FUNCTION GET_BOOKNAME (
    IN_ID IN NUMBER 
)RETURN VARCHAR2
AS
                            --%TYPE : ���� Ÿ���� ���ڴٴ� ��
    V_BOOKNAME book.bookname%TYPE; -- ���ϰ� å������ ����� V_BOOKNAME ��������
BEGIN
    --���Ϲ��� ������ ������ ����, ���Ϲ��� �ʼ���
    DBMS_OUTPUT.PUT_LINE('IN_ID : ' || IN_ID);
    RETURN V_BOOKNAME;
END;*/

--�Լ��� ���
SELECT BOOKID, BOOKNAME, GET_BOOKNAME(BOOKID)
FROM BOOK;
------
--SELECT ���� ������Լ� ���
SELECT O.*, get_bookname(o.bookid) AS BOOKNAME
FROM ORDERS O; -- ����ٰ� ������� ��

--WHERE ���� ���
SELECT O.*, get_bookname(o.bookid) AS BOOKNAME
FROM ORDERS O
WHERE get_bookname(o.bookid) = '�߱��� ��Ź��'; 

--==================
/*
�ǽ� - �� ID ���� �޾Ƽ� ������ �����ִ� �Լ� �ۼ�(CUSTOMER ���̺� ���)
1. �Լ��ۼ� : GET_CUSTNAME
2. �Լ��� ����ؼ� ORDERS ���̺� ������ ��ȸ
    GET_BOOKNAME, GET_CUSTNAME �Լ���� �ֹ�(�Ǹ�)������ å����, ���� ��ȸ
************************/
CREATE OR REPLACE FUNCTION GET_CUSTNAME 
(
--��� �ȿ��� �Ű������� ����
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
WHERE GET_CUSTNAME(O.CUSTID) = '�迬��';

/*
            --���������� ����
SELECT O.*, (SELECT BOOKNAME FROM BOOK WHERE BOOKID = O.BOOKID) AS BOOKNAME 
FROM ORDERS O;
*/

--�Լ��� ������ ����� ���� �� ����, ������ ��뷮 �����Ϳ����� ������ �� �� �ֱ⿡ �Լ��� ����ϴ� ���� �� ȿ�����̴�.
SELECT O.*, B.BOOKNAME, C.NAME 
FROM ORDERS O, BOOK B, CUSTOMER C
WHERE O.BOOKID = B.BOOKID -- JOIN ����
AND O.CUSTID = C.CUSTID -- JOIN ����
AND C.NAME = '������'; -- �̰� WHERE ����

-- ANSI ����
SELECT O.*, B.BOOKNAME, C.NAME 
FROM ORDERS O INNER JOIN BOOK B
    ON o.bookid = b.bookid --��������
    INNER JOIN CUSTOMER C
    ON o.custid = c.custid --��������
WHERE c.name = '�迬��'; --WHERE ����