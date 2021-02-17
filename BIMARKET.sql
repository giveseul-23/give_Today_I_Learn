-- ���̺� ������ ���踦 ����Ͽ� �� ���� �����ص� ������ �߻����� �ʰ� ���ĵǾ����ϴ�.

-- member Table Create SQL
CREATE TABLE member
(
    ID          VARCHAR2(20)     NOT NULL, 
    PASSWORD    VARCHAR2(20)     NOT NULL, 
    NAME        VARCHAR2(20)     NOT NULL, 
    BIRTH       VARCHAR2(20)     NOT NULL, 
    PHONNUM     VARCHAR2(20)     NOT NULL, 
    ADDR        VARCHAR2(120)    NULL, 
    EMAIL       VARCHAR2(60)     NULL, 
    CONSTRAINT MEMBER_PK PRIMARY KEY (ID)
)
/

--�߰�����(����)
INSERT INTO member(ID, PASSWORD, NAME, BIRTH, PHONNUM)
VALUES('giveseul1', '12345', '��1', '2021-02-09', '01095235069');

SELECT * FROM MEMBER;

UPDATE member
SET PASSWORD = '1234'
WHERE ID = 'giveseul1';

DELETE FROM member
WHERE ID = 'giveseul1';


SELECT * FROM LOG;


COMMENT ON COLUMN member.ID IS '���̵�'
/

COMMENT ON COLUMN member.PASSWORD IS '��й�ȣ'
/

COMMENT ON COLUMN member.NAME IS '�̸�'
/

COMMENT ON COLUMN member.BIRTH IS '�������'
/

COMMENT ON COLUMN member.PHONNUM IS '�ڵ�����ȣ'
/

COMMENT ON COLUMN member.ADDR IS '�ּ�'
/

COMMENT ON COLUMN member.EMAIL IS '�̸���'
/


-- member Table Create SQL
CREATE TABLE p_list
(
    SALE_ID         VARCHAR2(20)     NOT NULL, 
    PURCHASE_ID     VARCHAR2(20)     NULL, 
    PICTURE         VARCHAR2(20)     NOT NULL, 
    AMOUNT          VARCHAR2(20)     NOT NULL, 
    P_CODE          NUMBER(7)        NOT NULL, 
    P_TITLE         VARCHAR2(20)     NOT NULL, 
    P_CONTENTS      VARCHAR2(500)    NULL, 
    STATUS          VARCHAR2(20)     NOT NULL, 
    CATEGORIES      VARCHAR2(20)     NOT NULL, 
    AREA            VARCHAR2(20)     NOT NULL, 
    P_INQUIRY       VARCHAR2(20)     NOT NULL, 
    LIKEIT_COUNT    NUMBER(3)        NULL, 
    CONSTRAINT P_LIST_PK PRIMARY KEY (PURCHASE_ID, P_CODE)
)
/

--P_CODE ������ ����
CREATE SEQUENCE  P_SEQUENCE
   MINVALUE 1 MAXVALUE 99999999999999999999999
   INCREMENT BY 1
   START WITH 1
   CACHE 20 NOORDER  NOCYCLE ;

--�߰�����(����)
INSERT INTO p_list(SALE_ID, PURCHASE_ID, PICTURE, AMOUNT, P_CODE
, P_TITLE, P_CONTENTS, STATUS, CATEGORIES, AREA, P_INQUIRY, LIKEIT_COUNT)
VALUES('giveseul', 'giveseul', 'img.jpg', '30001', P_SEQUENCE.NEXTVAL, 'G', 'G', 'G', 'G', 'G', 'G', 10);

COMMENT ON COLUMN p_list.SALE_ID IS '�Ǹ���_���̵�'
/

COMMENT ON COLUMN p_list.PURCHASE_ID IS '������_���̵�'
/

COMMENT ON COLUMN p_list.PICTURE IS '����'
/

COMMENT ON COLUMN p_list.AMOUNT IS '�ݾ�'
/

COMMENT ON COLUMN p_list.P_CODE IS '��ǰ �ڵ�'
/

COMMENT ON COLUMN p_list.P_TITLE IS '��ǰ ����'
/

COMMENT ON COLUMN p_list.P_CONTENTS IS '��ǰ ����'
/

COMMENT ON COLUMN p_list.STATUS IS '�Ǹ� ����'
/

COMMENT ON COLUMN p_list.CATEGORIES IS 'ī�װ�'
/

COMMENT ON COLUMN p_list.AREA IS '����'
/

COMMENT ON COLUMN p_list.P_INQUIRY IS '1:1����'
/

COMMENT ON COLUMN p_list.LIKEIT_COUNT IS '���ϱ�_����'
/

ALTER TABLE p_list
    ADD CONSTRAINT FK_p_list_SALE_ID_member_ID FOREIGN KEY (SALE_ID)
        REFERENCES member (ID)
/

ALTER TABLE p_list
    ADD CONSTRAINT FK_p_list_PURCHASE_ID_member_I FOREIGN KEY (PURCHASE_ID)
        REFERENCES member (ID)
/


-- member Table Create SQL
CREATE TABLE p_inquiry
(
    P_INQUIRYCODE     NUMBER(7)        NOT NULL, 
    P_CODE            NUMBER(7)        NOT NULL, 
    PASSWORD          VARCHAR2(20)     NOT NULL, 
    ID                VARCHAR2(20)     NOT NULL, 
    INQUIRYTITLE      VARCHAR2(20)     NOT NULL, 
    INQUIRYCONTENT    VARCHAR2(500)    NOT NULL, 
    REGDATE           VARCHAR2(20)     NOT NULL, 
    CONSTRAINT P_INQUIRY_PK PRIMARY KEY (P_INQUIRYCODE)
)
/

--P_CODE ������ ����
CREATE SEQUENCE  P_INQUIRY_SEQUENCE
   MINVALUE 1 MAXVALUE 99999999999999999999999
   INCREMENT BY 1
   START WITH 2001
   CACHE 20 NOORDER  NOCYCLE ;

COMMENT ON COLUMN p_inquiry.P_INQUIRYCODE IS '1:1���� �ڵ�'
/

COMMENT ON COLUMN p_inquiry.P_CODE IS '��ǰ�ڵ�'
/

COMMENT ON COLUMN p_inquiry.PASSWORD IS '��й�ȣ'
/

COMMENT ON COLUMN p_inquiry.ID IS '���̵�'
/

COMMENT ON COLUMN p_inquiry.INQUIRYTITLE IS '���� ����'
/

COMMENT ON COLUMN p_inquiry.INQUIRYCONTENT IS '���� ����'
/

COMMENT ON COLUMN p_inquiry.REGDATE IS '��¥'
/

ALTER TABLE p_inquiry
    ADD CONSTRAINT FK_p_inquiry_P_CODE_p_list_P_C FOREIGN KEY (P_CODE)
        REFERENCES p_list (P_CODE)
/

ALTER TABLE p_inquiry
    ADD CONSTRAINT FK_p_inquiry_ID_member_ID FOREIGN KEY (ID)
        REFERENCES member (ID)
/


-- member Table Create SQL
CREATE TABLE likeit
(
    PURCHASE_ID    VARCHAR2(20)    NULL, 
    LIKEIT_STAT    NUMBER(3)       NOT NULL, 
    P_CODE         NUMBER(7)       NULL   
)
/

COMMENT ON COLUMN likeit.PURCHASE_ID IS '������_���̵�'
/

COMMENT ON COLUMN likeit.LIKEIT_STAT IS '���ϱ�_����'
/

COMMENT ON COLUMN likeit.P_CODE IS '��ǰ�ڵ�'
/

ALTER TABLE likeit
    ADD CONSTRAINT FK_likeit_PURCHASE_ID_p_list_P FOREIGN KEY (PURCHASE_ID, P_CODE)
        REFERENCES p_list (PURCHASE_ID, P_CODE)
/


-- member Table Create SQL
CREATE TABLE board
(
    B_CODE        NUMBER(7)        NOT NULL,
    ID            VARCHAR2(20)     NOT NULL, 
    B_CATEGORY    VARCHAR2(20)     NOT NULL, 
    B_TITLE       VARCHAR2(20)     NOT NULL, 
    B_CONTENTS    VARCHAR2(500)    NOT NULL, 
    PASSWORD      VARCHAR2(20)     NOT NULL
)
/

--P_CODE ������ ����
CREATE SEQUENCE  B_SEQUENCE
   MINVALUE 1 MAXVALUE 99999999999999999999999
   INCREMENT BY 1
   START WITH 4001
   CACHE 20 NOORDER  NOCYCLE ;

COMMENT ON COLUMN board.B_CODE IS '�Խ��� ��ȣ'
/

COMMENT ON COLUMN board.ID IS '���̵�'
/

COMMENT ON COLUMN board.B_CATEGORY IS '�Խñ� ����'
/

COMMENT ON COLUMN board.B_TITLE IS '�Խ��� ����'
/

COMMENT ON COLUMN board.B_CONTENTS IS '�Խ��� ����'
/

COMMENT ON COLUMN board.PASSWORD IS '��й�ȣ'
/

ALTER TABLE board
    ADD CONSTRAINT FK_board_ID_member_ID FOREIGN KEY (ID)
        REFERENCES member (ID)
/


-- member Table Create SQL
CREATE TABLE log
(
    ID          VARCHAR2(20)     NOT NULL, 
    PASSWORD    VARCHAR2(20)     NULL, 
    NAME        VARCHAR2(20)     NULL, 
    BIRTH       VARCHAR2(20)     NULL, 
    PHONNUM     VARCHAR2(20)     NULL, 
    ADDR        VARCHAR2(120)    NULL, 
    EMAIL       VARCHAR2(60)     NULL, 
    REGDATE     VARCHAR2(20)     NULL, 
    LOGMODE     VARCHAR2(20)     NULL, 
    CONSTRAINT LOG_PK PRIMARY KEY (ID)
)
/

-- �뷮����
ALTER TABLE LOG  
MODIFY (PASSWORD VARCHAR2(50 BYTE) );

ALTER TABLE LOG  
MODIFY (PHONNUM VARCHAR2(100 BYTE) );

ALTER TABLE LOG  
MODIFY (ADDR VARCHAR2(300 BYTE) );

ALTER TABLE LOG  
MODIFY (EMAIL VARCHAR2(120 BYTE) );

-- PKŰ ����
ALTER TABLE LOG 
DROP CONSTRAINT LOG_PK;

-- REGDATE DEFAULT SYSDATE
ALTER TABLE LOG  
MODIFY (REGDATE DEFAULT SYSDATE );

--Ʈ���� �ۼ�
create or replace TRIGGER AFTER_MEMBER_IUD
    AFTER INSERT OR UPDATE OR DELETE ON MEMBER
    FOR EACH ROW

BEGIN 
    -- INSERT �̺�Ʈ�� �߻��� ��� �α� �����
    IF INSERTING THEN
        INSERT INTO LOG
                                                -- JOB_GUBUN�� �μ�Ʈ�۾��� �̷��������� �����ϱ� ���� �÷���
            (ID, PASSWORD, NAME, BIRTH, PHONNUM, ADDR, EMAIL, LOGMODE) -- LOGDATE �� DEFAULT ���� ��⶧���� ���� �ʴ´�
        VALUES (:NEW.ID, :NEW.PASSWORD, :NEW.NAME, :NEW.BIRTH, :NEW.PHONNUM, :NEW.ADDR, :NEW.EMAIL, 'ȸ������');
    END IF;
    
    -- UPDATE �̺�Ʈ�� �߻��� ��� �α� �����
    IF UPDATING THEN
        INSERT INTO LOG
            (ID, PASSWORD, PHONNUM, ADDR, EMAIL, LOGMODE)
        VALUES (:OLD.ID
            , :OLD.PASSWORD || ' -> ' || :NEW.PASSWORD
            , :OLD.PHONNUM  || ' -> ' || :NEW.PHONNUM
            , :OLD.ADDR  || ' -> ' || :NEW.ADDR
            , :OLD.EMAIL  || ' -> ' || :NEW.EMAIL
            , 'ȸ������'
            );
    END IF;
    
    IF DELETING THEN
        INSERT INTO LOG
                 (ID, PASSWORD, NAME, BIRTH, PHONNUM, ADDR, EMAIL, LOGMODE)
        VALUES (:OLD.ID, :OLD.PASSWORD, :OLD.NAME, :OLD.BIRTH, :OLD.PHONNUM, :OLD.ADDR, :OLD.EMAIL, 'ȸ������');
    END IF;
END;

COMMENT ON COLUMN log.ID IS '���̵�'
/

COMMENT ON COLUMN log.PASSWORD IS '��й�ȣ'
/

COMMENT ON COLUMN log.NAME IS '�̸�'
/

COMMENT ON COLUMN log.BIRTH IS '�������'
/

COMMENT ON COLUMN log.PHONNUM IS '�ڵ�����ȣ'
/

COMMENT ON COLUMN log.ADDR IS '�ּ�'
/

COMMENT ON COLUMN log.EMAIL IS '�̸���'
/

COMMENT ON COLUMN log.REGDATE IS '��¥'
/

COMMENT ON COLUMN log.LOGMODE IS '���'
/


