--where 절을 이용한 조건 검색

select ename, job, dno
from employee
where dno=10;

--급여가 1500 이상인 사원 검색
select ename, salary
from employee
where salary >= 1500;

--SCOTT 사원 정보 검색 -문자 데이터 조회 
select *
from employee
where ename = 'SCOTT';

--입사일이 1981/01/01 이전인 사원만 검색 -날짜 데이터 검색
select *
from employee
where hiredate <= '1981/01/01';

--부서 번호가 10이고 직급이 MANAGER인 사원 검색
select *
from employee
where dno=10 and job='MANAGER';

--부서 번호가 10이거나 직급이 MANAGER인 사원 검색
select *
from employee
where dno=10 or job='MANAGER';

--부서번호가 10이 아닌 사원 검색
select *
from employee
where not dno=10;

select *
from employee
where dno<>10;

--급여가 1000에서 1500사이인 사원 검색
select *
from employee
where salary >= 1000 and salary <=1500;

--급여가 1000미만이거나 1500초과인 사원
select *
from employee
where salary < 1000 or salary > 1500;

--커미션이 300이거나 500이거나 1400인 사원 검색
select *
from employee
where commission =300 or commission= 500 or commission = 1400;

--급여가 1000에서 1500사이인 사원 검색 - between
select *
from employee
where salary between 1000 and 1500;

--급여가 1000미만이거나 1500초과인 사원 -between
select *
from employee
where salary not  between 1000 and 1500;

--1982년 입사한 사원 검색
select *
from employee
where hiredate between '1982/01/01' and '1982/12/31';

--커미션이 300이거나 500이거나 1400인 사원 검색 -in
select *
from employee
where commission in(300, 500, 1400);

--커미션이 300, 500, 1400이 아닌 사원 검색 -in
select *
from employee
where commission not in(300, 500, 1400);

--like 연산자와 와일드카드 - %, _(자리수)
--사원이름이 F로 시작하는 사원 검색
select *
from employee
where ename like 'F%';

--이름에 M이 포함되어 있는 사원 검색
select *
from employee
where ename like '%M%';

--이름이 N으로 끝나는 사원 검색
select *
from employee
where ename like '%N';

--이름의 두번째 글자가 A인 사원 검색
select *
from employee
where ename like '_A%';

--이름의 두번째 글자가 A가 아닌 사원 검색
select *
from employee
where ename not like '_A%';

--NULL을 위한 연산자
--사원의 커미션 검색
select ename, commission
from employee;

--커미션이 null인 사원 검색
select ename, commission
from employee
where commission is null;

--커미션이 null이 아닌 사원 검색
select ename, commission
from employee
where commission is not null;

--정령을 위한 order by 절
select *
from employee
order by ename asc; --오름차순 asc생략가능

select *
from employee
order by ename desc; --내림차순

--급여 높은 순으로 검색
select *
from employee
order by salary desc;

--최근 입사일 순으로 검색
select *
from employee
order by hiredate desc;

--급여 높은 순, 이름 순으로 검색
select *
from employee
order by salary desc, ename asc;