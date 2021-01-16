/* *********************************
<�ε��� - INDEX>
���̺� �ִ� ����Ÿ(�ο�, ���ڵ�)�� ������ ã�� ���� ������� ����Ÿ ����
- �ڵ��ε��� : PRIMARY KEY ����� �Ǵ� UNIQUE �������� ������ �����Ǵ� �ε���
- �����ε��� : CREATE INDEX ��ɹ��� ����ؼ� ����� �ε���

<�ε��� ������ �������>
-�ε����� WHERE���� ���� ���Ǵ� �÷��� ����
-�������ǿ� ���� ���Ǵ� �÷��� ����
-�÷��� ����Ÿ �������� ���� �� ȿ�� ����(10~15%)
-���� ���̺� �ε����� �ʹ� ���Ƶ� �ӵ� ���� ���� �߻�(���̺�� 4~5����)
-�÷��� ����Ÿ�� ����(�Է�,����,����)�Ǵ� ��찡 ������ �ε��� ��뷮 ����
  (������ �Է�, ����, ������ �ε����� ���� �Է�, ����, ���� �۾� �߻�)

<�ε��� ���� ����>
CREATE INDEX �ε����� ON ���̺�� (�÷���1[, �÷���2, ..., �÷���n]);
CREATE [UNIQUE] INDEX ON ���̺�� (�÷���1 [ASC|DESC], �÷���2, .., �÷���n);

<�ε��� ���� ����>
DROP INDEX �ε�����;

<�ε��� �籸�� ����>
ALTER INDEX �ε����� REBUILD;
ALTER [UNIQUE] INDEX �ε����� [ON ���̺�� (�÷���, ...)] REBUILD;
************************************/
-- �ε��� ���� : BOOK ���̺��� ���ǻ�(PUBLISHER) �÷��� IX_BOOK �ε��� �����
CREATE INDEX IX_BOOK ON BOOK (PUBLISHER);
--PUBLISHER �� ã�°�쿡�� IX_BOOK �� ����
SELECT * FROM BOOK
WHERE publisher = '�½�����';

SELECT publisher, bookid
FROM BOOK ORDER BY publisher;
SELECT * FROM BOOK;

--�ε��� ���� : 2�� �÷� ����
-- BOOK ���̺��� PUBLISHER�� PRICE �÷��� ������� IX_BOOK2 �ε��� ����
CREATE INDEX IX_BOOK2 ON BOOK (publisher, price);
SELECT PUBLISHER, PRICE
FROM BOOK ORDER BY publisher, price;
SELECT * FROM BOOK WHERE publisher = '���ѹ̵��';
-- PRICE ���� �ϳ��� �� ��쿡�� INDEX�� ����� �� �ִ°� ��� ��ü�� �˻��ϰ� ��(�ε����� �������´ٸ� Ư�������� �˻���)
SELECT * FROM BOOK WHERE price > 10000;
--WHERE ���� PUBLISHER, PRICE ���û�� : IX_BOOK2 �ε��� ����
SELECT * FROM BOOK WHERE publisher = '�½�����' AND PRICE >= 7000;
/*
SELECT * FROM BOOK WHERE PRICE >= 7000 AND publisher = '�½�����';
�̷��� �����ص� ��� X
*/

--�ε����� �ִµ� ����� �ȵǴ� ���
SELECT * FROM BOOK WHERE publisher LIKE '����%'; --�ε��� ����

-- �ε����� PUBLISHER�� ���ڸ� �̸����� ���ĵǾ� �ֱ⶧���� �ڿ��� �߰� �ڸ��� ���� �ܾ�δ� INDEX ����� �Ұ����ϴ�.
SELECT * FROM BOOK WHERE publisher LIKE '%����'; -- �ε��� ���ȵ�
SELECT * FROM BOOK WHERE publisher LIKE '%����%'; -- �ε��� ���ȵ�

--���������͸� ������ ��� : �ε��� ���� �ȵ�
SELECT * FROM BOOK WHERE SUBSTR(PUBLISHER, 1, 2) = '����'; -- �ۺ��� �÷� ���� ������ ����� EX) UPPER, LOWER
-- �÷����� �������� ������ �ε��� ����Ͽ� Ư������ �˻��� �����ϴ�.

-- �ε��� ����
DROP INDEX IX_BOOK;



--=======================================================
/* *** �ε��� �ǽ� ****************************
���缭�� �����ͺ��̽����� ���� SQL ���� �����ϰ� 
�����ͺ��̽��� �ε����� ����ϴ� ������ Ȯ���Ͻÿ�.
(1) ���� SQL ���� �����غ���.
	SELECT name FROM Customer WHERE name LIKE '�ڼ���';
(2) ���� ��ȹ�� ���캻��. ���� ��ȹ�� [F10]Ű�� ���� �� 
    [��ȹ ����]���� �����ϸ� ǥ�õȴ�.
(3) Customer ���̺� name���� �ε���(ix_customber_name)�� �����Ͻÿ�. 
    ���� �� (1)���� ���Ǹ� �ٽ� �����ϰ� ���� ��ȹ�� ���캸�ÿ�.
(4) ���� ���ǿ� ���� �� ���� ���� ��ȹ�� ���غ��ÿ�.
(5) (3)������ ������ �ε����� �����Ͻÿ�.
******************************************/
SELECT name FROM Customer WHERE name LIKE '�ڼ���';
DROP INDEX ix_customber_name;







