drop table sale;
drop table charge;
drop table gas_order;
drop table cylinder_order;
drop table gas;
drop table cylinder;
drop table employee;
drop table payment;
drop table customer;
drop table station;
drop table base;
drop table enterprise;

create table enterprise(
    eno number(2) constraint enterprise_eno_pk primary key,
    ename varchar2(60) constraint enterprise_ename_nn not null,
    etel varchar2(20)
);
create table base(
    bno number(2) constraint base_bno_pk primary key,
    bname varchar2(60) constraint base_bname_nn not null,
    btel varchar2(20)
);
create table station(
    sno number(2) constraint station_sno_pk primary key,
    sname varchar2(60) constraint station_sname_nn not null,
    stel varchar2(20)
);
create table customer(
    cusno number(2) constraint customer_cusno_pk primary key,
    cname varchar2(60) constraint customer_cname_nn not null,
    ctel varchar2(20)
);
create table payment(
    pno number(2) constraint payment_pno_pk primary key,
    pday date constraint payment_pday_nn not null,
    psum number(7) constraint payment_psum_ not null
);
create table employee(
    eno number(2) constraint employee_eno_pk primary key,
    ename varchar2(20) constraint employee_ename_nn not null,
    job varchar2(30) constraint employee_job_nn not null,
    hiredate date constraint employee_hiredate_nn not null,
    etel varchar2(20) constraint employee_etel_nn not null,
    salary number(7) constraint employee_salary_nn not null,
    sno number(2) constraint employee_sno_fk references station
);
create table cylinder(
    cno number(2) constraint cylinder_cno_pk primary key,
    cvoluem number(3) constraint cylinder_cvoluem_nn not null,
    cprice number(6) constraint cylinder_cprice_nn not null,
    chave number(4) constraint cylinder_chave_nn not null,
    sno number(2) constraint cylinder_sno_fk references station
);
create table gas(
    gno number(2) constraint gas_gno_pk primary key,
    gname varchar2(30) constraint gas_gname_nn not null,
    gprice number(4) constraint gas_gprice_nn not null,
    ghave number(6) constraint gas_ghave_nn not null,
    sno number(2) constraint gas_sno_fk references station
);
create table cylinder_order(
    ocode number(2) constraint cylinder_order_ocode_pk primary key,
    oday date constraint cylinder_order_oday_nn not null,
    oname number(3) constraint cylinder_order_oname_nn not null,
    oquanity number(4) constraint cylinder_order_oquanity_nn not null,
    osum number(7) constraint cylinder_order_osum_nn not null,
    eno number(2) constraint cylinder_order_eno_fk references enterprise,
    sno number(2) constraint cylinder_order_sno_fk references station
);
create table gas_order(
    ocode number(2) constraint gas_order_ocode_pk primary key,
    oday date constraint gas_order_oday_nn not null,
    oname varchar2(20) constraint gas_order_oname_nn not null,
    oquanity number(5) constraint gas_order_oquanity_nn not null,
    osum number(8) constraint gas_order_osum_nn not null,
    bno number(2) constraint gas_order_bno_fk references base,
    sno number(2) constraint gas_order_sno_fk references station
);
create table charge(
    ccode number(2) constraint charge_ccode_pk primary key,
    cday date constraint charge_cday_nn not null,
    cvoluem number(3) constraint charge_cvoluem_nn not null,
    csum number(6) constraint charge_csum_nn not null,
    gno number(2) constraint charge_gno_fk references gas,
    cusno number(2) constraint charge_cusno_fk references customer
);
create table sale(
    scode number(2) constraint sale_scode_pk primary key,
    squantity number(3) constraint sale_squantity_nn not null,
    cno number(2) constraint sale_cno_fk references cylinder,
    pno number(2) constraint sale_pno_fk references payment,
    cusno number(2) constraint sale_cusno_fk references customer
);


drop sequence seq_enterprise;
drop sequence seq_base;
drop sequence seq_station;
drop sequence seq_customer;
drop sequence seq_payment;
drop sequence seq_employee;
drop sequence seq_cylinder;
drop sequence seq_gas;
drop sequence seq_cylinder_order;
drop sequence seq_gas_order;
drop sequence seq_charge;
drop sequence seq_sale;

create sequence seq_enterprise
start with 1
increment by 1;
create sequence seq_base
start with 1
increment by 1;
create sequence seq_station
start with 1
increment by 1;
create sequence seq_customer
start with 1
increment by 1;
create sequence seq_payment
start with 1
increment by 1;
create sequence seq_employee
start with 1
increment by 1;
create sequence seq_cylinder
start with 1
increment by 1;
create sequence seq_gas
start with 1
increment by 1;
create sequence seq_cylinder_order
start with 1
increment by 1;
create sequence seq_gas_order
start with 1
increment by 1;
create sequence seq_charge
start with 1
increment by 1;
create sequence seq_sale
start with 1
increment by 1;