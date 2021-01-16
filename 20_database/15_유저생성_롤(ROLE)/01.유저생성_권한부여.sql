/* ********* ����� ����, ���� *********
-- ����� ���� : CREATE USER
CREATE USER ����ڸ�(������) --"MDGUEST" 
IDENTIFIED BY ��й�ȣ --"mdguest"  
DEFAULT TABLESPACE ���̺����̽� --"USERS"
TEMPORARY TABLESPACE �ӽ��۾����̺����̽� --"TEMP";

-- ����� �뷮 ����(����)
ALTER USER "MDGUEST" QUOTA UNLIMITED ON "USERS";

-- ����� ���� : ALTER USER 
ALTER USER ����ڸ�(������) IDENTIFIED BY ��й�ȣ;

-- ���Ѻο�(�� ��� ���� �ο�, �� �ο�)
GRANT "CONNECT" TO "MDGUEST" ;
GRANT "RESOURCE" TO "MDGUEST" ;

-- ����� ���� : DROP USER
DROP USER ������ [CASCADE];
--CASCADE : ���������� �����(����)�� ������ ��� ����Ÿ ����
*************************************/


-- (�����ڰ��� SYSTEM���� �۾��ϰ�) �������� ������ ���� SYSTEM���� �۾�
-- ������ MDGUEST, ��ȣ : mdguest
-- USER SQL
CREATE USER "MDGUEST" IDENTIFIED BY "mdguest"  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- ��(����) �ο� : GRANT
-- ROLES
GRANT "CONNECT" TO "MDGUEST" ;
GRANT "RESOURCE" TO "MDGUEST" ;

/*
    �� �ο� �κ��� �� �������� �ۼ��� �����ϴ�.
    GRANT CONNECT, RESOURCE TO MDGUSET; 
*/

-- �並 ������ �� �ִ� ���� �ο�
-- SYSTEM PRIVILEGES
GRANT CREATE VIEW TO "MDGUEST" ;

---------------------------------
-- (SYSTEM) CONNECT, RESOURCE ��(ROLE) �� �ִ� ���� Ȯ��
SELECT
    *
FROM SYS.dba_sys_privs
WHERE grantee IN( 'CONNECT', 'RESOURCE')
ORDER BY grantee, privilege
;

--=============================
/****** ���� �ο�(GRANT), ���� ���(REVOKE) **********************
GRANT ���� [ON ��ü] TO {�����|ROLE|PUBLIC,.., n} [WITH GRANT OPTION]
--PUBLIC�� ��� ����ڿ��� ������ �ǹ�

GRANT ���� TO �����; --������ ����ڿ��� �ο�
GRANT ���� ON ��ü TO �����; -��ü�� ���� ������ ����ڿ��� �ο�
-->> WITH GRANT OPTION :��ü�� ���� ������ ����ڿ��� �ο� 
-- ������ ���� ����ڰ� �ٸ� ����ڿ��� ���Ѻο��� �Ǹ� ����
GRANT ���� ON ��ü TO ����� WITH GRANT OPTION;
--------------------
-->>>���� ���(REVOKE)
REVOKE ���� [ON ��ü] FROM {�����|ROLE|PUBLIC,.., n} CASCADE
--CASCADE�� ����ڰ� �ٸ� ����ڿ��� �ο��� ���ѱ��� ��ҽ�Ŵ
  (Ȯ�� �� ���� �� �۾�)

REVOKE ���� FROM �����; --������ ����ڿ��� �ο�
REVOKE ���� ON ��ü FROM �����; -��ü�� ���� ������ ����ڿ��� �ο�
*************************************************/

-- ���Ѻο� : MADANG ������ BOOK ���̺� ���� SELECT ������ MDGUEST���� �ο�
--------(SYSTEM) ���Ѻο�  - MADANG.BOOK, �ý����� ������ �ִ� ���� �ƴϴ� MADANG.�� ����ؾ� ��
SELECT * FROM MADANG.BOOK; -- �ý��ۿ��� �׳� BOOK �� �ƴ϶� MADANG.BOOK�̶�� �ϸ� ������ �����ϴ�.
GRANT SELECT ON MADANG.BOOK TO MDGUEST;

----(MDGUSET) MADANG.BOOK ���̺� ������ ��ȸ(SLEECT) �� �� ����
SELECT * FROM MADANG.BOOK; -- �ý��ۿ��� MDGUSET�� MADANG.BOOK�� ������ �� �ִ� ������ �־��� ������ �����ϴ�
SELECT * FROM MADANG.CUSTOMER; -- ������ ���� ������ �Ұ����� :  "table or view does not exist"

-- (SYSTEM) ���� ȸ��(REVOKE) - MADANG.BOOK
REVOKE SELECT ON MADANG.BOOK FROM MDGUSET; -- ȸ���ϸ� ���ٱ����� ������

--------------------------------------
--(MADANG ��������) CUSTOMER ���̺� ���Ͽ� MDGUEST ��������
---- SELECT, UPDATE ���� �ο�
SELECT * FROM MADANG.BOOK;
-- ���� ������ �ִٸ� MADANG. �� ��������

GRANT SELECT, UPDATE ON CUSTOMER TO MDGUEST;

--(MDGUEST ����) CUSTOMER ���̺� SELECT, UPDATE
-- ������ �ο� �޾Ƽ� SELECT, UPDATE �۾� ����
SELECT * FROM MADANG.customer;

UPDATE MADANG.CUSTOMER 
    SET PHONE = '010-1111-2222'
WHERE NAME = '�ڼ���'
;

-- (MADANG) ���� ���(ȸ��)
REVOKE SELECT, UPDATE ON CUSTOMER FROM MDGUEST;

------------------------
-- (MADANG) WITH GRANT OPTION : �ٸ� �������� ������ �ο��� �� �ֵ��� ���
GRANT SELECT, UPDATE ON CUSTOMER TO MDGUEST WITH GRANT OPTION;


--(MDGUEST) �ٸ� �������� ������ �ο�
GRANT SELECT, UPDATE ON MADANG.CUSTOMER TO HR;

-- (HR) MADANG.CUSTOMER SELECT 
SELECT * FROM MADANG.customer;
SELECT * FROM MADANG.BOOK; -- ���Ѻο� X, ���� X

-- (MADANG)�������
REVOKE SELECT, UPDATE ON CUSTOMER FROM MDGUEST;

--------------------
-- (������ SYSTEM ����) ��������
DROP USER MDGUEST CASCADE;
-- ���� ������ ����ٸ� ������ �����ؾ� �Ѵ�.












