--4�� ȥ���غ���
--6�� ������� ���ӻ���� ����� ���
-- ���ӻ���� ���� ��� null ��� 0���� ���
select eno, ename, nvl(manager, 0), nvl2(manager, manager, 0)
from employee;

--7�� ���޿� ���� �޿��� �λ�
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

--5�� �׷��Լ�
--������� �޿� �Ѿ�, ��վ�, �ְ��, �ּҾ� �˻�
select sum(salary), round(avg(salary),1), max(salary), min(salary)
from employee;

--���� �ֱٿ� �Ի��� ����� ���� �������� �Ի��� ����� �Ի��� �˻�
select max(hiredate), min(hiredate)
from employee;

--Ŀ�̼��� �Ѿ� �˻� - �׷��Լ��� �ٸ� �����ڿ� �޸� null ���� ������.
select sum(commission)
from employee;

--��ü ��� �� ���ϱ�
select count(*)
from employee;

--Ŀ�̼��� �� �� �ִ� ��� �� ���ϱ�
select count(commission)
from employee;

--���� ������ ���� ���ϱ�
select count(distinct job)
from employee;

--�޿��� �Ѿ� ���ϱ� - �������� �˻��Ҷ� ���� ������ ������ ���ƾ���
--select ename, max(salary)
select max(salary)
from employee;

--group by : Ư�� Į���� �������� �׷��� ���� �� ���
--�μ��� ��� �޿� �˻�
select dno, round(avg(salary))
from employee
group by dno
order by 2 desc;

--�μ���, ���޺� ��� �޿� �˻�
select dno, job, count(*), round(avg(salary))
from employee
group by dno, job
order by dno asc, 3 desc;

--having : �׷� ��� ���� - ~�� �� group by
--�μ��� �޿��� �ְ�� �˻�, �ְ���� 3000 �̻�
select dno, max(salary)
from employee
--where max(salary) >= 3000 - ���� �׷��Լ����� where ��� having �̿�
group by dno
having max(salary) >= 3000
order by dno;

--���޺� �޿� �Ѿ� �˻�, �Ѿ��� 5000�̻�, MANAGER�� ����
select job, sum(salary)
from employee
where job<>'MANAGER'
group by job
having sum(salary) >= 5000
order by 2 desc;

--�׷��Լ��� �ι����� ��ø ����
--�μ��� ��� �޿��� �ְ��
select round(max(avg(salary)))
from employee
group by dno;