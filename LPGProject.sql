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
    stel varchar2(20),
    ptank number(6) constraint station_ptank_nn not null,
    btank number(6) constraint station_btank_nn not null
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
    cno number(3) constraint cylinder_cno_pk primary key,
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

insert into enterprise values (seq_enterprise.nextval, '(��)�ѱ�������', '1577-4625');
insert into enterprise values (seq_enterprise.nextval, '(��)ȭ�ν���', '031-797-3643');
insert into enterprise values (seq_enterprise.nextval, '(��)����ũ', '043-534-2386');
insert into enterprise values (seq_enterprise.nextval, '��ȭ����', '062-955-4445');

insert into base values (seq_base.nextval,'���ñ�������','031) 680-3103');
insert into base values (seq_base.nextval,'��õ��������','032) 810-4502');
insert into base values (seq_base.nextval,'�뿵��������','055) 640-6104');
insert into base values (seq_base.nextval,'��ô��������','033) 571-4000');
insert into base values (seq_base.nextval,'������������','02) 2657-1114');
insert into base values (seq_base.nextval,'��õ��������','032) 453-6700');
insert into base values (seq_base.nextval,'�����������','031) 400-7204');
insert into base values (seq_base.nextval,'������������','033) 760-6605');
insert into base values (seq_base.nextval,'��������û��������','042) 229-3403');
insert into base values (seq_base.nextval,'������������','063) 850-3800');
insert into base values (seq_base.nextval,'���֡�������������','062) 950-1114');
insert into base values (seq_base.nextval,'�뱸�������������','053) 850-1900');
insert into base values (seq_base.nextval,'�λꡤ�泲��������','055) 330-7700');
insert into base values (seq_base.nextval,'����LNG����','064) 766-3600');

insert into station values(seq_station.nextval, '(��)�ؿ�', '051-528-1133', 50000,50000);
insert into station values(seq_station.nextval, '�ѱ��������(��)', '051-635-3131', 30000,30000);
insert into station values(seq_station.nextval, '(��)�Ｚ������', '051-555-3104', 50000,50000);
insert into station values(seq_station.nextval, '�ѱ����������(��)', '051-722-5152', 50000,50000);
insert into station values(seq_station.nextval, '�����̿�����(��)', '010-2727-2627', 80000,80000);
insert into station values(seq_station.nextval, '(��)MS����', '051-317-2301', 50000,50000);
insert into station values(seq_station.nextval, '���Ű���(��)', '051-311-0131', 50000,50000);
insert into station values(seq_station.nextval, '�ѱ��������(��)��󿵾���', '051-326-3131', 50000,50000);
insert into station values(seq_station.nextval, '�뼺���(��)�λ�뼺������', '051-303-4747', 80000,80000);
insert into station values(seq_station.nextval, '�ص���ȭ(��)', '051-320-8500', 30000,30000);
insert into station values(seq_station.nextval, '�������(��)�帲������', '051-263-3131', 50000,50000);
insert into station values(seq_station.nextval, '(��)�ż������� ��������������', '051-206-3326', 50000,50000);
insert into station values(seq_station.nextval, '(��)�ű�������', '051-248-7365', 100000,100000);
insert into station values(seq_station.nextval, '�̿� �ؿ��LPG������', '051-704-9196', 50000,50000);

insert into customer values(seq_customer.nextval, '�λ굵�ð���', '051-607-1234');
insert into customer values(seq_customer.nextval, '���ϰ���', '051-311-0400');
insert into customer values(seq_customer.nextval, '�������', '051-322-5327');
insert into customer values(seq_customer.nextval, '�泲���հ������', '051-852-1300');
insert into customer values(seq_customer.nextval, '�ص�����', '0507-1493-5960');
insert into customer values(seq_customer.nextval, 'PSG', '051-790-0900');
insert into customer values(seq_customer.nextval, '��������', '051-643-2255');
insert into customer values(seq_customer.nextval, '�����������', '051-727-6601');
insert into customer values(seq_customer.nextval, 'MS����', '051-317-2301');
insert into customer values(seq_customer.nextval, 'õ���������', '051-728-3355');
insert into customer values(seq_customer.nextval, '���ϰ���', '0507-1356-7720');
insert into customer values(seq_customer.nextval, '�������հ���', '051-721-6763');
insert into customer values(seq_customer.nextval, '���������� ����', '051-271-1444');
insert into customer values(seq_customer.nextval, '�ѱ��������', '051-201-1611');
insert into customer values(seq_customer.nextval, 'BK��������', '051-702-0472');
insert into customer values(seq_customer.nextval, 'ȭ�°�����ũ', '051-264-2080');
insert into customer values(seq_customer.nextval, '���ϰ���', '051-802-9826');
insert into customer values(seq_customer.nextval, '�������ð���', '1899-8448');
insert into customer values(seq_customer.nextval, '���鰡��������', '0507-1422-8888');
insert into customer values(seq_customer.nextval, '���簡�����', '051-721-6838');
insert into customer values(seq_customer.nextval, '������հ���', '051-809-1199');
insert into customer values(seq_customer.nextval, '�������հ���', '051-412-3104');
insert into customer values(seq_customer.nextval, '��õ����', '051-621-3036');
insert into customer values(seq_customer.nextval, '���Ż������', '051-327-2261');
insert into customer values(seq_customer.nextval, 'ũ������', '051-831-1190');

insert into payment values(seq_payment.nextval, '2010-10-08', 836000);
insert into payment values(seq_payment.nextval, '2017-10-25', 572000);
insert into payment values(seq_payment.nextval, '2016-06-23', 508000);
insert into payment values(seq_payment.nextval, '2011-04-02', 684000);
insert into payment values(seq_payment.nextval, '2014-10-25', 760000);
insert into payment values(seq_payment.nextval, '2012-03-10', 596000);
insert into payment values(seq_payment.nextval, '2009-11-21', 864000);
insert into payment values(seq_payment.nextval, '2011-01-24', 676000);
insert into payment values(seq_payment.nextval, '2013-10-18', 247000);
insert into payment values(seq_payment.nextval, '2016-12-30', 178000);
insert into payment values(seq_payment.nextval, '2009-12-07', 425000);
insert into payment values(seq_payment.nextval, '2010-08-10', 944000);
insert into payment values(seq_payment.nextval, '2015-08-10', 851000);
insert into payment values(seq_payment.nextval, '2009-12-03', 918000);
insert into payment values(seq_payment.nextval, '2012-07-06', 790000);
insert into payment values(seq_payment.nextval, '2013-03-10', 449000);
insert into payment values(seq_payment.nextval, '2011-04-12', 594000);
insert into payment values(seq_payment.nextval, '2009-07-20', 390000);
insert into payment values(seq_payment.nextval, '2018-03-20', 813000);
insert into payment values(seq_payment.nextval, '2012-02-21', 770000);
insert into payment values(seq_payment.nextval, '2010-04-14', 507000);
insert into payment values(seq_payment.nextval, '2013-08-13', 593000);
insert into payment values(seq_payment.nextval, '2009-05-31', 693000);
insert into payment values(seq_payment.nextval, '2014-03-08', 367000);
insert into payment values(seq_payment.nextval, '2015-06-11', 713000);
insert into payment values(seq_payment.nextval, '2009-07-31', 837000);
insert into payment values(seq_payment.nextval, '2017-09-17', 785000);
insert into payment values(seq_payment.nextval, '2011-07-08', 529000);
insert into payment values(seq_payment.nextval, '2015-08-10', 755000);
insert into payment values(seq_payment.nextval, '2011-03-11', 631000);

insert into employee values
(seq_employee.nextval, '������','���','2013-05-02','010-9715-3669',5000000,1);
insert into employee values
(seq_employee.nextval, '������','���','2013-05-02','010-1044-7758',3000000,1);
insert into employee values
(seq_employee.nextval, 'Ȳ��ö','���','2012-04-02','010-1990-2215',2500000,1);
insert into employee values
(seq_employee.nextval, '������','���','2017-05-31','010-1393-1794',2000000,1);
insert into employee values
(seq_employee.nextval, 'Ȳ���¿�','���','2014-06-08','010-1682-6467',5000000,2);
insert into employee values
(seq_employee.nextval, '�輼��','���','2014-03-16','010-6852-8199',3000000,2);
insert into employee values
(seq_employee.nextval, '������','���','2009-07-27','010-9559-1594',2500000,2);
insert into employee values
(seq_employee.nextval, '������','���','2012-10-17','010-5767-8847',2000000,2);
insert into employee values
(seq_employee.nextval, '������','���','2017-03-17','010-7746-7252',5000000,3);
insert into employee values
(seq_employee.nextval, '�̿���','���','2014-10-05','010-1187-8120',3000000,3);
insert into employee values
(seq_employee.nextval, '������','���','2014-08-06','010-2902-9937',2500000,3);
insert into employee values
(seq_employee.nextval, '����ȣ��','���','2015-11-27','010-7698-9665',2000000,3);
insert into employee values
(seq_employee.nextval, '������','���','2009-11-16','010-1237-3248',5000000,4);
insert into employee values
(seq_employee.nextval, '������','���','2013-08-08','010-3803-4062',3000000,4);
insert into employee values
(seq_employee.nextval, 'ǥ����','���','2011-01-13','010-8905-4846',2500000,4);
insert into employee values
(seq_employee.nextval, '�߼���','���','2010-04-25','010-6185-8736',2000000,4);
insert into employee values
(seq_employee.nextval, '�ſ���','���','2010-10-20','010-1637-5177',5000000,5);
insert into employee values
(seq_employee.nextval, '�ɱ��','���','2018-04-13','010-1360-6382',3000000,5);
insert into employee values
(seq_employee.nextval, 'Ȳ����','���','2010-06-01','010-2231-4598',2500000,5);
insert into employee values
(seq_employee.nextval, '������','���','2014-08-16','010-2569-7794',2000000,5);
insert into employee values
(seq_employee.nextval, '�Ͽ���','���','2013-05-14','010-8175-8316',5000000,6);
insert into employee values
(seq_employee.nextval, '�ǽ½�','���','2016-05-16','010-4682-7440',3000000,6);
insert into employee values
(seq_employee.nextval, '���ü���','���','2015-04-03','010-1270-7881',2500000,6);
insert into employee values
(seq_employee.nextval, '������','���','2011-12-20','010-8289-4218',2000000,6);
insert into employee values
(seq_employee.nextval, '������','���','2012-12-03','010-2820-9209',5000000,7);
insert into employee values
(seq_employee.nextval, '������','���','2015-10-31','010-4091-1362',3000000,7);
insert into employee values
(seq_employee.nextval, '����','���','2013-05-16','010-1603-4623',2500000,7);
insert into employee values
(seq_employee.nextval, '����ȣ','���','2009-02-06','010-6547-2645',2000000,7);
insert into employee values
(seq_employee.nextval, '������','���','2012-04-29','010-6315-1146',5000000,8);
insert into employee values
(seq_employee.nextval, '�������','���','2009-09-11','010-9179-2330',3000000,8);
insert into employee values
(seq_employee.nextval, '����ȣ','���','2013-10-17','010-7293-3592',2500000,8);
insert into employee values
(seq_employee.nextval, 'Ź��ö','���','2009-02-13','010-7646-2340',2000000,8);
insert into employee values
(seq_employee.nextval, '�̱�ö','���','2010-09-20','010-1461-7391',5000000,9);
insert into employee values
(seq_employee.nextval, '������','���','2010-09-01','010-5264-8046',3000000,9);
insert into employee values
(seq_employee.nextval, '����ȯ','���','2011-11-16','010-3483-8935',2500000,9);
insert into employee values
(seq_employee.nextval, '���ü���','���','2012-02-27','010-2881-4744',2000000,9);
insert into employee values
(seq_employee.nextval, '������','���','2015-04-09','010-9954-6542',5000000,10);
insert into employee values
(seq_employee.nextval, '�ֱ���','���','2012-09-22','010-2333-3437',3000000,10);
insert into employee values
(seq_employee.nextval, '�ϴ���','���','2018-02-10','010-6040-6378',2500000,10);
insert into employee values
(seq_employee.nextval, '������','���','2012-01-18','010-7232-5864',2000000,10);

insert into cylinder values(seq_cylinder.nextval, 3, 16200, 0, 1);
insert into cylinder values(seq_cylinder.nextval, 5, 23700, 2, 1);
insert into cylinder values(seq_cylinder.nextval, 10, 37200, 1, 1);
insert into cylinder values(seq_cylinder.nextval, 13, 37700, 11, 1);
insert into cylinder values(seq_cylinder.nextval, 20, 49100, 141, 1);
insert into cylinder values(seq_cylinder.nextval, 50, 60300, 13, 1);
insert into cylinder values(seq_cylinder.nextval, 100, 510000, 0, 1);
insert into cylinder values(seq_cylinder.nextval, 185, 780000, 1, 1);
insert into cylinder values(seq_cylinder.nextval, 200, 850000, 0, 1);
insert into cylinder values(seq_cylinder.nextval, 3, 23600, 2, 2);
insert into cylinder values(seq_cylinder.nextval, 5, 26500, 0, 2);
insert into cylinder values(seq_cylinder.nextval, 10, 30100, 0, 2);
insert into cylinder values(seq_cylinder.nextval, 13, 35800, 5, 2);
insert into cylinder values(seq_cylinder.nextval, 20, 42900, 117, 2);
insert into cylinder values(seq_cylinder.nextval, 50, 61200, 11, 2);
insert into cylinder values(seq_cylinder.nextval, 100, 430000, 2, 2);
insert into cylinder values(seq_cylinder.nextval, 185, 660000, 0, 2);
insert into cylinder values(seq_cylinder.nextval, 200, 940000, 1, 2);
insert into cylinder values(seq_cylinder.nextval, 3, 16900, 2, 3);
insert into cylinder values(seq_cylinder.nextval, 5, 25200, 2, 3);
insert into cylinder values(seq_cylinder.nextval, 10, 35900, 0, 3);
insert into cylinder values(seq_cylinder.nextval, 13, 40000, 10, 3);
insert into cylinder values(seq_cylinder.nextval, 20, 44300, 104, 3);
insert into cylinder values(seq_cylinder.nextval, 50, 69000, 16, 3);
insert into cylinder values(seq_cylinder.nextval, 100, 590000, 2, 3);
insert into cylinder values(seq_cylinder.nextval, 185, 710000, 1, 3);
insert into cylinder values(seq_cylinder.nextval, 200, 890000, 1, 3);
insert into cylinder values(seq_cylinder.nextval, 3, 20000, 2, 4);
insert into cylinder values(seq_cylinder.nextval, 5, 23200, 2, 4);
insert into cylinder values(seq_cylinder.nextval, 10, 26600, 0, 4);
insert into cylinder values(seq_cylinder.nextval, 13, 40100, 9, 4);
insert into cylinder values(seq_cylinder.nextval, 20, 40300, 189, 4);
insert into cylinder values(seq_cylinder.nextval, 50, 53300, 19, 4);
insert into cylinder values(seq_cylinder.nextval, 100, 450000, 1, 4);
insert into cylinder values(seq_cylinder.nextval, 185, 730000, 0, 4);
insert into cylinder values(seq_cylinder.nextval, 200, 940000, 0, 4);
insert into cylinder values(seq_cylinder.nextval, 3, 23000, 2, 5);
insert into cylinder values(seq_cylinder.nextval, 5, 23900, 0, 5);
insert into cylinder values(seq_cylinder.nextval, 10, 32600, 0, 5);
insert into cylinder values(seq_cylinder.nextval, 13, 38300, 13, 5);
insert into cylinder values(seq_cylinder.nextval, 20, 41200, 163, 5);
insert into cylinder values(seq_cylinder.nextval, 50, 55200, 12, 5);
insert into cylinder values(seq_cylinder.nextval, 100, 570000, 0, 5);
insert into cylinder values(seq_cylinder.nextval, 185, 670000, 1, 5);
insert into cylinder values(seq_cylinder.nextval, 200, 850000, 1, 5);
insert into cylinder values(seq_cylinder.nextval, 3, 23700, 2, 6);
insert into cylinder values(seq_cylinder.nextval, 5, 29500, 1, 6);
insert into cylinder values(seq_cylinder.nextval, 10, 38300, 1, 6);
insert into cylinder values(seq_cylinder.nextval, 13, 40900, 10, 6);
insert into cylinder values(seq_cylinder.nextval, 20, 42400, 159, 6);
insert into cylinder values(seq_cylinder.nextval, 50, 51900, 15, 6);
insert into cylinder values(seq_cylinder.nextval, 100, 420000, 0, 6);
insert into cylinder values(seq_cylinder.nextval, 185, 750000, 2, 6);
insert into cylinder values(seq_cylinder.nextval, 200, 830000, 0, 6);
insert into cylinder values(seq_cylinder.nextval, 3, 15600, 1, 7);
insert into cylinder values(seq_cylinder.nextval, 5, 24900, 1, 7);
insert into cylinder values(seq_cylinder.nextval, 10, 39900, 1, 7);
insert into cylinder values(seq_cylinder.nextval, 13, 40100, 7, 7);
insert into cylinder values(seq_cylinder.nextval, 20, 49700, 130, 7);
insert into cylinder values(seq_cylinder.nextval, 50, 53900, 14, 7);
insert into cylinder values(seq_cylinder.nextval, 100, 530000, 0, 7);
insert into cylinder values(seq_cylinder.nextval, 185, 690000, 1, 7);
insert into cylinder values(seq_cylinder.nextval, 200, 800000, 0, 7);
insert into cylinder values(seq_cylinder.nextval, 3, 18000, 2, 8);
insert into cylinder values(seq_cylinder.nextval, 5, 24900, 2, 8);
insert into cylinder values(seq_cylinder.nextval, 10, 29700, 0, 8);
insert into cylinder values(seq_cylinder.nextval, 13, 34500, 7, 8);
insert into cylinder values(seq_cylinder.nextval, 20, 43600, 156, 8);
insert into cylinder values(seq_cylinder.nextval, 50, 57100, 14, 8);
insert into cylinder values(seq_cylinder.nextval, 100, 430000, 2, 8);
insert into cylinder values(seq_cylinder.nextval, 185, 600000, 2, 8);
insert into cylinder values(seq_cylinder.nextval, 200, 800000, 1, 8);
insert into cylinder values(seq_cylinder.nextval, 3, 20400, 1, 9);
insert into cylinder values(seq_cylinder.nextval, 5, 28000, 0, 9);
insert into cylinder values(seq_cylinder.nextval, 10, 39200, 0, 9);
insert into cylinder values(seq_cylinder.nextval, 13, 40300, 10, 9);
insert into cylinder values(seq_cylinder.nextval, 20, 45600, 151, 9);
insert into cylinder values(seq_cylinder.nextval, 50, 61100, 18, 9);
insert into cylinder values(seq_cylinder.nextval, 100, 470000, 0, 9);
insert into cylinder values(seq_cylinder.nextval, 185, 710000, 2, 9);
insert into cylinder values(seq_cylinder.nextval, 200, 850000, 0, 9);
insert into cylinder values(seq_cylinder.nextval, 3, 16200, 0, 10);
insert into cylinder values(seq_cylinder.nextval, 5, 25500, 1, 10);
insert into cylinder values(seq_cylinder.nextval, 10, 38000, 0, 10);
insert into cylinder values(seq_cylinder.nextval, 13, 40000, 13, 10);
insert into cylinder values(seq_cylinder.nextval, 20, 40300, 191, 10);
insert into cylinder values(seq_cylinder.nextval, 50, 50200, 11, 10);
insert into cylinder values(seq_cylinder.nextval, 100, 530000, 2, 10);
insert into cylinder values(seq_cylinder.nextval, 185, 750000, 1, 10);
insert into cylinder values(seq_cylinder.nextval, 200, 870000, 0, 10);
insert into cylinder values(seq_cylinder.nextval, 3, 22400, 0, 11);
insert into cylinder values(seq_cylinder.nextval, 5, 26800, 1, 11);
insert into cylinder values(seq_cylinder.nextval, 10, 38100, 1, 11);
insert into cylinder values(seq_cylinder.nextval, 13, 40500, 7, 11);
insert into cylinder values(seq_cylinder.nextval, 20, 46800, 148, 11);
insert into cylinder values(seq_cylinder.nextval, 50, 54700, 11, 11);
insert into cylinder values(seq_cylinder.nextval, 100, 540000, 2, 11);
insert into cylinder values(seq_cylinder.nextval, 185, 640000, 0, 11);
insert into cylinder values(seq_cylinder.nextval, 200, 830000, 1, 11);
insert into cylinder values(seq_cylinder.nextval, 3, 15900, 2, 12);
insert into cylinder values(seq_cylinder.nextval, 5, 25500, 2, 12);
insert into cylinder values(seq_cylinder.nextval, 10, 34100, 0, 12);
insert into cylinder values(seq_cylinder.nextval, 13, 40600, 10, 12);
insert into cylinder values(seq_cylinder.nextval, 20, 47200, 193, 12);
insert into cylinder values(seq_cylinder.nextval, 50, 54200, 19, 12);
insert into cylinder values(seq_cylinder.nextval, 100, 440000, 0, 12);
insert into cylinder values(seq_cylinder.nextval, 185, 730000, 2, 12);
insert into cylinder values(seq_cylinder.nextval, 200, 910000, 0, 12);
insert into cylinder values(seq_cylinder.nextval, 3, 22700, 1, 13);
insert into cylinder values(seq_cylinder.nextval, 5, 24900, 1, 13);
insert into cylinder values(seq_cylinder.nextval, 10, 35000, 1, 13);
insert into cylinder values(seq_cylinder.nextval, 13, 40900, 9, 13);
insert into cylinder values(seq_cylinder.nextval, 20, 47200, 118, 13);
insert into cylinder values(seq_cylinder.nextval, 50, 52600, 17, 13);
insert into cylinder values(seq_cylinder.nextval, 100, 540000, 2, 13);
insert into cylinder values(seq_cylinder.nextval, 185, 790000, 0, 13);
insert into cylinder values(seq_cylinder.nextval, 200, 860000, 0, 13);
insert into cylinder values(seq_cylinder.nextval, 3, 16600, 2, 14);
insert into cylinder values(seq_cylinder.nextval, 5, 20700, 1, 14);
insert into cylinder values(seq_cylinder.nextval, 10, 30400, 1, 14);
insert into cylinder values(seq_cylinder.nextval, 13, 35000, 14, 14);
insert into cylinder values(seq_cylinder.nextval, 20, 35800, 120, 14);
insert into cylinder values(seq_cylinder.nextval, 50, 51000, 11, 14);
insert into cylinder values(seq_cylinder.nextval, 100, 400000, 0, 14);
insert into cylinder values(seq_cylinder.nextval, 185, 790000, 1, 14);
insert into cylinder values(seq_cylinder.nextval, 200, 900000, 0, 14);

insert into gas values(seq_gas.nextval, '������', 1420, 4200, 1);
insert into gas values(seq_gas.nextval, '��ź', 1330, 3900, 1);
insert into gas values(seq_gas.nextval, '������', 1310, 3400, 2);
insert into gas values(seq_gas.nextval, '��ź', 1530, 2200, 2);
insert into gas values(seq_gas.nextval, '������', 1520, 2700, 3);
insert into gas values(seq_gas.nextval, '��ź', 1530, 2200, 3);
insert into gas values(seq_gas.nextval, '������', 1320, 3300, 4);
insert into gas values(seq_gas.nextval, '��ź', 1340, 2000, 4);
insert into gas values(seq_gas.nextval, '������', 1570, 3000, 5);
insert into gas values(seq_gas.nextval, '��ź', 1350, 2100, 5);
insert into gas values(seq_gas.nextval, '������', 1350, 3000, 6);
insert into gas values(seq_gas.nextval, '��ź', 1490, 2100, 6);
insert into gas values(seq_gas.nextval, '������', 1540, 3700, 7);
insert into gas values(seq_gas.nextval, '��ź', 1300, 3000, 7);
insert into gas values(seq_gas.nextval, '������', 1500, 3500, 8);
insert into gas values(seq_gas.nextval, '��ź', 1400, 2000, 8);
insert into gas values(seq_gas.nextval, '������', 1460, 3900, 9);
insert into gas values(seq_gas.nextval, '��ź', 1400, 2600, 9);
insert into gas values(seq_gas.nextval, '������', 1590, 3500, 10);
insert into gas values(seq_gas.nextval, '��ź', 1580, 2800, 10);
insert into gas values(seq_gas.nextval, '������', 1310, 1500, 11);
insert into gas values(seq_gas.nextval, '��ź', 1440, 4100, 11);
insert into gas values(seq_gas.nextval, '������', 1330, 3000, 12);
insert into gas values(seq_gas.nextval, '��ź', 1440, 2400, 12);
insert into gas values(seq_gas.nextval, '������', 1330, 2600, 13);
insert into gas values(seq_gas.nextval, '��ź', 1330, 2200, 13);
insert into gas values(seq_gas.nextval, '������', 1410, 2500, 14);
insert into gas values(seq_gas.nextval, '��ź', 1430, 4100, 14);