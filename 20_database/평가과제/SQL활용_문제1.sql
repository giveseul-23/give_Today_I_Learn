/*���̺� ����*/
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

-- ������ �Է�, ����, ���� �۾�
-- (�Է�)���� �����͸� MEMBER ���̺� �Է��� �� 2���� �߰��� �Է�(5�� �Է�)
INSERT INTO MEMBER(ID, NAME, PASSWORD, PHONE , EMAIL)
VALUES('hong', 'ȫ�浿', 'hong1234', '010-1111-1111', 'hong@test.com');

INSERT INTO MEMBER(ID, NAME, PASSWORD, PHONE , EMAIL)
VALUES('kim', '������', 'kim1234', '010-2222-2222', 'kim@test.com');

INSERT INTO MEMBER(ID, NAME, PASSWORD, PHONE , EMAIL)
VALUES('kang', '������', 'kang1234', '010-3333-3333', 'kang@test.com');

INSERT INTO MEMBER(ID, NAME, PASSWORD, PHONE , EMAIL)
VALUES('give', '�ִٽ�', 'ju1234', '010-5555-5555', 'ju@test.com');

INSERT INTO MEMBER(ID, NAME, PASSWORD, PHONE , EMAIL)
VALUES('ulji', '��������', 'ulji1234', '010-6666-6666', 'ulji@test.com');

-- ���
SELECT * FROM MEMBER;

-- ����
COMMIT;

--(�Է�)BOARD ���̺� ȫ�浿�� �ۼ��� �Խñ� 2�� �Է�
INSERT INTO BOARD(BNO, TITLE, CONTENT, ID, REGDATE)
VALUES(1, '������', 'ȫ�浿 ������ ���ÿ�', 'hong', '2020-12-20');

INSERT INTO BOARD(BNO, TITLE, CONTENT, ID, REGDATE)
VALUES(2, '�������', 'ȫ�浿 ������ ���ÿ���', 'hong', '2020-12-23');

-- ���
SELECT * FROM BOARD;

-- ����
COMMIT;

-- ����
-- (����)�������� ��ȭ��ȣ�� �̸����� 010-2222-1234, kim@mystudy.com ���� ����
UPDATE member
SET PHONE = '010-2222-1234', EMAIL = 'kim@mystudy.com'
WHERE NAME = '������';

-- ���
SELECT * FROM member;

-- ����
COMMIT;

-- ����
-- (����) �߰� �Է��� 2���� ȸ�������� ����
DELETE FROM MEMBER
WHERE NAME = '�ִٽ�';

DELETE FROM MEMBER
WHERE NAME = '��������';

-- ���
SELECT * FROM member;

-- ����
COMMIT;

--���������� Ȯ��
--USER_CONS_COLUMS : �÷��� �Ҵ�� ���� ���� ��ȸ
--USER_CONSTRAINTS : ������ ������ ��� ���� ���� ��ȸ
--���������� Ȯ��
--USER_CONS_COLUMS : �÷��� �Ҵ�� ���� ���� ��ȸ
--USER_CONSTRAINTS : ������ ������ ��� ���� ���� ��ȸ
SELECT A.TABLE_NAME,��
       A.COLUMN_NAME,
       B.CONSTRAINT_TYPE,
       DECODE(B.CONSTRAINT_TYPE,
              'P','PRIMARY KEY',
              'U','UNIQUE KEY',
              'C','CHECK OR NOT NULL',
              'R','FOREIGN KEY') CONSTRAINT_TYPE��
  FROM USER_CONS_COLUMNS A, USER_CONSTRAINTS B����
 WHERE A.TABLE_NAME IN ('BOARD', 'MEMBER')��
   AND A.TABLE_NAME = B.TABLE_NAME����
   AND A.CONSTRAINT_NAME = B.CONSTRAINT_NAME����
 ORDER BY 1;


