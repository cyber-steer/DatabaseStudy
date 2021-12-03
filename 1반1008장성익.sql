--5�� �׷��Լ� ȥ���غ���
--1�� �޿� �ְ��, ������, �Ѿ�, ��վ� ����ϱ�
--����� ������ �ݿø�
select max(salary)as Maximum, min(salary)as Minimum, 
            sum(salary)as Sum, round(avg(salary),0)as Aberage
from employee;

--2�� ������(����) �������� �ְ��, ������, �Ѿ�, ��վ� ����ϱ�
--��Ī �����ϰ� �ϰ�, ����� ������ �ݿø�
select job, max(salary)as Maximum, min(salary)as Minimum, 
            sum(salary)as Sum, round(avg(salary),0)as Aberage
from employee
group by job;

--3�� ������(����)�� ����� ���ϱ�
select job, count(*)
from employee
group by job;

--4�� ���ӻ���� �˰� �ִ� ����� �� ���ϱ�
select count(manager)
from employee;

--5�� �޿��� �ְ�װ� ������ ���� ���ϱ�
select max(salary)- min(salary) as difference
from employee;

--6�� ���޺� ����� ������ ���ϱ�
-- ���� �޿��� 2000�̸��� �����ϰ�, �޿��� ���� ������������ ����
select job, min(salary)
from employee
group by job
having min(salary) >= 2000
order by 2 desc;

--7�� �� �μ��� ���� �μ���ȣ, �����, �μ� ���� ��� ����� ��� �޿� ���ϱ�
-- ��� �޿��� �Ҽ��� ��° �ڸ��� �ݿø�
select dno, count(*)as "Number of People", round(avg(salary),2)as salary --"��Ī" , '��'
from employee
group by dno
order by dno;
--8�� �� �μ��� ���� �μ���ȣ �̸�, ������, �����, �μ����� ��� ����� ��� �޿� ���ϱ�
-- ��Ī �����ϰ� �ϰ�, ��� �޿��� ������ �ݿø�
select decode(dno, 10 , 'ACCOUNTING',
                   20, 'RESEARCH',
                   30, 'SALES',
                   40, 'OPERATIONS')as dname,
       decode(dno, 10 , 'NEW YORK',
                   20, 'DALLAS',
                   30, 'CHICAGO',
                   40, 'BOSTON')as location,
        count(*), round(avg(salary))
from employee
group by dno;

--9�� ������ ǥ���� ���� �ش� ���޿� ���� �μ���ȣ�� �޿�, �μ� 10,20,30�� �޿� �Ѿ� ���ϱ�
-- ��Ī ���̶��� �ϱ�
select job, dno,
        decode(dno, 10, sum(salary)) as "�μ� 10",
        decode(dno, 20, sum(salary)) as "�μ� 20",
        decode(dno, 30, sum(salary)) as "�μ� 30",
        sum(salary) as �Ѿ�
from employee
group by job, dno
order by dno;