-- HR �μ����� ���� �� ������ �޿� ���� ������ �ۼ��Ϸ��� �Ѵ�. 
--�������(Employees) ���̺��� �޿��� $7,000~$10,000 ���� �̿��� ����� 
-- �̸��� ��(Name���� ��Ī) �� �޿��� �޿��� ���� ������ ����Ͻÿ�
SELECT first_name || ' ' ||last_name as Name, salary
FROM employees
WHERE salary <7000 OR salary > 10000
ORDER BY salary;

--��2 HR �μ������� �޿�(salary)�� ������(commission_pct)�� ���� ���� ������ �ۼ��Ϸ��� �Ѵ�. 
--������ �޴� ��� ����� �̸��� ��(Name���� ��Ī), �޿�, ����, �������� ����Ͻÿ�. 
--�̶� �޿��� ū ������� �����ϵ�, (�޿��� ������ �������� ū ����)��� �����Ͻÿ�
SELECT last_name || ' ' || first_name AS "Name", salary, job_id, NVL(commission_pct, 0) AS ������
FROM employees
ORDER BY salary DESC, ������ DESC;
  
--3 �̹� �б⿡ 60�� IT �μ������� �ű� ���α׷��� �����ϰ� �����Ͽ� ȸ�翡 �����Ͽ���. 
--�̿� �ش� �μ��� ��� �޿��� 12.3% �λ��ϱ�� �Ͽ���. 
--60�� IT �μ� ����� �޿��� 12.3% �λ��Ͽ� ������(�ݿø�) ǥ���ϴ� ������ �ۼ��Ͻÿ�. 
--������ �����ȣ, ���� �̸�(Name���� ��Ī), �޿�, �λ�� �޿�(Increase Salary�� ��Ī)������ ����Ͻÿ�
SELECT employee_id, first_name || ' ' || last_name AS "Name", salary, TRUNC(salary * 12.3)
FROM employees;

--4 �� ����� ��(last_name)�� ��s���� ������ ����� �̸��� ������ �Ʒ��� ���� ���� ����ϰ��� �Ѵ�. 
--��� �� �̸�(first_name)�� ��(last_name)�� ù ���ڰ� �빮��, ������ ��� �빮�ڷ� ����ϰ� 
--�Ӹ���(��ȸ�÷���)�� Employee JOBs.�� ǥ���Ͻÿ�
--��) FIRST_NAME  LAST_NAME  Employee JOBs.
--Shelley     Higgins    AC_MGR
SELECT INITCAP(first_name), INITCAP(last_name), UPPER(job_id) AS "Employee JOBs."
FROM employees
WHERE last_name LIKE 'S%';

--5 ��� ����� ������ ǥ���ϴ� ������ �ۼ��Ϸ��� �Ѵ�. 
--������ ����� �̸��� ��(Name���� ��Ī), �޿�, ���翩�ο� ���� ������ �����Ͽ� ����Ͻÿ�. 
--���翩�δ� ������ ������ ��Salary + Commission��, ������ ������ ��Salary only����� ǥ���ϰ�, 
--��Ī�� ������ ���̽ÿ�. ���� ��� �� ������ ���� ������ �����Ͻÿ� ***
SELECT first_name || ' ' || last_name AS "Name", salary AS �޿�, NVL2(commission_pct, 'Salary + Commission', 'Salary only') AS ���翩��
FROM employees
ORDER BY (salary*12);
  
--6 �� ����� �Ҽӵ� �μ����� �޿� �հ�, �޿� ���, �޿� �ִ�, �޿� �ּڰ��� �����ϰ��� �Ѵ�. 
--���� ��°��� ���� �ڸ��� �� �ڸ� ���б�ȣ, $ǥ�ÿ� �Բ� ���($123,456) 
--��, �μ��� �Ҽӵ��� ���� ����� ���� ������ �����ϰ�, ��� �� �Ӹ����� ��Ī(alias) ó���Ͻÿ�
SELECT TO_CHAR(SUM(salary),'$999,999,999'), AVG(salary), TO_CHAR(MAX(salary),'$999,999,999'), TO_CHAR(MIN(salary),'$999,999,999')
FROM employees
GROUP BY department_id;

--7 ������� ������ ��ü �޿� ����� $10,000���� ū ��츦 ��ȸ�Ͽ� ������ �޿� ����� ����Ͻÿ�. 
--�� ������ CLERK�� ���Ե� ���� �����ϰ� ��ü �޿� ����� ���� ������� ����Ͻÿ�
SELECT AVG(salary)
FROM employees
GROUP BY job_id
HAVING AVG(salary) > 10000  AND job_id NOT IN ('CLERK')
ORDER BY AVG(salary) DESC;

--8 HR ��Ű���� �����ϴ� Employees, Departments, Locations ���̺��� ������ �ľ��� �� 
--Oxford�� �ٹ��ϴ� ����� �̸��� ��(Name���� ��Ī), ����, �μ��̸�, �����̸��� ����Ͻÿ�. 
--�̶� ù ��° ���� ȸ���̸��� ��Han-Bit���̶�� ������� ��µǵ��� �Ͻÿ�
SELECT 'Han-Bit', e.last_name, e.first_name || ' ' || e.last_name as "Name", e.job_id, d.department_name, l.city
FROM departments d
    INNER JOIN employees e
    ON d.department_id = e.department_id
    INNER JOIN locations l
    ON d.location_id = l.location_id
WHERE l.city = 'Oxford';

--9 HR ��Ű���� �ִ� Employees, Departments ���̺��� ������ �ľ��� �� ������� �ټ� �� �̻��� 
--�μ��� �μ��̸��� ��� ���� ����Ͻÿ�. �̶� ��� ���� ���� ������ �����Ͻÿ�
SELECT e.department_id,  COUNT(*)
FROM employees e INNER JOIN departments d
    ON e.department_id = d.department_id
GROUP BY e.department_id
HAVING COUNT(*) >= 5 
ORDER BY COUNT(*) DESC;


/*
CREATE TABLE JOB_GRADES (
    GRADE_LEVEL VARCHAR2(3),
    LOWEST_SAL NUMBER,
    HIGHEST_SAL NUMBER
);
INSERT INTO JOB_GRADES VALUES ('A', 1000, 2999);
INSERT INTO JOB_GRADES VALUES ('B', 3000, 5999);
INSERT INTO JOB_GRADES VALUES ('C', 6000, 9999);
INSERT INTO JOB_GRADES VALUES ('D', 10000, 14999);
INSERT INTO JOB_GRADES VALUES ('E', 15000, 24999);
INSERT INTO JOB_GRADES VALUES ('F', 25000, 40000);
COMMIT;

********************************/
CREATE TABLE JOB_GRADES (
    GRADE_LEVEL VARCHAR2(3),
    LOWEST_SAL NUMBER,
    HIGHEST_SAL NUMBER
);
INSERT INTO JOB_GRADES VALUES ('A', 1000, 2999);
INSERT INTO JOB_GRADES VALUES ('B', 3000, 5999);
INSERT INTO JOB_GRADES VALUES ('C', 6000, 9999);
INSERT INTO JOB_GRADES VALUES ('D', 10000, 14999);
INSERT INTO JOB_GRADES VALUES ('E', 15000, 24999);
INSERT INTO JOB_GRADES VALUES ('F', 25000, 40000);

COMMIT; 

--10 �� ����� �޿��� ���� �޿� ����� �����Ϸ��� �Ѵ�. 
--�޿� ����� Job_Grades ���̺� ǥ�õȴ�. �ش� ���̺��� ������ ���캻 �� 
--����� �̸��� ��(Name���� ��Ī), ����, �μ��̸�, �Ի���, �޿�, �޿������ ����Ͻÿ�.
SELECT e.last_name, e.first_name || ' ' || e.last_name as "Name", d.department_name, e.job_id, e.hire_date, e.salary, j.grade_level
FROM employees e 
    INNER JOIN job_grades j
    ON e.salary BETWEEN j.LOWEST_SAL AND j.highest_sal
    INNER JOIN departments d
    ON e.department_id = d.department_id;
