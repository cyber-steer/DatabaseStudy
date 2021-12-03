--데이터를 조회하기 위한 select문
--모든 부서정보 검색
select *            --컬럼정보
from department;    --테이블 명

--모든 사원정보 검색
select *
from employee;

--모든 사원의 사원이름, 입사일 검색
select ename, job, hiredate
from employee;

--사원이름, 급여, 연봉(급여*12) 검색 - 산술 연산자 사용
select ename, salary, salary*12
from employee;

--사원이름, 급여, 성과금, 연봉(급여 * 12 + 성과금) 검색 - 산술 연산자 사용 nvl함수, 별칭사용
select ename 사원이름, salary, commission, salary*12 +nvl(commission, 0) as 연봉
from employee;

--사원테이블에서 부서번호 검색 -중복데이터 제거 distinct
select distinct dno
from employee;

--오늘 날짜 출력 -sysdate, dual 테이블, 테이블구조 desc
select sysdate
from dual;

desc dual;
select * from dual;

desc department;