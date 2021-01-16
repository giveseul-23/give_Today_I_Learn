/*
    ������(SEQUENCE) : DB���� �����ϴ� �ڵ�ä�� ��ü
    ���� : CREATE SEQUENCE ��������;
    
    ��������.NEXTVAL : ������ ��ȣ(��) ����
    ��������.CURRVAL : 
    
*/

   CREATE SEQUENCE  SEQUENCE1  
   MINVALUE 1 MAXVALUE 99999999999999999999999
   INCREMENT BY 1
   START WITH 1
   CACHE 20 NOORDER  NOCYCLE ;

SELECT SEQUENCE1.NEXTVAL FROM DUAL; -- ��� ����Ǹ� ���� 1��(INCREMENT BY 1) ������
-----------------
SELECT * FROM BOOK;
SELECT MAX(BOOKID), MAX(BOOKID) + 1 FROM BOOK;
SELECT MAX(AAA), NVL(MAX(AAA), 0) + 1 FROM AAA; -- �����Ͱ� ���� ��(NULL)
------
-- BOOK ���̺� INSERT �۾�, BOOKID �ִ밪 + 1
INSERT INTO book
    (BOOKID, BOOKNAME, PUBLISHER, PRICE)
VALUES ((SELECT NVL(MAX(BOOKID), 0) + 1 FROM BOOK), 'MAX(BOOKID) + 1', 'ITBOOK', 20000);

COMMIT;

SELECT * FROM BOOK ORDER BY BOOKID DESC;
---------------------
-- ������ ���(���۹�ȣ 50, NOCACHE)
CREATE SEQUENCE SEQ_BOOK
START WITH 50
INCREMENT BY 1 -- ������ ���� (����Ʈ���� 1�� �����ϴ� ������ �Ǿ�����)
NOCACHE; -- ĳ�û�� ����

SELECT SEQ_BOOK.NEXTVAL FROM DUAL;
------ BOOK ���̺� ������ ���
INSERT INTO BOOK
    (BOOKID, BOOKNAME, PUBLISHER, PRICE)
VALUES(SEQ_BOOK.NEXTVAL,
        'SEQ_BOOK.NEXTVAL ����', 'ITBOOK', 20000);
        
COMMIT;

SELECT * FROM BOOK ORDER BY BOOKID DESC;

--------------------������ ����
drop sequence SEQUENCE1;
