/* *********************************
<인덱스 - INDEX>
테이블에 있는 데이타(로우, 레코드)를 빠르게 찾기 위해 만들어진 데이타 구조
- 자동인덱스 : PRIMARY KEY 선언시 또는 UNIQUE 제약조건 설정시 생성되는 인덱스
- 수동인덱스 : CREATE INDEX 명령문을 사용해서 만드는 인덱스

<인덱스 생성시 고려사항>
-인덱스는 WHERE절에 자주 사용되는 컬럼에 적용
-조인조건에 자주 사용되는 컬럼에 적용
-컬럼의 데이타 분포도가 낮을 때 효율 증가(10~15%)
-단일 테이블에 인덱스가 너무 많아도 속도 저하 문제 발생(테이블당 4~5정도)
-컬럼의 데이타가 변경(입력,수정,삭제)되는 경우가 많으면 인덱스 사용량 검토
  (데이터 입력, 수정, 삭제시 인덱스에 대한 입력, 수정, 삭제 작업 발생)

<인덱스 생성 문법>
CREATE INDEX 인덱스명 ON 테이블명 (컬럼명1[, 컬럼명2, ..., 컬럼명n]);
CREATE [UNIQUE] INDEX ON 테이블명 (컬럼명1 [ASC|DESC], 컬럼명2, .., 컬럼명n);

<인덱스 삭제 문법>
DROP INDEX 인덱스명;

<인덱스 재구성 문법>
ALTER INDEX 인덱스명 REBUILD;
ALTER [UNIQUE] INDEX 인덱스명 [ON 테이블명 (컬럼명, ...)] REBUILD;
************************************/
-- 인덱스 생성 : BOOK 테이블의 출판사(PUBLISHER) 컬럼에 IX_BOOK 인덱스 만들기
CREATE INDEX IX_BOOK ON BOOK (PUBLISHER);
--PUBLISHER 만 찾는경우에는 IX_BOOK 이 사용됨
SELECT * FROM BOOK
WHERE publisher = '굿스포츠';

SELECT publisher, bookid
FROM BOOK ORDER BY publisher;
SELECT * FROM BOOK;

--인덱스 생성 : 2개 컬럼 기준
-- BOOK 테이블의 PUBLISHER와 PRICE 컬럼을 대상으로 IX_BOOK2 인덱스 생성
CREATE INDEX IX_BOOK2 ON BOOK (publisher, price);
SELECT PUBLISHER, PRICE
FROM BOOK ORDER BY publisher, price;
SELECT * FROM BOOK WHERE publisher = '대한미디어';
-- PRICE 조건 하나만 할 경우에는 INDEX를 사용할 수 있는게 없어서 전체로 검색하게 됨(인덱스를 만들어놓는다면 특정구간만 검색됨)
SELECT * FROM BOOK WHERE price > 10000;
--WHERE 절에 PUBLISHER, PRICE 동시사용 : IX_BOOK2 인덱스 사용됨
SELECT * FROM BOOK WHERE publisher = '굿스포츠' AND PRICE >= 7000;
/*
SELECT * FROM BOOK WHERE PRICE >= 7000 AND publisher = '굿스포츠';
이렇게 변경해도 상관 X
*/

--인덱스가 있는데 사용이 안되는 경우
SELECT * FROM BOOK WHERE publisher LIKE '대한%'; --인덱스 사용됨

-- 인덱스는 PUBLISHER의 앞자리 이름으로 정렬되어 있기때문에 뒤에나 중간 자리에 오는 단어로는 INDEX 사용이 불가능하다.
SELECT * FROM BOOK WHERE publisher LIKE '%대한'; -- 인덱스 사용안됨
SELECT * FROM BOOK WHERE publisher LIKE '%대한%'; -- 인덱스 사용안됨

--원본데이터를 가공한 경우 : 인덱스 적용 안됨
SELECT * FROM BOOK WHERE SUBSTR(PUBLISHER, 1, 2) = '대한'; -- 퍼블리셔 컬럼 값이 가공된 경우임 EX) UPPER, LOWER
-- 컬럼값은 가공없이 원본만 인덱스 사용하여 특정구간 검색이 가능하다.

-- 인덱스 삭제
DROP INDEX IX_BOOK;



--=======================================================
/* *** 인덱스 실습 ****************************
마당서점 데이터베이스에서 다음 SQL 문을 수행하고 
데이터베이스가 인덱스를 사용하는 과정을 확인하시오.
(1) 다음 SQL 문을 수행해본다.
	SELECT name FROM Customer WHERE name LIKE '박세리';
(2) 실행 계획을 살펴본다. 실행 계획은 [F10]키를 누른 후 
    [계획 설명]탭을 선택하면 표시된다.
(3) Customer 테이블에 name으로 인덱스(ix_customber_name)를 생성하시오. 
    생성 후 (1)번의 질의를 다시 수행하고 실행 계획을 살펴보시오.
(4) 같은 질의에 대한 두 가지 실행 계획을 비교해보시오.
(5) (3)번에서 생성한 인덱스를 삭제하시오.
******************************************/
SELECT name FROM Customer WHERE name LIKE '박세리';
DROP INDEX ix_customber_name;







