---1��
select e.ename, e.dno, d.dname
from employee e, department d
where e.dno = d.dno
and e.ename = 'SCOTT';

--2��
select e.ename, d.dname, d.loc
from employee e join department d
on e.dno = d.dno;

--3��
select dno, e.job, d.loc
from employee e join department d
using(dno)
where dno = 10;

--4��
select e.ename, d.dname, loc
from employee e natural join department d
where loc = 'CHICAGO'
and commission>0;

--5��
select e.ename, d.dname
from employee e, department d
where e.dno = d.dno
and e.ename like '%A%';

--6��
select ename, job, dno, dname
from employee e natural join department d
where loc = 'NEW YORK';

--8��
select e.eno, e.ename as "employee", e.manager as "EMP#", m.eno as "Manager", m.ename as "Mgr#"
from employee e left outer join employee m
on e.manager = m.eno
order by e.eno desc;

--9��
select e.ename as �̸�, e.dno as �μ���ȣ, d.ename as ����
from employee e join employee d
on e.dno = d.dno
where e.ename = 'SCOTT'
and not d.ename = 'SCOTT';

--10��
select d.ename, d.hiredate
from employee e join employee d
on e.hiredate < d.hiredate
where e.ename = 'WARD'
order by 2;

--11��
select e.ename, e.hiredate, d.ename, d.hiredate
from employee e join employee d
on e.hiredate < d.hiredate
and e.manager = d.eno;

--