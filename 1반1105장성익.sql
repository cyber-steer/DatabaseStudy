--ch06 테이블 조인하기  조인-검색 조인은 성능으로 안좋음 검색후 조인이 빠름
--equl join
select *
from employee, department
where employee.dno = department.dno;

select e.ename, d.dname -- 생략가능하지만 명시적으로 선언
from employee e, department d --as 사용 불가
where e.dno = d.dno -- 조인조건
and d.dname = 'SALES';

--일반적인 조인 방법
select e.eno, e.ename, d.dname, d.dno
from employee e, department d
where e.dno = d.dno -- 조인조건
and e.eno = 7788; -- 검색조건

--natural join 두개의 테이블중 같은 칼럼명을 찾아 매칭 ( 속도 느림)
select e.eno, e.ename, d.dname, dno-- natural join은 조인조건의 별칭 사용 불가
from employee e natural join department d 
where e.eno = 7788; -- 검색조건

--join ~ using
select e.eno, e.ename, d.dname, dno-- join ~ using 은 조인조건의 별칭 사용 불가
from employee e join department d
using (dno) -- 조인조건
where e.eno = 7788; -- 검색조건

--join ~ on (성능으로는 제일 빠름) 검색후 조인
select e.eno, e.ename, d.dname, d.dno
from employee e join department d
on e.dno = d.dno -- 조인조건
where e.eno = 7788; -- 검색조건

--non-equl join
--사원별로 급여 등급 검색
select e.ename, e.salary, s.grade
from employee e, salgrade s
where e.salary between s.losal and s.hisal; --조인조건

select e.ename, e.salary, s.grade
from employee e join salgrade s
on e.salary between s.losal and s.hisal; --조인조건

--사원의 이름, 부서 이름, 급여 등급 검색
select e.ename, d.dname, e.salary, s.grade
from employee e, department d, salgrade s
where e.dno = d.dno --조인조건
and e.salary between s.losal and s.hisal; --조인조건

select e.ename, d.dname, e.salary, s.grade --조인 후 조인
from employee e join department d
on e.dno = d.dno --조인조건
join salgrade s
on e.salary between s.losal and s.hisal; --조인조건

--self join
--사원이름과 직속상관이름 검색
select e.ename 사원이름, m.ename as 직속상관이름
from employee e, employee m --구별되어야하니 별칭 필수
where e.manager = m.eno;

select e.ename 사원이름, m.ename as 직속상관이름
from employee e join employee m --구별되어야하니 별칭 필수
on e.manager = m.eno;

--outer join --설계의 문제가 있다는 의미가 될수도 있다 성능에안좋고 사용을지양해야 된다
--사원이름과 직속상관이름 검색, null도 포함 --일반 조인으로는 불가
select e.ename 사원이름, m.ename as 직속상관이름
from employee e left outer join employee m --구별되어야하니 별칭 필수
on e.manager = m.eno;

--혼자 해보기
--1번 equl 조인을 사용 scott 사원의 부서번호와 부서이름 출력
select employee.ename, department.dname
from employee, department
where employee.dno = department.dno
and employee.ename = 'SCOTT';

--2번 join on 사용 사원이름, 소속된 부서 지역명
select employee.ename, department.dname, department.loc
from employee join department
on employee.dno = department.dno;

--3번 join using 연산 10번부서에 속하는 담당업무의 고유목록을 부서의 지역명을 포함출력
select dno, employee.job, department.loc
from employee join department
using (dno)
where dno = 10;

--4번 natural join 커미션을 받는 사원의 이름,부서이름,지역명을 출력
select employee.ename, department.dname, department.loc
from employee natural join department
where employee.commission is not null;

--5번 



---1번
select e.ename, e.dno, d.dname
from employee e, department d
where e.dno = d.dno
and e.ename = 'SCOTT';

--2번
select e.ename, d.dname, d.loc
from employee e join department d
on e.dno = d.dno;

--3번
select dno, e.job, d.loc
from employee e join department d
using(dno)
where dno = 10;

--4번
select e.ename, d.dname, loc
from employee e natural join department d
where loc = 'CHICAGO'
and commission>0;

--5번
select e.ename, d.dname
from employee e, department d
where e.dno = d.dno
and e.ename like '%A%';

--6번
select ename, job, dno, dname
from employee e natural join department d
where loc = 'NEW YORK';

--8번
select e.eno, e.ename as "employee", e.manager as "EMP#", m.eno as "Manager", m.ename as "Mgr#"
from employee e left outer join employee m
on e.manager = m.eno
order by e.eno desc;

--9번
select e.ename as 이름, e.dno as 부서번호, d.ename as 동료
from employee e join employee d
on e.dno = d.dno
where e.ename = 'SCOTT'
and not d.ename = 'SCOTT';

--10번
select d.ename, d.hiredate
from employee e join employee d
on e.hiredate < d.hiredate
where e.ename = 'WARD'
order by 2;

--11번
select e.ename, e.hiredate, d.ename, d.hiredate
from employee e join employee d
on e.hiredate < d.hiredate
and e.manager = d.eno;

--