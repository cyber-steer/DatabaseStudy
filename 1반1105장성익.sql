--ch06 ���̺� �����ϱ�  ����-�˻� ������ �������� ������ �˻��� ������ ����
--equl join
select *
from employee, department
where employee.dno = department.dno;

select e.ename, d.dname -- �������������� ��������� ����
from employee e, department d --as ��� �Ұ�
where e.dno = d.dno -- ��������
and d.dname = 'SALES';

--�Ϲ����� ���� ���
select e.eno, e.ename, d.dname, d.dno
from employee e, department d
where e.dno = d.dno -- ��������
and e.eno = 7788; -- �˻�����

--natural join �ΰ��� ���̺��� ���� Į������ ã�� ��Ī ( �ӵ� ����)
select e.eno, e.ename, d.dname, dno-- natural join�� ���������� ��Ī ��� �Ұ�
from employee e natural join department d 
where e.eno = 7788; -- �˻�����

--join ~ using
select e.eno, e.ename, d.dname, dno-- join ~ using �� ���������� ��Ī ��� �Ұ�
from employee e join department d
using (dno) -- ��������
where e.eno = 7788; -- �˻�����

--join ~ on (�������δ� ���� ����) �˻��� ����
select e.eno, e.ename, d.dname, d.dno
from employee e join department d
on e.dno = d.dno -- ��������
where e.eno = 7788; -- �˻�����

--non-equl join
--������� �޿� ��� �˻�
select e.ename, e.salary, s.grade
from employee e, salgrade s
where e.salary between s.losal and s.hisal; --��������

select e.ename, e.salary, s.grade
from employee e join salgrade s
on e.salary between s.losal and s.hisal; --��������

--����� �̸�, �μ� �̸�, �޿� ��� �˻�
select e.ename, d.dname, e.salary, s.grade
from employee e, department d, salgrade s
where e.dno = d.dno --��������
and e.salary between s.losal and s.hisal; --��������

select e.ename, d.dname, e.salary, s.grade --���� �� ����
from employee e join department d
on e.dno = d.dno --��������
join salgrade s
on e.salary between s.losal and s.hisal; --��������

--self join
--����̸��� ���ӻ���̸� �˻�
select e.ename ����̸�, m.ename as ���ӻ���̸�
from employee e, employee m --�����Ǿ���ϴ� ��Ī �ʼ�
where e.manager = m.eno;

select e.ename ����̸�, m.ename as ���ӻ���̸�
from employee e join employee m --�����Ǿ���ϴ� ��Ī �ʼ�
on e.manager = m.eno;

--outer join --������ ������ �ִٴ� �ǹ̰� �ɼ��� �ִ� ���ɿ������� ����������ؾ� �ȴ�
--����̸��� ���ӻ���̸� �˻�, null�� ���� --�Ϲ� �������δ� �Ұ�
select e.ename ����̸�, m.ename as ���ӻ���̸�
from employee e left outer join employee m --�����Ǿ���ϴ� ��Ī �ʼ�
on e.manager = m.eno;

--ȥ�� �غ���
--1�� equl ������ ��� scott ����� �μ���ȣ�� �μ��̸� ���
select employee.ename, department.dname
from employee, department
where employee.dno = department.dno
and employee.ename = 'SCOTT';

--2�� join on ��� ����̸�, �Ҽӵ� �μ� ������
select employee.ename, department.dname, department.loc
from employee join department
on employee.dno = department.dno;

--3�� join using ���� 10���μ��� ���ϴ� �������� ��������� �μ��� �������� �������
select dno, employee.job, department.loc
from employee join department
using (dno)
where dno = 10;

--4�� natural join Ŀ�̼��� �޴� ����� �̸�,�μ��̸�,�������� ���
select employee.ename, department.dname, department.loc
from employee natural join department
where employee.commission is not null;

--5�� 



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