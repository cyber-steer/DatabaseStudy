
drop table sale;
drop table buy;
drop table charge;
drop table base;
drop table bowl;
drop table customer;
drop table employee;
drop table station;
drop table payment;
drop table gas;

create table gas(
    gno number(2) constraint gas_gno_pk primary key,
    gname varchar2(10) constraint gas_gname_nn not null,
    gprice number(5) constraint gas_gprice_nn not null
);

create table bowl(
    bno number(2) constraint bowl_bno_pk primary key,
    bvolume number(3) constraint bowl_bvolume_nn not null,
    bprice number(7) constraint bowl_bprice_nn not null
);

create table customer(
    cno number(2) constraint customer_cno_pk primary key,
    cname varchar2(30) constraint customer_cname_nn not null,
    ctel varchar2(20)
);

create table station(
    sno number(2) constraint station_sno_pk primary key,
    sname varchar2(60) constraint station_sname_nn not null,
    stel varchar2(20),
    ptank number(6) constraint station_ptank_nn not null,
    btank number(6) constraint station_btank_nn not null
);

create table base(
    baseno number(2) constraint base_bno_nn primary key,
    bname varchar2(60) constraint base_bname_nn not null,
    btel varchar2(20)
);

create table employee(
    eno number(2) constraint employee_eno_pk primary key,
    ename varchar2(20) constraint employee_ename_nn not null,
    job varchar2(20) constraint employee_job_nn not null,
    hiretdate date constraint employee_hiredate_nn not null,
    etel varchar2(20),
    salary number(7) constraint employee_salary_nn not null,
    sno number(2) constraint employee_sno_fk references station
);

create table buy(
    bcode number(2) constraint buy_bcode_pk primary key,
    bday date constraint buy_bday_nn not null,
    gno number(2) constraint buy_gno_fk references gas,
    bvolume number(6) constraint buy_bvolume_nn not null,
    bsum number(8) constraint buy_bsum_nn not null,
    baseno number(2) constraint buy_bno_fk references base,
    sno number(2) constraint buy_sno_fk references station
);

create table charge(
    ccode number(2) constraint charge_ccode_pk primary key,
    cday date constraint charge_cday_nn not null,
    gno number(2) constraint charge_gno_fk references gas,
    cvolume number(4) constraint charge_cvolume_nn not null,
    csum number(6) constraint charge_number_nn not null,
    sno number(2) constraint charge_sno_fk  references station,
    cno number(2) constraint charge_cusno_fk references customer
);

create table payment(
    pno number(2) constraint sale_pno_pk primary key,
    pday date constraint sale_pday_nn not null,
    psum number(7) constraint sale_psum_nn not null
);
create table sale(
    scode number(3) constraint sale_scode_pk primary key,
    bno number(2) constraint sale_bno_fk references bowl,
    svolume number(3) constraint sale_svolume_nn not null,
    pno number(2) constraint sale_pno_fk references payment,
    sno number(2) constraint sale_sno_fk references station,
    cno number(2) constraint sale_cno_fk references customer
);



--시퀀스 제거하기
drop sequence seq_base;
drop sequence seq_bowl;
drop sequence seq_buy;
drop sequence seq_charge;
drop sequence seq_customer;
drop sequence seq_employee;
drop sequence seq_gas;
drop sequence seq_payment;
drop sequence seq_sale;
drop sequence seq_station;

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

--시퀀스를 기본키에 접목하기
insert into gas values (seq_gas.nextval, 'propane', '1400');
insert into gas values (seq_gas.nextval, 'bhutan', '1500');

insert into bowl values (seq_bowl.nextval, 3, 20000);
insert into bowl values (seq_bowl.nextval, 5, 35000);
insert into bowl values (seq_bowl.nextval, 10, 57000);
insert into bowl values (seq_bowl.nextval, 13, 55000);
insert into bowl values (seq_bowl.nextval, 20, 61000);
insert into bowl values (seq_bowl.nextval, 50, 84000);
insert into bowl values (seq_bowl.nextval, 100, 540000);
insert into bowl values (seq_bowl.nextval, 185, 880000);
insert into bowl values (seq_bowl.nextval, 200, 980000);

insert into base values (seq_base.nextval,'평택기지본부','031) 680-3103');
insert into base values (seq_base.nextval,'인천기지본부','032) 810-4502');
insert into base values (seq_base.nextval,'통영기지본부','055) 640-6104');
insert into base values (seq_base.nextval,'삼척기지본부','033) 571-4000');
insert into base values (seq_base.nextval,'서울지역본부','02) 2657-1114');
insert into base values (seq_base.nextval,'인천지역본부','032) 453-6700');
insert into base values (seq_base.nextval,'경기지역본부','031) 400-7204');
insert into base values (seq_base.nextval,'강원지역본부','033) 760-6605');
insert into base values (seq_base.nextval,'대전·충청지역본부','042) 229-3403');
insert into base values (seq_base.nextval,'전북지역본부','063) 850-3800');
insert into base values (seq_base.nextval,'광주·전남지역본부','062) 950-1114');
insert into base values (seq_base.nextval,'대구·경북지역본부','053) 850-1900');
insert into base values (seq_base.nextval,'부산·경남지역본부','055) 330-7700');
insert into base values (seq_base.nextval,'제주LNG본부','064) 766-3600');

insert into station values(seq_station.nextval, '(주)해연', '051-528-1133', 50000,50000);
insert into station values(seq_station.nextval, '한국가스산업(주)', '051-635-3131', 30000,30000);
insert into station values(seq_station.nextval, '(주)삼성에너지', '051-555-3104', 50000,50000);
insert into station values(seq_station.nextval, '한국에너지산업(주)', '051-722-5152', 50000,50000);
insert into station values(seq_station.nextval, '비케이에너지(주)', '010-2727-2627', 80000,80000);
insert into station values(seq_station.nextval, '(주)MS가스', '051-317-2301', 50000,50000);
insert into station values(seq_station.nextval, '광신가스(주)', '051-311-0131', 50000,50000);
insert into station values(seq_station.nextval, '한국가스산업(주)사상영업소', '051-326-3131', 50000,50000);
insert into station values(seq_station.nextval, '대성산업(주)부산대성충전소', '051-303-4747', 80000,80000);
insert into station values(seq_station.nextval, '극동유화(주)', '051-320-8500', 30000,30000);
insert into station values(seq_station.nextval, '광진기업(주)장림영업소', '051-263-3131', 50000,50000);
insert into station values(seq_station.nextval, '(주)신성에너지 은광가스충전소', '051-206-3326', 50000,50000);
insert into station values(seq_station.nextval, '(주)신광에너지', '051-248-7365', 100000,100000);
insert into station values(seq_station.nextval, '이원 해운대LPG충전소', '051-704-9196', 50000,50000);

insert into customer values(seq_customer.nextval, '부산도시가스', '051-607-1234');
insert into customer values(seq_customer.nextval, '상일가스', '051-311-0400');
insert into customer values(seq_customer.nextval, '만국산소', '051-322-5327');
insert into customer values(seq_customer.nextval, '경남종합가스상사', '051-852-1300');
insert into customer values(seq_customer.nextval, '해동가스', '0507-1493-5960');
insert into customer values(seq_customer.nextval, 'PSG', '051-790-0900');
insert into customer values(seq_customer.nextval, '신진가스', '051-643-2255');
insert into customer values(seq_customer.nextval, '정관가스상사', '051-727-6601');
insert into customer values(seq_customer.nextval, 'MS가스', '051-317-2301');
insert into customer values(seq_customer.nextval, '천마산업가스', '051-728-3355');
insert into customer values(seq_customer.nextval, '제일가스', '0507-1356-7720');
insert into customer values(seq_customer.nextval, '기장종합가스', '051-721-6763');
insert into customer values(seq_customer.nextval, '명지에너지 가스', '051-271-1444');
insert into customer values(seq_customer.nextval, '한국산업가스', '051-201-1611');
insert into customer values(seq_customer.nextval, 'BK가스공영', '051-702-0472');
insert into customer values(seq_customer.nextval, '화승가스테크', '051-264-2080');
insert into customer values(seq_customer.nextval, '부일가스', '051-802-9826');
insert into customer values(seq_customer.nextval, '영남도시가스', '1899-8448');
insert into customer values(seq_customer.nextval, '동백가스설비상사', '0507-1422-8888');
insert into customer values(seq_customer.nextval, '동양가스산업', '051-721-6838');
insert into customer values(seq_customer.nextval, '삼원종합가스', '051-809-1199');
insert into customer values(seq_customer.nextval, '영진종합가스', '051-412-3104');
insert into customer values(seq_customer.nextval, '대천가스', '051-621-3036');
insert into customer values(seq_customer.nextval, '협신산업가스', '051-327-2261');
insert into customer values(seq_customer.nextval, '크리오스', '051-831-1190');

insert into employee values
(seq_employee.nextval, '고은옥','사원','2013-05-02','010-9715-3669',5000000,1);
insert into employee values
(seq_employee.nextval, '류예진','사원','2013-05-02','010-1044-7758',3000000,1);
insert into employee values
(seq_employee.nextval, '황성철','사원','2012-04-02','010-1990-2215',2500000,1);
insert into employee values
(seq_employee.nextval, '임준태','사원','2017-05-31','010-1393-1794',2000000,1);
insert into employee values
(seq_employee.nextval, '황보승연','사원','2014-06-08','010-1682-6467',5000000,2);
insert into employee values
(seq_employee.nextval, '배세진','사원','2014-03-16','010-6852-8199',3000000,2);
insert into employee values
(seq_employee.nextval, '임형태','사원','2009-07-27','010-9559-1594',2500000,2);
insert into employee values
(seq_employee.nextval, '윤범수','사원','2012-10-17','010-5767-8847',2000000,2);
insert into employee values
(seq_employee.nextval, '예시혁','사원','2017-03-17','010-7746-7252',5000000,3);
insert into employee values
(seq_employee.nextval, '이원미','사원','2014-10-05','010-1187-8120',3000000,3);
insert into employee values
(seq_employee.nextval, '고현태','사원','2014-08-06','010-2902-9937',2500000,3);
insert into employee values
(seq_employee.nextval, '남궁호석','사원','2015-11-27','010-7698-9665',2000000,3);
insert into employee values
(seq_employee.nextval, '전성혁','사원','2009-11-16','010-1237-3248',5000000,4);
insert into employee values
(seq_employee.nextval, '조혜수','사원','2013-08-08','010-3803-4062',3000000,4);
insert into employee values
(seq_employee.nextval, '표다은','사원','2011-01-13','010-8905-4846',2500000,4);
insert into employee values
(seq_employee.nextval, '추소희','사원','2010-04-25','010-6185-8736',2000000,4);
insert into employee values
(seq_employee.nextval, '신영혜','사원','2010-10-20','010-1637-5177',5000000,5);
insert into employee values
(seq_employee.nextval, '심기용','사원','2018-04-13','010-1360-6382',3000000,5);
insert into employee values
(seq_employee.nextval, '황기훈','사원','2010-06-01','010-2231-4598',2500000,5);
insert into employee values
(seq_employee.nextval, '설동수','사원','2014-08-16','010-2569-7794',2000000,5);
insert into employee values
(seq_employee.nextval, '하우준','사원','2013-05-14','010-8175-8316',5000000,6);
insert into employee values
(seq_employee.nextval, '권승식','사원','2016-05-16','010-4682-7440',3000000,6);
insert into employee values
(seq_employee.nextval, '남궁세정','사원','2015-04-03','010-1270-7881',2500000,6);
insert into employee values
(seq_employee.nextval, '정영태','사원','2011-12-20','010-8289-4218',2000000,6);
insert into employee values
(seq_employee.nextval, '성영진','사원','2012-12-03','010-2820-9209',5000000,7);
insert into employee values
(seq_employee.nextval, '윤준현','사원','2015-10-31','010-4091-1362',3000000,7);
insert into employee values
(seq_employee.nextval, '고선영','사원','2013-05-16','010-1603-4623',2500000,7);
insert into employee values
(seq_employee.nextval, '한태호','사원','2009-02-06','010-6547-2645',2000000,7);
insert into employee values
(seq_employee.nextval, '안현정','사원','2012-04-29','010-6315-1146',5000000,8);
insert into employee values
(seq_employee.nextval, '사공범우','사원','2009-09-11','010-9179-2330',3000000,8);
insert into employee values
(seq_employee.nextval, '설윤호','사원','2013-10-17','010-7293-3592',2500000,8);
insert into employee values
(seq_employee.nextval, '탁민철','사원','2009-02-13','010-7646-2340',2000000,8);
insert into employee values
(seq_employee.nextval, '이기철','사원','2010-09-20','010-1461-7391',5000000,9);
insert into employee values
(seq_employee.nextval, '강진하','사원','2010-09-01','010-5264-8046',3000000,9);
insert into employee values
(seq_employee.nextval, '허주환','사원','2011-11-16','010-3483-8935',2500000,9);
insert into employee values
(seq_employee.nextval, '남궁선아','사원','2012-02-27','010-2881-4744',2000000,9);
insert into employee values
(seq_employee.nextval, '서태준','사원','2015-04-09','010-9954-6542',5000000,10);
insert into employee values
(seq_employee.nextval, '최기정','사원','2012-09-22','010-2333-3437',3000000,10);
insert into employee values
(seq_employee.nextval, '하다은','사원','2018-02-10','010-6040-6378',2500000,10);
insert into employee values
(seq_employee.nextval, '문광현','사원','2012-01-18','010-7232-5864',2000000,10);

insert into buy values (seq_buy.nextval,'2016-02-25', 1, 500, 700000, 10, 3);
insert into buy values (seq_buy.nextval,'2009-05-30', 1, 700, 980000, 5, 13);
insert into buy values (seq_buy.nextval,'2012-11-09', 2, 100, 150000, 6, 13);
insert into buy values (seq_buy.nextval,'2017-02-10', 2, 800, 1200000, 2, 8);
insert into buy values (seq_buy.nextval,'2009-02-08', 2, 400, 600000, 5, 6);
insert into buy values (seq_buy.nextval,'2013-03-24', 2, 300, 450000, 11, 3);
insert into buy values (seq_buy.nextval,'2012-02-16', 2, 1000, 1500000, 5, 2);
insert into buy values (seq_buy.nextval,'2017-08-14', 1, 600, 840000, 9, 4);
insert into buy values (seq_buy.nextval,'2009-03-01', 1, 800, 1120000, 14, 3);
insert into buy values (seq_buy.nextval,'2017-06-26', 1, 700, 980000, 5, 6);
insert into buy values (seq_buy.nextval,'2016-07-30', 2, 100, 150000, 2, 3);
insert into buy values (seq_buy.nextval,'2015-03-10', 1, 700, 980000, 5, 9);
insert into buy values (seq_buy.nextval,'2012-12-01', 1, 900, 1260000, 14, 7);
insert into buy values (seq_buy.nextval,'2012-10-18', 1, 700, 980000, 11, 4);
insert into buy values (seq_buy.nextval,'2017-01-14', 1, 700, 980000, 7, 3);
insert into buy values (seq_buy.nextval,'2017-02-23', 1, 800, 1120000, 11, 13);
insert into buy values (seq_buy.nextval,'2014-10-12', 1, 1000, 1400000, 9, 10);
insert into buy values (seq_buy.nextval,'2014-09-21', 2, 100, 150000, 8, 5);
insert into buy values (seq_buy.nextval,'2015-07-27', 1, 500, 700000, 6, 13);
insert into buy values (seq_buy.nextval,'2012-02-16', 2, 600, 900000, 13, 2);
insert into buy values (seq_buy.nextval,'2018-04-12', 1, 300, 420000, 2, 7);
insert into buy values (seq_buy.nextval,'2014-10-27', 2, 400, 600000, 9, 4);
insert into buy values (seq_buy.nextval,'2012-04-25', 1, 500, 700000, 11, 4);
insert into buy values (seq_buy.nextval,'2015-10-29', 1, 1000, 1400000, 1, 1);
insert into buy values (seq_buy.nextval,'2017-02-06', 2, 900, 1350000, 7, 6);
insert into buy values (seq_buy.nextval,'2010-02-05', 1, 200, 280000, 9, 1);
insert into buy values (seq_buy.nextval,'2009-09-11', 2, 200, 300000, 2, 11);
insert into buy values (seq_buy.nextval,'2010-07-07', 2, 400, 600000, 8, 11);
insert into buy values (seq_buy.nextval,'2016-12-04', 2, 500, 750000, 10, 2);
insert into buy values (seq_buy.nextval,'2009-10-30', 2, 800, 1200000, 13, 2);

insert into charge values(seq_charge.nextval,'2011-08-14', 2, 6, 9000, 11, 15 );
insert into charge values(seq_charge.nextval,'2013-05-02', 2, 7, 10500, 12, 8 );
insert into charge values(seq_charge.nextval,'2009-11-04', 2, 14, 21000, 10, 13 );
insert into charge values(seq_charge.nextval,'2010-07-17', 2, 7, 10500, 8, 14 );
insert into charge values(seq_charge.nextval,'2012-02-07', 2, 7, 10500, 11, 3 );
insert into charge values(seq_charge.nextval,'2011-04-08', 1, 12, 16800, 7, 10 );
insert into charge values(seq_charge.nextval,'2013-06-21', 2, 7, 10500, 5, 20 );
insert into charge values(seq_charge.nextval,'2012-08-22', 2, 16, 24000, 8, 9 );
insert into charge values(seq_charge.nextval,'2011-12-16', 1, 18, 25200, 6, 22 );
insert into charge values(seq_charge.nextval,'2014-06-16', 2, 17, 25500, 10, 19 );
insert into charge values(seq_charge.nextval,'2016-06-04', 1, 17, 23800, 2, 19 );
insert into charge values(seq_charge.nextval,'2014-12-01', 1, 12, 16800, 12, 16 );
insert into charge values(seq_charge.nextval,'2010-07-17', 2, 5, 7500, 7, 2 );
insert into charge values(seq_charge.nextval,'2012-03-03', 2, 18, 27000, 5, 9 );
insert into charge values(seq_charge.nextval,'2011-06-02', 1, 9, 12600, 5, 4 );
insert into charge values(seq_charge.nextval,'2015-02-09', 1, 19, 26600, 12, 12 );
insert into charge values(seq_charge.nextval,'2010-06-16', 1, 17, 23800, 12, 15 );
insert into charge values(seq_charge.nextval,'2017-03-07', 2, 17, 25500, 10, 8 );
insert into charge values(seq_charge.nextval,'2013-12-06', 2, 7, 10500, 7, 3 );
insert into charge values(seq_charge.nextval,'2009-05-14', 1, 7, 9800, 7, 5 );
insert into charge values(seq_charge.nextval,'2015-12-13', 2, 15, 22500, 2, 7 );
insert into charge values(seq_charge.nextval,'2012-01-29', 2, 12, 18000, 1, 12 );
insert into charge values(seq_charge.nextval,'2014-08-31', 1, 10, 14000, 10, 19 );
insert into charge values(seq_charge.nextval,'2009-05-21', 2, 6, 9000, 9, 14 );
insert into charge values(seq_charge.nextval,'2012-12-29', 2, 11, 16500, 4, 1 );
insert into charge values(seq_charge.nextval,'2009-12-22', 1, 12, 16800, 3, 15 );
insert into charge values(seq_charge.nextval,'2010-03-20', 1, 5, 7000, 2, 23 );
insert into charge values(seq_charge.nextval,'2012-10-20', 1, 11, 15400, 5, 22 );
insert into charge values(seq_charge.nextval,'2017-05-02', 1, 7, 9800, 13, 14 );
insert into charge values(seq_charge.nextval,'2012-09-11', 1, 15, 21000, 5, 22 );

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

insert into sale values(seq_sale.nextval, 1, 2, 1, 2, 7);
insert into sale values(seq_sale.nextval, 2, 3, 1, 2, 7);
insert into sale values(seq_sale.nextval, 3, 2, 1, 2, 7);
insert into sale values(seq_sale.nextval, 4, 3, 1, 2, 7);
insert into sale values(seq_sale.nextval, 5, 4, 1, 2, 7);
insert into sale values(seq_sale.nextval, 6, 2, 1, 2, 7);
insert into sale values(seq_sale.nextval, 1, 4, 2, 12, 12);
insert into sale values(seq_sale.nextval, 2, 2, 2, 12, 12);
insert into sale values(seq_sale.nextval, 3, 4, 2, 12, 12);
insert into sale values(seq_sale.nextval, 4, 2, 2, 12, 12);
insert into sale values(seq_sale.nextval, 6, 1, 2, 12, 12);
insert into sale values(seq_sale.nextval, 1, 3, 3, 4, 9);
insert into sale values(seq_sale.nextval, 3, 1, 3, 4, 9);
insert into sale values(seq_sale.nextval, 4, 1, 3, 4, 9);
insert into sale values(seq_sale.nextval, 6, 4, 3, 4, 9);
insert into sale values(seq_sale.nextval, 2, 4, 4, 5, 3);
insert into sale values(seq_sale.nextval, 3, 4, 4, 5, 3);
insert into sale values(seq_sale.nextval, 4, 2, 4, 5, 3);
insert into sale values(seq_sale.nextval, 5, 2, 4, 5, 3);
insert into sale values(seq_sale.nextval, 6, 1, 4, 5, 3);
insert into sale values(seq_sale.nextval, 2, 2, 5, 9, 5);
insert into sale values(seq_sale.nextval, 4, 2, 5, 9, 5);
insert into sale values(seq_sale.nextval, 5, 4, 5, 9, 5);
insert into sale values(seq_sale.nextval, 6, 4, 5, 9, 5);
insert into sale values(seq_sale.nextval, 1, 2, 6, 1, 13);
insert into sale values(seq_sale.nextval, 2, 3, 6, 1, 13);
insert into sale values(seq_sale.nextval, 3, 1, 6, 1, 13);
insert into sale values(seq_sale.nextval, 4, 3, 6, 1, 13);
insert into sale values(seq_sale.nextval, 5, 1, 6, 1, 13);
insert into sale values(seq_sale.nextval, 6, 2, 6, 1, 13);
insert into sale values(seq_sale.nextval, 1, 3, 7, 10, 2);
insert into sale values(seq_sale.nextval, 2, 4, 7, 10, 2);
insert into sale values(seq_sale.nextval, 3, 3, 7, 10, 2);
insert into sale values(seq_sale.nextval, 4, 3, 7, 10, 2);
insert into sale values(seq_sale.nextval, 5, 4, 7, 10, 2);
insert into sale values(seq_sale.nextval, 6, 1, 7, 10, 2);
insert into sale values(seq_sale.nextval, 1, 1, 8, 5, 4);
insert into sale values(seq_sale.nextval, 2, 3, 8, 5, 4);
insert into sale values(seq_sale.nextval, 4, 1, 8, 5, 4);
insert into sale values(seq_sale.nextval, 5, 4, 8, 5, 4);
insert into sale values(seq_sale.nextval, 6, 3, 8, 5, 4);
insert into sale values(seq_sale.nextval, 1, 4, 9, 13, 4);
insert into sale values(seq_sale.nextval, 3, 1, 9, 13, 4);
insert into sale values(seq_sale.nextval, 4, 2, 9, 13, 4);
insert into sale values(seq_sale.nextval, 1, 3, 10, 10, 14);
insert into sale values(seq_sale.nextval, 3, 1, 10, 10, 14);
insert into sale values(seq_sale.nextval, 5, 1, 10, 10, 14);
insert into sale values(seq_sale.nextval, 1, 3, 11, 1, 21);
insert into sale values(seq_sale.nextval, 3, 3, 11, 1, 21);
insert into sale values(seq_sale.nextval, 4, 2, 11, 1, 21);
insert into sale values(seq_sale.nextval, 6, 1, 11, 1, 21);
insert into sale values(seq_sale.nextval, 1, 2, 12, 3, 17);
insert into sale values(seq_sale.nextval, 2, 3, 12, 3, 17);
insert into sale values(seq_sale.nextval, 3, 4, 12, 3, 17);
insert into sale values(seq_sale.nextval, 4, 4, 12, 3, 17);
insert into sale values(seq_sale.nextval, 5, 3, 12, 3, 17);
insert into sale values(seq_sale.nextval, 6, 2, 12, 3, 17);
insert into sale values(seq_sale.nextval, 1, 1, 13, 5, 25);
insert into sale values(seq_sale.nextval, 2, 1, 13, 5, 25);
insert into sale values(seq_sale.nextval, 3, 1, 13, 5, 25);
insert into sale values(seq_sale.nextval, 4, 4, 13, 5, 25);
insert into sale values(seq_sale.nextval, 5, 3, 13, 5, 25);
insert into sale values(seq_sale.nextval, 6, 4, 13, 5, 25);
insert into sale values(seq_sale.nextval, 3, 4, 14, 5, 8);
insert into sale values(seq_sale.nextval, 4, 2, 14, 5, 8);
insert into sale values(seq_sale.nextval, 5, 4, 14, 5, 8);
insert into sale values(seq_sale.nextval, 6, 4, 14, 5, 8);
insert into sale values(seq_sale.nextval, 1, 1, 15, 14, 5);
insert into sale values(seq_sale.nextval, 2, 3, 15, 14, 5);
insert into sale values(seq_sale.nextval, 3, 2, 15, 14, 5);
insert into sale values(seq_sale.nextval, 4, 1, 15, 14, 5);
insert into sale values(seq_sale.nextval, 5, 4, 15, 14, 5);
insert into sale values(seq_sale.nextval, 6, 3, 15, 14, 5);
insert into sale values(seq_sale.nextval, 2, 3, 16, 2, 19);
insert into sale values(seq_sale.nextval, 3, 4, 16, 2, 19);
insert into sale values(seq_sale.nextval, 4, 1, 16, 2, 19);
insert into sale values(seq_sale.nextval, 5, 1, 16, 2, 19);
insert into sale values(seq_sale.nextval, 2, 1, 17, 3, 16);
insert into sale values(seq_sale.nextval, 3, 3, 17, 3, 16);
insert into sale values(seq_sale.nextval, 4, 4, 17, 3, 16);
insert into sale values(seq_sale.nextval, 6, 2, 17, 3, 16);
insert into sale values(seq_sale.nextval, 2, 2, 18, 6, 20);
insert into sale values(seq_sale.nextval, 3, 2, 18, 6, 20);
insert into sale values(seq_sale.nextval, 5, 2, 18, 6, 20);
insert into sale values(seq_sale.nextval, 6, 1, 18, 6, 20);
insert into sale values(seq_sale.nextval, 1, 2, 19, 6, 3);
insert into sale values(seq_sale.nextval, 3, 4, 19, 6, 3);
insert into sale values(seq_sale.nextval, 4, 2, 19, 6, 3);
insert into sale values(seq_sale.nextval, 5, 3, 19, 6, 3);
insert into sale values(seq_sale.nextval, 6, 3, 19, 6, 3);
insert into sale values(seq_sale.nextval, 1, 3, 20, 7, 11);
insert into sale values(seq_sale.nextval, 2, 3, 20, 7, 11);
insert into sale values(seq_sale.nextval, 3, 4, 20, 7, 11);
insert into sale values(seq_sale.nextval, 4, 2, 20, 7, 11);
insert into sale values(seq_sale.nextval, 5, 3, 20, 7, 11);
insert into sale values(seq_sale.nextval, 6, 1, 20, 7, 11);
insert into sale values(seq_sale.nextval, 1, 3, 21, 11, 2);
insert into sale values(seq_sale.nextval, 2, 2, 21, 11, 2);
insert into sale values(seq_sale.nextval, 4, 2, 21, 11, 2);
insert into sale values(seq_sale.nextval, 5, 3, 21, 11, 2);
insert into sale values(seq_sale.nextval, 6, 1, 21, 11, 2);
insert into sale values(seq_sale.nextval, 1, 4, 22, 10, 7);
insert into sale values(seq_sale.nextval, 2, 4, 22, 10, 7);
insert into sale values(seq_sale.nextval, 3, 1, 22, 10, 7);
insert into sale values(seq_sale.nextval, 4, 2, 22, 10, 7);
insert into sale values(seq_sale.nextval, 5, 2, 22, 10, 7);
insert into sale values(seq_sale.nextval, 6, 1, 22, 10, 7);
insert into sale values(seq_sale.nextval, 1, 4, 23, 6, 6);
insert into sale values(seq_sale.nextval, 3, 1, 23, 6, 6);
insert into sale values(seq_sale.nextval, 4, 4, 23, 6, 6);
insert into sale values(seq_sale.nextval, 6, 4, 23, 6, 6);
insert into sale values(seq_sale.nextval, 1, 1, 24, 14, 17);
insert into sale values(seq_sale.nextval, 3, 1, 24, 14, 17);
insert into sale values(seq_sale.nextval, 5, 2, 24, 14, 17);
insert into sale values(seq_sale.nextval, 6, 2, 24, 14, 17);
insert into sale values(seq_sale.nextval, 1, 3, 25, 4, 9);
insert into sale values(seq_sale.nextval, 2, 4, 25, 4, 9);
insert into sale values(seq_sale.nextval, 4, 1, 25, 4, 9);
insert into sale values(seq_sale.nextval, 5, 2, 25, 4, 9);
insert into sale values(seq_sale.nextval, 6, 4, 25, 4, 9);
insert into sale values(seq_sale.nextval, 1, 2, 26, 10, 7);
insert into sale values(seq_sale.nextval, 2, 4, 26, 10, 7);
insert into sale values(seq_sale.nextval, 3, 4, 26, 10, 7);
insert into sale values(seq_sale.nextval, 4, 1, 26, 10, 7);
insert into sale values(seq_sale.nextval, 5, 2, 26, 10, 7);
insert into sale values(seq_sale.nextval, 6, 3, 26, 10, 7);
insert into sale values(seq_sale.nextval, 1, 2, 27, 2, 18);
insert into sale values(seq_sale.nextval, 2, 4, 27, 2, 18);
insert into sale values(seq_sale.nextval, 3, 1, 27, 2, 18);
insert into sale values(seq_sale.nextval, 4, 4, 27, 2, 18);
insert into sale values(seq_sale.nextval, 5, 4, 27, 2, 18);
insert into sale values(seq_sale.nextval, 6, 1, 27, 2, 18);
insert into sale values(seq_sale.nextval, 1, 2, 28, 10, 16);
insert into sale values(seq_sale.nextval, 3, 4, 28, 10, 16);
insert into sale values(seq_sale.nextval, 4, 1, 28, 10, 16);
insert into sale values(seq_sale.nextval, 5, 2, 28, 10, 16);
insert into sale values(seq_sale.nextval, 6, 1, 28, 10, 16);
insert into sale values(seq_sale.nextval, 1, 4, 29, 3, 23);
insert into sale values(seq_sale.nextval, 2, 2, 29, 3, 23);
insert into sale values(seq_sale.nextval, 3, 1, 29, 3, 23);
insert into sale values(seq_sale.nextval, 4, 4, 29, 3, 23);
insert into sale values(seq_sale.nextval, 5, 4, 29, 3, 23);
insert into sale values(seq_sale.nextval, 6, 1, 29, 3, 23);
insert into sale values(seq_sale.nextval, 1, 4, 30, 10, 1);
insert into sale values(seq_sale.nextval, 2, 2, 30, 10, 1);
insert into sale values(seq_sale.nextval, 3, 3, 30, 10, 1);
insert into sale values(seq_sale.nextval, 4, 3, 30, 10, 1);
insert into sale values(seq_sale.nextval, 5, 1, 30, 10, 1);
insert into sale values(seq_sale.nextval, 6, 1, 30, 10, 1);
