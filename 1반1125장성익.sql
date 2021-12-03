--ch09. ������ ���۰� Ʈ�����
--���̺� ������ �߰��ϴ� insert��
create table dept2
as
select *
from department
where 0 =1;

insert into dept2
values(10, 'ACCOUNTTING', 'NEW YORK');

insert into dept2(dno, loc, dname)
values(20, 'DALLAS', 'RESERCH');

insert into dept2(dno, dname)
values(30, 'SALES');

insert into dept2
values(40, 'Operattions',null);

--��¥ ������ �Է��ϱ�
create table emp3
as
select eno, ename, job, hiredate, dno
from employee
where 0=1;

insert into emp3
values(7000, 'CANDY', 'MANAGER', '2021/11/25',10);

insert into emp3
values(7010, 'TOM', 'MANAGER', '2021, 11, 25', 20);


insert into emp3
values(7010, 'TOM', 'MANAGER', to_date('2021, 11, 25', 'yyyy, mm, dd'), 20);

insert into emp3
values(7020, 'JERRY', 'SALESMAN', sysdate, 30);

select *
from emp3;

--�ٸ� ���̺��� ���̤��� �����ϱ�
insert into dept2
select * from department;

--���̺��� ������ �����ϴ� update��
update dept2
set dname='PROGRAMMING'
where dno=10;

update dept2
set dname='AAA',loc='SEOUL'
where dno=10;

--10�μ��� �������� 20�μ��� ���������� ����
update dept2
set loc=(select loc
        from dept2
        where dno=20)
where dno=10;

--10�μ��� �μ���� ������� 30�μ��� �μ���� ���������� ����
update dept2
set dname = (select dname
            from dept2
            where dno=30),
    loc = (select loc
            from dept2
            where dno=30)
where dno=10;

update dept2
set (dname, loc) = (select dname, loc
                     from dept2
                     where dno=30)
where dno=10;

--���̺��� ������ �����ϴ� delete��
delete dept2
where dno=10;

--������ �ٹ��ϴ� ����� ��� ����
delete dept2
where dno = (select dno
            from dept2
            where dname='SALES');
            
delete dept2;

--ch12. �������� �ε���
--�Ϸù�ȣ�� �ڵ����� �����ϴ� ������
--������ ����
create sequence seq_dept3
start with 10
increment by 10;

--�������� �⺻Ű�� �����ϱ�
insert into dept3
values (seq_dept3.nextval, 'BBB', 'BBB');

--������ �����ϱ�
drop sequence seq_dept3;