/* ********* 사용자 생성, 삭제 *********
-- 사용자 생성 : CREATE USER
CREATE USER 사용자명(유저명) --"MDGUEST" 
IDENTIFIED BY 비밀번호 --"mdguest"  
DEFAULT TABLESPACE 테이블스페이스 --"USERS"
TEMPORARY TABLESPACE 임시작업테이블스페이스 --"TEMP";

-- 사용할 용량 지정(수정)
ALTER USER "MDGUEST" QUOTA UNLIMITED ON "USERS";

-- 사용자 수정 : ALTER USER 
ALTER USER 사용자명(유저명) IDENTIFIED BY 비밀번호;

-- 권한부여(롤 사용 권한 부여, 롤 부여)
GRANT "CONNECT" TO "MDGUEST" ;
GRANT "RESOURCE" TO "MDGUEST" ;

-- 사용자 삭제 : DROP USER
DROP USER 유저명 [CASCADE];
--CASCADE : 삭제시점에 사용자(유저)가 보유한 모든 데이타 삭제
*************************************/


-- (관리자계정 SYSTEM에서 작업하고) 유저생상 권한을 가진 SYSTEM에서 작업
-- 유저명 MDGUEST, 암호 : mdguest
-- USER SQL
CREATE USER "MDGUEST" IDENTIFIED BY "mdguest"  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- 롤(역할) 부여 : GRANT
-- ROLES
GRANT "CONNECT" TO "MDGUEST" ;
GRANT "RESOURCE" TO "MDGUEST" ;

/*
    롤 부여 부분을 한 문장으로 작성도 가능하다.
    GRANT CONNECT, RESOURCE TO MDGUSET; 
*/

-- 뷰를 생성할 수 있는 권한 부여
-- SYSTEM PRIVILEGES
GRANT CREATE VIEW TO "MDGUEST" ;

---------------------------------
-- (SYSTEM) CONNECT, RESOURCE 롤(ROLE) 에 있는 권한 확인
SELECT
    *
FROM SYS.dba_sys_privs
WHERE grantee IN( 'CONNECT', 'RESOURCE')
ORDER BY grantee, privilege
;

--=============================
/****** 권한 부여(GRANT), 권한 취소(REVOKE) **********************
GRANT 권한 [ON 객체] TO {사용자|ROLE|PUBLIC,.., n} [WITH GRANT OPTION]
--PUBLIC은 모든 사용자에게 적용을 의미

GRANT 권한 TO 사용자; --권한을 사용자에게 부여
GRANT 권한 ON 객체 TO 사용자; -객체에 대한 권한을 사용자에게 부여
-->> WITH GRANT OPTION :객체에 대한 권한을 사용자에게 부여 
-- 권한을 받은 사용자가 다른 사용자에게 권한부여할 권리 포함
GRANT 권한 ON 객체 TO 사용자 WITH GRANT OPTION;
--------------------
-->>>권한 취소(REVOKE)
REVOKE 권한 [ON 객체] FROM {사용자|ROLE|PUBLIC,.., n} CASCADE
--CASCADE는 사용자가 다른 사용자에게 부여한 권한까지 취소시킴
  (확인 및 검증 후 작업)

REVOKE 권한 FROM 사용자; --권한을 사용자에게 부여
REVOKE 권한 ON 객체 FROM 사용자; -객체에 대한 권한을 사용자에게 부여
*************************************************/

-- 권한부여 : MADANG 유저의 BOOK 테이블에 대한 SELECT 권한을 MDGUEST에게 부여
--------(SYSTEM) 권한부여  - MADANG.BOOK, 시스템이 가지고 있는 것이 아니니 MADANG.을 사용해야 함
SELECT * FROM MADANG.BOOK; -- 시스템에서 그냥 BOOK 이 아니라 MADANG.BOOK이라고 하면 접근이 가능하다.
GRANT SELECT ON MADANG.BOOK TO MDGUEST;

----(MDGUSET) MADANG.BOOK 테이블 데이터 조회(SLEECT) 할 수 있음
SELECT * FROM MADANG.BOOK; -- 시스템에서 MDGUSET에 MADANG.BOOK에 접근할 수 있는 권한을 주었기 때문에 가능하다
SELECT * FROM MADANG.CUSTOMER; -- 권한이 없어 접근이 불가능함 :  "table or view does not exist"

-- (SYSTEM) 권한 회수(REVOKE) - MADANG.BOOK
REVOKE SELECT ON MADANG.BOOK FROM MDGUSET; -- 회수하면 접근권한이 없어짐

--------------------------------------
--(MADANG 유저에서) CUSTOMER 테이블에 대하여 MDGUEST 유저에게
---- SELECT, UPDATE 권한 부여
SELECT * FROM MADANG.BOOK;
-- 내가 가지고 있다면 MADANG. 을 생략가능

GRANT SELECT, UPDATE ON CUSTOMER TO MDGUEST;

--(MDGUEST 에서) CUSTOMER 테이블 SELECT, UPDATE
-- 권한을 부여 받아서 SELECT, UPDATE 작업 가능
SELECT * FROM MADANG.customer;

UPDATE MADANG.CUSTOMER 
    SET PHONE = '010-1111-2222'
WHERE NAME = '박세리'
;

-- (MADANG) 권한 취소(회수)
REVOKE SELECT, UPDATE ON CUSTOMER FROM MDGUEST;

------------------------
-- (MADANG) WITH GRANT OPTION : 다른 유저에게 권한을 부여할 수 있도록 허용
GRANT SELECT, UPDATE ON CUSTOMER TO MDGUEST WITH GRANT OPTION;


--(MDGUEST) 다른 유저에게 권한을 부여
GRANT SELECT, UPDATE ON MADANG.CUSTOMER TO HR;

-- (HR) MADANG.CUSTOMER SELECT 
SELECT * FROM MADANG.customer;
SELECT * FROM MADANG.BOOK; -- 권한부여 X, 접근 X

-- (MADANG)권한취소
REVOKE SELECT, UPDATE ON CUSTOMER FROM MDGUEST;

--------------------
-- (관리자 SYSTEM 에서) 유저삭제
DROP USER MDGUEST CASCADE;
-- 만약 오류가 생긴다면 접속을 해제해야 한다.












