--ch07 서브쿼리

--SCOTT과 동일한 부서에서 근무하는 사원 검색
select ename, dno
from employee
where dno = (
                select dno
                from employee
                where ename = 'SCOTT');
--최소 급여를 받는 사원의 이름, 담당업무, 급여 검색
select ename, job, salary
from employee
where salary = (
                select min(salary)
                from employee);

--30번 부서의 최소 급여를 구한후,
--부서별 최소 급여가 구한 최소 급여보다 큰 부서만 출력
select dno, min(salary)
from employee
group by dno
having min(salary) > (
                        select min(salary) 
                        from employee
                        where dno=30 );
                        
--다중행 서브쿼리
--부서별 최소 급여를 받는 사원의 사원번호와 이름, 급여 출력
select eno, ename, salary, dno
from employee
where salary in(
                select min(salary)
                from employee
                group by dno)
order by dno;

--직급이 SALESMAN이 아니면서 급여가 임의의 SALESMAN보다 낮은사원 검색
select ename, job, salary
from employee
where salary < any (
                    select salary
                    from employee
                    where job = 'SALESMAN')
and job <> 'SALESMAN';

--직급이 SALESMAN이 아니면서 급여가 모든 SALESMAN보다 낮은사원 검색
select ename, job, salary
from employee
where salary < all (
                    select salary
                    from employee
                    where job = 'SALESMAN')
and job <> 'SALESMAN';

--혼자해보기 7 8 하나로작성하는게 효율 17
--1번 7788 담당업무가 같은 사원이름 직무
select ename, job
from employee
where job = (
                select job
                from employee
                where eno = 7788);
                
--2번 7499 사원보다 급여가 많은 사원 네임 잡
select ename,job
from employee
where salary > (
                select salary
                from employee
                where eno = 7499);
                
--3번 최소 급여를 받는 사원의 이름,업부,급여 표시
select ename, job, salary
from employee
where salary = (
                select min(salary)
                from employee);
                
--4번 담당업무별 편균급여가 가장 적은 사원의 담당업무를 찾아 직급과 평균 급여를 표시
select job, round(avg(salary),1)
from employee
group by job
having avg(salary) = (
                                select min((avg(salary)))
                                from employee
                                group by job);
--5번 각 부서의 최소 급여를 받는 사원의 이름 급여 부서번호
select ename, salary, dno
from employee
where salary in (
                        select min(salary)
                        from employee
                        group by dno);
--6 담당업무가 분석가인 사원보다 급여가 적으면서 엄무박 분석가가 아닌 사원 사원번호,이름,직무,급여 출력any
select eno, ename, job, salary
from employee
where salary < any (
                    select salary
                    from employee
                    where job = 'ANALYST')
and job <> 'ANALYST';

--9번
select ename, hiredate 
from employee
where dno = (
                select dno
                from employee
                where ename = 'BLAKE')
and ename <> 'BLAKE';

--10번
select eno, ename
from employee
where salary > (
                select avg(salary)
                from employee)
order by salary;

--11번
select eno, ename
from employee
where dno in (
                select dno
                from employee
                where ename like '%K%');

--12번
select ename, dno, job
from employee
where dno = (
                select dno
                from department
                where loc = 'DALLAS');

--13번
select ename, salary
from employee
where manager = (
                    select eno
                    from employee
                    where ename = 'KING');
                    
--14번
select dno, ename, job
from employee
where dno =(
            select dno
            from department
            where dname = 'RESEARCH');

--15번
select eno, ename, salary
from employee
where salary > (
                select avg(salary)
                from employee)
and dno in (
                select dno
                from employee
                where ename like '%M%');
                
--16번
select job, avg(salary)
from employee
group by job
having avg(salary) = (
                        select min(avg(salary))
                        from employee
                        group by job ) ;