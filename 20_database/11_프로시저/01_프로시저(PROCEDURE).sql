--PL/SQL ���ν���(PROCEDURE)
SET SERVEROUTPUT ON; -- ���� ������� ǥ�� ����

DECLARE -- ��������
    V_EMPID NUMBER(5);
    V_NAME VARCHAR2(30);
BEGIN -- ���๮ ����
    V_EMPID := 100; --ġȯ��(���Թ�) ��ȣ :=
    V_NAME := 'ȫ�浿';
    
    DBMS_OUTPUT.PUT_LINE(V_EMPID || ' : ' || V_NAME); -- -> �ڹ��� println()�޼ҵ�� ������ ���
END; -- ���๮ ��(���ν��� ��)

------------------------
-- BOOK ���̺� ������ �� �Ϻθ� ȭ�� ���
DECLARE
    V_BOOKID NUMBER(2);
    V_BOOKNAME VARCHAR2(40);
    V_PUBLISHER VARCHAR2(40);
    V_PRICE NUMBER(8);
    
BEGIN
    -- SELECT ~ INTO ~ FROM ���·� DB������ �����ϰ� INTO ���� ������ ����
    -- ���� 1���� �����͸� ó������
    SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE
    INTO V_BOOKID, V_BOOKNAME, V_PUBLISHER, V_PRICE
    FROM BOOK
    WHERE BOOKID = 1;
    
    DBMS_OUTPUT.put_line(V_BOOKID || ', ' || v_bookname || ', ' || v_publisher || ', ' || v_price);
END;

--======================================
/* �������ν���(Stroed procedure)
�Ű�����(�Ķ����, parameter) ����
- IN : �Է��� �ޱ⸸ �ϴ� �Ű�����(�⺻��)
- OUT : ��¸� �ϴ� �Ű�����
        (���� ���� ���� ����, ���ν��� ���� �� ȣ���� ������ ������ ���� �� ����)
- IN OUT : �Էµ� �ް�, ���� ������ ���� ��µ� ��
*********************************************/
--���ν��� �����
CREATE OR REPLACE PROCEDURE BOOK_DISP 
--�Ű����� ����� : ( ) �ȿ� �ۼ�, ���й��� �޸�(,)
(
    IN_BOOKID IN NUMBER
)
AS --���� �����(AS �Ǵ� IS ~ BEGIN �� ����)
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
-- ���ν��� ���� : EXECUTE ���ν�����;
EXECUTE BOOK_DISP(3);
EXEC BOOK_DISP(4);

-- ���ν��� ���� : DROP PROCEDURE ���ν�����;
DROP PROCEDURE BOOK_DISP;

--==================================================
-- ���ν��� OUT �Ű����� ��� ���ν���
create or replace PROCEDURE GET_BOOKINFO (
    IN_BOOKID IN NUMBER,
    OUT_BOOKNAME OUT VARCHAR2,
    OUT_PUBLISHER OUT VARCHAR2,
    OUT_PRICE OUT NUMBER
) AS
    -- %TYPE ��� : ���̺��.�÷���%TYPE
    -- ���̺� �÷��� ������ Ÿ������ ����(�������)
    V_BOOKID BOOK.BOOKID%TYPE; --�̷��� ���� ������ ���� NUMBER(2) ��� ��������� NUMBER�� 100�� ������ 2�� �ѱ⶧���� ������ �߻��Ѵ�.
    V_BOOKNAME BOOK.BOOKNAME%TYPE;
    V_PUBLISHER BOOK.PUBLISHER%TYPE;
    V_PRICE BOOK.PRICE%TYPE;
BEGIN
    --�Ű����� �� ��� Ȯ��
    DBMS_OUTPUT.PUT_LINE('�Ű�������: ' ||IN_BOOKID ||',-'|| OUT_BOOKNAME
            ||'-,'|| OUT_PUBLISHER ||','|| OUT_PRICE);
    
    SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE
    INTO V_BOOKID, V_BOOKNAME, V_PUBLISHER, V_PRICE
    FROM BOOK
    WHERE BOOKID = IN_BOOKID;
    
    --ȣ���� ������ �����͸� �����ϱ� ���ؼ� OUT ������ ������ ����
    --OUT�� ���ν��� ��ü �ȿ����� �˼������� ȣ���ϴ� ������ Ȯ���� �����ϴ�
    OUT_BOOKNAME := V_BOOKNAME;
    OUT_PUBLISHER := V_PUBLISHER;
    OUT_PRICE := V_PRICE;
    
    DBMS_OUTPUT.PUT_LINE(V_BOOKID ||', '|| V_BOOKNAME ||','||
            V_PUBLISHER ||', '|| V_PRICE);
END;

--==================
-- ���� ���ν����� ȣ���ؼ� OUT���� ���޵� �� Ȯ��
create or replace PROCEDURE GET_BOOKINFO_TEST 
(
  IN_BOOKID IN NUMBER 
) AS 
    V_BOOKNAME book.bookname%TYPE;
    V_PUBLISHER book.publisher%TYPE;
    V_PRICE book.price%TYPE;
BEGIN
  DBMS_OUTPUT.PUT_LINE('�Է¹��� ��(ID) : ' || IN_BOOKID);
  
  --GET_BOOKINFO ���ν��� ����(ȣ��)
  get_bookinfo(IN_BOOKID, V_BOOKNAME, v_publisher ,V_PRICE);
  
  --GET_BOOKINFO ���ν��� ����(ȣ��) �� ���޹��� �� Ȯ��
  DBMS_OUTPUT.PUT_LINE('BOOKINFO OUT �� : ' || V_BOOKNAME || '/' || v_publisher || '/' || v_price);
END;

--=================================
/*
�ǽ� ���ν��� �����ϰ� �����ϱ�
�����̺�(CUSTOMER)�� �ִ� ������ ��ȸ ���ν��� �ۼ�
- ���ν����� : GET_CUSTINFO
- �Է¹޴� �� : ��ID
- ó�� : �Է¹��� �� ID�� �ش��ϴ� �����͸� ã�Ƽ� ȭ�����
- ����׸� : ��ID, ����, �ּ�,   ��ȭ��ȣ
*/

