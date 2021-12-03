create table department(
    dno number(2) constraint department_dno_pk primary key,
    dname varchar2(20) constraint dpartent_dname_nn not null,
    loc varchar2(20)
);

create table employee(
    eno number(4) constraint employee_eno_pk primary key,
    ename varchar2(20) constraint dpartent_dname_nn not null,
    job varchar2(20),
    manager number(4),
    hiredate date,
    salary number(10),
    commission number(10),
    dno number(2) constraint employee_dno_fk references department
);

create sequence seq_base
start with 1
increment by 1;
create sequence seq_bowl
start with 1
increment by 1;
create sequence seq_buy
start with 1
increment by 1;
create sequence seq_charge
start with 1
increment by 1;
create sequence seq_customer
start with 1
increment by 1;
create sequence seq_employee
start with 1
increment by 1;
create sequence seq_gas
start with 1
increment by 1;
create sequence seq_payment
start with 1
increment by 1;
create sequence seq_sale
start with 1
increment by 1;
create sequence seq_station
start with 1
increment by 1;