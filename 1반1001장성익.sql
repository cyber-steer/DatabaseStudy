--4장 혼자해보기
--6번 사원들의 직속상관의 사번을 출력
-- 직속상관이 없는 경우 null 대신 0으로 출력
select eno, ename, nvl(manager, 0), nvl2(manager, manager, 0)
from employee;

--7번 직급에 따라 급여를 인상
-- 'ANAIYST',200 / 'SALESMAN',180 / 'MANAGER',150 / 'CLERK',100
select eno, ename, job, salary, decode(job, 'ANALYST', salary+20,
                                            'SALESMAN', salary +180,
                                            'MANAGER', salary +150,
                                            'CLERK', salary +100,
                                            salary) as update_salary
from employee;

select eno, ename, job, salary, case when job = 'ANALYST' then salary+200
                                    when job = 'SALESMAN' then salary +180
                                    when job = 'MANAGER' then salary +150
                                    when job = 'CLERK' then salary +100
                                    else salary
                                end as update_salary
from employee;

--5장 그룹함수
--사원들의 급여 총액, 평균액, 최고액, 최소액 검색
select sum(salary), round(avg(salary),1), max(salary), min(salary)
from employee;

--가장 최근에 입사한 사원과 가장 오래전에 입사한 사원의 입사일 검색
select max(hiredate), min(hiredate)
from employee;

--커미션의 총액 검색 - 그룹함수는 다른 연산자와 달리 null 값은 제외함.
select sum(commission)
from employee;

--전체 사원 수 구하기
select count(*)
from employee;

--커미션을 알 수 있는 사원 수 구하기
select count(commission)
from employee;

--직급 종류의 개수 구하기
select count(distinct job)
from employee;

--급여의 총액 구하기 - 여러개를 검색할때 서로 데이터 갯수가 같아야함
--select ename, max(salary)
select max(salary)
from employee;

--group by : 특정 칼럼을 기준으로 그룹을 나눌 때 사용
--부서별 평균 급여 검색
select dno, round(avg(salary))
from employee
group by dno
order by 2 desc;

--부서별, 직급별 평균 급여 검색
select dno, job, count(*), round(avg(salary))
from employee
group by dno, job
order by dno asc, 3 desc;

--having : 그룹 결과 제한 - ~별 은 group by
--부서별 급여의 최고액 검색, 최고액이 3000 이상
select dno, max(salary)
from employee
--where max(salary) >= 3000 - 오류 그룹함수에선 where 대신 having 이용
group by dno
having max(salary) >= 3000
order by dno;

--직급별 급여 총액 검색, 총액이 5000이상, MANAGER는 제외
select job, sum(salary)
from employee
where job<>'MANAGER'
group by job
having sum(salary) >= 5000
order by 2 desc;

--그룹함수는 두번까지 중첩 가능
--부서별 평균 급여의 최고액
select round(max(avg(salary)))
from employee
group by dno;