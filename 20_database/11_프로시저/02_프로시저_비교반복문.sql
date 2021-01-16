/*
    �񱳱���(�б�ó��) IF��
    IF(���ǽ�) THEN ~ END IF;
    IF(���ǽ�) THEN ~ ELSE ~ END IF;
    IF(���ǽ�) THEN ~ ELSIF ~ ELSE ~ END IF;
*/

-- Ȧ��, ¦���� �Ǻ�
create or replace PROCEDURE PRC_IF (
    IN_NUM IN NUMBER
) AS
BEGIN -- ����� ������ ������ AS~BEGIN���̿� �ƹ��͵� ��� ��
    DBMS_OUTPUT.PUT_LINE('�Է� �� : ' || IN_NUM);
    --  Ȧ, ¦ �Ǻ�(���ڸ� 2�� ���� �������� 0�̸� ¦��)
    IF (MOD(IN_NUM, 2) = 0) THEN
        DBMS_OUTPUT.PUT_LINE(IN_NUM || ' : ¦��');
    ELSE
        DBMS_OUTPUT.PUT_LINE(IN_NUM || ' : Ȧ��');
    END IF;
END;

--===================
--�Է¹��� ���ڰ��� 4�� ���� ������ �� Ȯ��
create or replace PROCEDURE PRC_IF2(
    IN_NUM IN NUMBER
)AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('�Է°� : ' || IN_NUM);
    -- 4�� ���� ������ �� ���
    IF(MOD(IN_NUM, 4) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('4�� ���� ������ 0');
    ELSIF(MOD(IN_NUM, 4) = 1) THEN
        DBMS_OUTPUT.PUT_LINE('4�� ���� ������ : 1');
    ELSIF(MOD(IN_NUM, 4) = 2) THEN
        DBMS_OUTPUT.PUT_LINE('4�� ���� ������ : 2');
    ELSE
        DBMS_OUTPUT.PUT_LINE('4�� ���� ������ : 3');
    END IF;
END;

--=========
-- �ݺ��� : FOR, WHILE
-- FOR��
-----FOR ���� IN �ʱⰪ ... ������ LOOP ~ END LOOP;
------------------------------
-- ���� �ϳ��� �Է¹޾Ƽ� �հ� ���(1~N ������ ��)
create or replace PROCEDURE PRC_FOR_SUM(
    IN_NUM IN NUMBER
)AS
    V_SUM NUMBER:= 0; --�������� �� �ʱ�ȭ(�ʱ갪 0)
BEGIN
    -- �Է¹��� �� ȭ�� ���
    DBMS_OUTPUT.PUT_LINE('>> �Է°� : ' || IN_NUM);

    --���� : FOR������ �ݺ�ó��
    FOR I IN 1 .. IN_NUM LOOP
    V_SUM := V_SUM + I; --���⼭ I�� ���� 1~IN_NUM������ ���� ������ ����
    DBMS_OUTPUT.PUT_LINE('>> I : ' || I);
    END LOOP;
    
    DBMS_OUTPUT.PUT('1����' || IN_NUM || '������ �հ� : ');
    DBMS_OUTPUT.PUT_LINE(V_SUM);
END;

--===========================
-- WHILE��
-- WHILE (���ǽ�) LOOP ~ END LOOP;
--------------------------------
-- ���� �ϳ��� �Է� �޾Ƽ� �հ� ���(1~N������ ��)
create or replace PROCEDURE PRC_WHILE_SUM(
    IN_NUM IN NUMBER -- IN ��������
)AS 
    V_SUM NUMBER := 0;
    I NUMBER := 1;

BEGIN
    -- �Է¹��� �� ���
     DBMS_OUTPUT.PUT_LINE('>> �Է°� : ' || IN_NUM);
     
     WHILE(I <= IN_NUM) LOOP 
        V_SUM := V_SUM + I;
        I := I + 1;
     END LOOP;
     
     DBMS_OUTPUT.PUT_LINE('1~ ' || IN_NUM || '������ �հ� : ' || V_SUM);
     
END;

