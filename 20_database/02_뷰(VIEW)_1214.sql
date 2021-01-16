/****************
�� : �ϳ� �Ǵ� �� �̻��� ���̺�κ��� �������� �κ������� ���̺��� ��ó�� ����ϴ� ��ü(�������̺�)
CREATE [OR REPLACE] VIEW ���Ī [(�÷���Ī1, �÷���Ī2, �÷���Ī3...�÷���ĪN)]
AS
SELECT ����
[�ɼ�];
-- �б����� �ɼ� : WITH READ ONLY (INSERT, DELETE, UPDATE �Ұ����� ���°� ��)
-- �� ���� : DROP VIEW ���̸�

* ����
EX)
-- FORCE : ���̺��� ��� �並 ������ ����
���̺��� ���� �� ��������־ �̸� �������� ���ؼ� FORCE�� ����� 
������ ���̺��� ������ ������ ������ ���.
CREATE FORCE VIEW TEST AS SELECT * FROM TEST999;
*****************/
-- �̷��� �� SQL ���¸� ����ͼ� �����ص� �ǰ� ��޴����� ���丸���� �䰡 ������ ������
  CREATE OR REPLACE FORCE VIEW "HR"."EMP_DEPT" ("EMPLOYEE_ID", "FIRST_NAME", "JOB_ID", "SALARY", "DEPARTMENT_ID", "DEPARTMENT_NAME", "MANAGER_ID") AS 
  SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.SALARY
    , E.DEPARTMENT_ID
    , D.DEPARTMENT_NAME, D.MANAGER_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-------------
-- ���̺��� ����ϵ��� �˻�����
-- �ٸ� VIEW�� �������� ���̺��� �ƴ�
SELECT
    *
FROM emp_dept
ORDER BY employee_id;
