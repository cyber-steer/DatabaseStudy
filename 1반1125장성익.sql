--ch09. 데이터 조작과 트랙잭션
--테이블에 내용을 추가하는 insert문
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

--날짜 데이터 입력하기
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

--다른 테이블에서 데이ㅣ터 복사하기
insert into dept2
select * from department;

--테이블의 내용을 수정하는 update문
update dept2
set dname='PROGRAMMING'
where dno=10;

update dept2
set dname='AAA',loc='SEOUL'
where dno=10;

--10부서의 지역명을 20부서의 지역명으로 변경
update dept2
set loc=(select loc
        from dept2
        where dno=20)
where dno=10;

--10부서의 부서명과 지경명을 30부서의 부서명과 지역명으로 변경
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

--테이블의 내용을 삭제하는 delete문
delete dept2
where dno=10;

--영업부 근무하는 사원을 모두 삭제
delete dept2
where dno = (select dno
            from dept2
            where dname='SALES');
            
delete dept2;

--ch12. 시퀀스와 인덱스
--일련번호를 자동으로 생성하는 시퀀스
--시퀀스 생성
create sequence seq_dept3
start with 10
increment by 10;

--시퀀스를 기본키에 접목하기
insert into dept3
values (seq_dept3.nextval, 'BBB', 'BBB');

--시퀀스 제거하기
drop sequence seq_dept3;