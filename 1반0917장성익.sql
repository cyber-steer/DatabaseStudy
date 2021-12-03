--2장 혼자해보기
--1번 급여 급여에 300 인상한 후, 사원 이름, 인상된 급여를 검색

select ename, salary, salary+300
from employee;

--2번 사원의 이름, 급여, 연간 총수입(월급*12+100)을 총 수입이 많은 것부터 작은 순으로 검색
select ename, salary, salary*12+100 as 연간총수입
from employee
--order by salary*12+100 desc;
--order by 연간총수입 desc; --별칭사용
order by 3 desc; --인덱스 번호 사용 0부터 시작

--3번 급여가 2000을 넘는 사원의 이름과 급여를 급여가 많은 것부터 작은 순으로 검색
select ename, salary
from employee
where salary >= 2000
order by salary desc;

--5번 급여가 2000에서 3000사이에 포함되지 않는 사원의 이름과 급여 검색
select ename, salary
from employee
where salary not between 2000 and 3000;

--6번 1981년 2월 20일부터 1981년 5월 1일 사이에 입사한 사원의 이름, 담당 업무, 입사일 검색
select ename, JOB, hiredate
from employee
where hiredate between '1981/02/20' and '1981/05/01';

--8번 사원의 급여가 2000에서 3000 사이에 포함되고 부서번호가 20 또는 30인 사원의 이름, 급여, 부서번호 검색
--이름순으로 검색
select ename, salary, dno
from employee
where salary between 2000 and 3000
and dno in(20, 30)
order by ename asc;

select ename, salary, dno
from employee
where (salary >=2000 and salary<=3000)
and (dno =20 or dno =30)
order by ename asc;

--9번 1981년도에 입사한 사원의 이름과 입사일 검색(like 연산자와 와일드카드 사용)
select ename, hiredate
from employee
where hiredate between '81/01/01' and '81/12/31';

select ename, hiredate
from employee
where hiredate like '81%';

--10번 관리자(직속상관)이 알 수 없는 사원의 이름과 담당업무(직급) 검색
select ename job
from employee
where manager is null;

--13번 이름에 A와 E를 모두 포함하고 있는 사원의 이름 검색
select ename
from employee
where ename like '%A%'
and ename like '%E%';

--where ename like '%E%A%'
--or ename like '%A%E%';

--14번 담당업부(직급)가 사무원(CLERK) 또는 영업사원(SALESMAN)이면서
--급여가 1600 또는 950 또는 1300이 아닌 사원의 이름, 담당업무, 급여 검색
select ename, job, salary
from employee
where (job ='CLERK' or job = 'SALESMAN')
--and (salary <> 1600 and salary<>950 and salary<>1300);
and not (salary = 1600 or salary = 950 or salary = 1300);

select ename, job, salary
from employee
where job in('CLERK','SALESMAN')
and salary not in(1600, 950, 1300);

