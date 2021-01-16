/****************
뷰 : 하나 또는 둘 이상의 테이블로부터 데이터의 부분집합을 테이블인 것처럼 사용하는 객체(가상테이블)
CREATE [OR REPLACE] VIEW 뷰명칭 [(컬럼별칭1, 컬럼별칭2, 컬럼별칭3...컬럼별칭N)]
AS
SELECT 문장
[옵션];
-- 읽기전용 옵션 : WITH READ ONLY (INSERT, DELETE, UPDATE 불가능한 상태가 됨)
-- 뷰 삭제 : DROP VIEW 뷰이름

* 참고
EX)
-- FORCE : 테이블이 없어도 뷰를 강제로 생성
테이블이 아직 안 만들어져있어도 미리 만들어놓기 위해서 FORCE를 사용함 
하지만 테이블이 없으니 빨간색 엑박이 뜬다.
CREATE FORCE VIEW TEST AS SELECT * FROM TEST999;
*****************/
-- 이렇게 뷰 SQL 형태를 끌고와서 생성해도 되고 뷰메뉴에서 새뷰만들기로 뷰가 생성이 가능함
  CREATE OR REPLACE FORCE VIEW "HR"."EMP_DEPT" ("EMPLOYEE_ID", "FIRST_NAME", "JOB_ID", "SALARY", "DEPARTMENT_ID", "DEPARTMENT_NAME", "MANAGER_ID") AS 
  SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.SALARY
    , E.DEPARTMENT_ID
    , D.DEPARTMENT_NAME, D.MANAGER_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-------------
-- 테이블에서 사용하듯이 검색가능
-- 다만 VIEW는 물리적인 테이블이 아님
SELECT
    *
FROM emp_dept
ORDER BY employee_id;
