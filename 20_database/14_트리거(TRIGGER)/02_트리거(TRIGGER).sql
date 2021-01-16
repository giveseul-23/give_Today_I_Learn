/********** Ʈ����(TRIGGER) ******************
Ʈ����(TRIGGER) : Ư�� �̺�Ʈ�� DDL, DML ������ ����Ǿ��� ��,
   �ڵ������� � �Ϸ��� ����(Operation)�̳� ó���� �����ϵ��� �ϴ�
   ����Ÿ���̽� ��ü�� �ϳ�
  -�Ϲ������� ������ ���̺� ����Ÿ�� �߰�(INSERT), ����(DELETE), ����(UPDATE) �� ��,
    �ٸ� ���� ���迡 �ִ� ���̺��� ����Ÿ�� �ڵ������� ������ ��쿡 ���

CREATE [OR REPLACE] TRIGGER Ʈ���Ÿ�
  BEFORE [OR AFTER] -- �� �� �ϳ��� ��뵵 �ǰ�, �� �� ��뵵 �����ϴ�.
  UPDATE [OR DELETE OR INSERT] ON ���̺��
  [FOR EACH ROW]  
DECLARE
  ���������;
BEGIN
  ���α׷� ���� ������;
END;  
-------------------------------
<Ʈ���� ����ñ� ����>
BEFORE : ������ ó���� ����Ǳ� �� ����(INSERT, UPDATE, DELETE �� ������)
AFTER : ������ ó���� ����� �� ����(INSERT, UPDATE, DELETE �� ������)

�̺�Ʈ ���� ���� : INSERT, UPDATE, DELETE
�̺�Ʈ �߻� ���̺� ���� : ON ���̺��

<ó������ ����>
FOR EACH ROW : ����Ÿ ó���� �ǰ��� Ʈ���� ����. �� �ɼ��� ������ 
  �⺻���� ���� ���� Ʈ���ŷ� ����Ǹ� ������, �Ŀ� �ѹ����� Ʈ���� ����

DECLARE : ���� ���� �� ��� Ű����
--------------------
<�÷��� ���>
:OLD.�÷��� : SQL �ݿ� ���� �÷� ����Ÿ�� �ǹ�
:NEW.�÷��� : SQL �ݿ� ���� �÷� ����Ÿ�� �ǹ�
---------------------
<Ʈ���� ����, Ȱ��, ��Ȱ��>
- ���� : DROP TRIGGER Ʈ���Ÿ�;
- Ȱ�� : ALTER TRIGGER Ʈ���Ÿ� enable;
- ��Ȱ�� : ALTER TRIGGER Ʈ���Ÿ� disable;
*****************************************/

-- BOOK ���̺� ���� �α�(LOG �̷�) ���� ���̺� �ۼ�
-- BOOK_LOG ���̺� ����
CREATE TABLE BOOK_LOG (
    BOOKID NUMBER(5),
    BOOKNAME VARCHAR2(300),
    PUBLISHER VARCHAR2(200),
    PRICE VARCHAR2(200),
    LOGDATE DATE DEFAULT SYSDATE,
    JOB_GUBUN VARCHAR2(10)
);

-- Ʈ���� �ۼ�
-- BOOK ���̺� �����Ͱ� �ԷµǸ�(INSERT) BOOK_LOG ���̺� �̷� ����� 
-- Ʈ���Ÿ� : AFTER_INSERT_BOOK
CREATE OR REPLACE TRIGGER AFTER_INSERT_BOOK
    AFTER INSERT ON BOOK
    FOR EACH ROW
DECLARE
BEGIN
    --�Էµ� ������ �̷� �����
    INSERT INTO BOOK_LOG
                                                -- JOB_GUBUN�� �μ�Ʈ�۾��� �̷��������� �����ϱ� ���� �÷���
            (BOOKID, BOOKNAME, PUBLISHER, PRICE, JOB_GUBUN) -- LOGDATE �� DEFAULT ���� ��⶧���� ���� �ʴ´�
    VALUES (:NEW.BOOKID, :NEW.BOOKNAME, :NEW.PUBLISHER, :NEW.PRICE, 'INSERT');
END;

----------------------------------
-- ����
-- INSERT Ʈ���� ���� ���� Ȯ��
SELECT * FROM BOOK_LOG;
SELECT * FROM BOOK;

INSERT INTO book VALUES(30, '�����ͺ��̽��� ����3', 'ITBOOK', 27000);

INSERT INTO book VALUES(32, '�����ͺ��̽��� ����2', 'ITBOOK', 32000);

COMMIT;

---------------------------
-- UPDATE Ʈ���� �ۼ� : AFTER_UPDATE_BOOK
CREATE OR REPLACE TRIGGER AFTER_UPDATE_BOOK 
    AFTER UPDATE ON BOOK 
    FOR EACH ROW
BEGIN
    -- �α� �����
    INSERT INTO BOOK_LOG
            (BOOKID, BOOKNAME, PUBLISHER , PRICE, JOB_GUBUN)
    VALUES (:OLD.BOOKID
            , :OLD.BOOKNAME || ' -> ' || :NEW.BOOKNAME
            , :OLD.PUBLISHER || ' -> ' || :NEW.PUBLISHER
            , :OLD.PRICE  || ' -> ' || :NEW.PRICE
            , 'UPDATE'
            );
END;

---------------
-- UPDATE Ʈ���� �׽�Ʈ
SELECT * FROM BOOK;
SELECT * FROM BOOK_LOG;
UPDATE BOOK
    SET BOOKNAME = '����Ŭ �����ͺ��̽��� ����3'
        , PRICE = 20000
WHERE BOOKID = 31;

COMMIT;

SELECT * FROM BOOK_LOG;

-----------------------
-- �ǽ� : DELETE Ʈ���� �ۼ��ϰ� ���� �׽�Ʈ ����
-- Ʈ���Ÿ� : AFTER_DELETE_BOOK
-- ������ BOOK ���̺� �����Ͱ� �����Ǹ� BOOK_LOG ���̺� �̷� �����
-----------------------

-- Ʈ���� ����
CREATE OR REPLACE TRIGGER AFTER_DELETE_BOOK 
    AFTER DELETE ON BOOK
    FOR EACH ROW
BEGIN
  -- �α� �����
    INSERT INTO BOOK_LOG
            (BOOKID, BOOKNAME, PUBLISHER , PRICE, JOB_GUBUN)
    VALUES (:OLD.BOOKID, :OLD.BOOKNAME, :OLD.PUBLISHER, :OLD.PRICE, 'DELETE');
END;

---------------
-- DELETE Ʈ���� �׽�Ʈ
SELECT * FROM BOOK;
SELECT * FROM BOOK_LOG;

DELETE FROM BOOK
WHERE bookid = 32;

COMMIT;

-------------------------------
-- INSERT, UPDATE, DELETE �۾��߻��� �����ϴ� Ʈ����
create or replace TRIGGER AFTER_BOOK_IUD
    AFTER INSERT OR UPDATE OR DELETE ON BOOK
    FOR EACH ROW

BEGIN 
    -- INSERT �̺�Ʈ�� �߻��� ��� �α� �����
    IF INSERTING THEN
        INSERT INTO BOOK_LOG
                                                -- JOB_GUBUN�� �μ�Ʈ�۾��� �̷��������� �����ϱ� ���� �÷���
            (BOOKID, BOOKNAME, PUBLISHER, PRICE, JOB_GUBUN) -- LOGDATE �� DEFAULT ���� ��⶧���� ���� �ʴ´�
        VALUES (:NEW.BOOKID, :NEW.BOOKNAME, :NEW.PUBLISHER, :NEW.PRICE, 'INSERT_IUD');
    END IF;
    
    -- UPDATE �̺�Ʈ�� �߻��� ��� �α� �����
    IF UPDATING THEN
        INSERT INTO BOOK_LOG
            (BOOKID, BOOKNAME, PUBLISHER , PRICE, JOB_GUBUN)
        VALUES (:OLD.BOOKID
            , :OLD.BOOKNAME || ' -> ' || :NEW.BOOKNAME
            , :OLD.PUBLISHER || ' -> ' || :NEW.PUBLISHER
            , :OLD.PRICE  || ' -> ' || :NEW.PRICE
            , 'UPDATE_IUD'
            );
    END IF;
    
    IF DELETING THEN
        INSERT INTO BOOK_LOG
                (BOOKID, BOOKNAME, PUBLISHER , PRICE, JOB_GUBUN)
        VALUES (:OLD.BOOKID, :OLD.BOOKNAME, :OLD.PUBLISHER, :OLD.PRICE, 'DELETE_IUD');
    END IF;
END;

-- ����



