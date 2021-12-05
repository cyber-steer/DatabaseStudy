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
    psum number(7)
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
    cvoluem number(4) constraint charge_cvoluem_nn not null,
    csum number(6) constraint charge_csum_nn not null,
    gno number(2) constraint charge_gno_fk references gas,
    cusno number(2) constraint charge_cusno_fk references customer
);
create table sale(
    scode number(3) constraint sale_scode_pk primary key,
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

insert into enterprise values (seq_enterprise.nextval, '(주)한국가스코', '1577-4625');
insert into enterprise values (seq_enterprise.nextval, '(주)화인실텍', '031-797-3643');
insert into enterprise values (seq_enterprise.nextval, '(주)윈테크', '043-534-2386');
insert into enterprise values (seq_enterprise.nextval, '신화가스', '062-955-4445');

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
(seq_employee.nextval, '고은옥','사장','2013-05-02','010-9715-3669',5000000,1);
insert into employee values
(seq_employee.nextval, '류예진','팀장','2013-05-02','010-1044-7758',3000000,1);
insert into employee values
(seq_employee.nextval, '황성철','사원','2012-04-02','010-1990-2215',2500000,1);
insert into employee values
(seq_employee.nextval, '임준태','사원','2017-05-31','010-1393-1794',2000000,1);
insert into employee values
(seq_employee.nextval, '황보승연','사장','2014-06-08','010-1682-6467',5000000,2);
insert into employee values
(seq_employee.nextval, '배세진','팀장','2014-03-16','010-6852-8199',3000000,2);
insert into employee values
(seq_employee.nextval, '임형태','사원','2009-07-27','010-9559-1594',2500000,2);
insert into employee values
(seq_employee.nextval, '윤범수','사원','2012-10-17','010-5767-8847',2000000,2);
insert into employee values
(seq_employee.nextval, '예시혁','사장','2017-03-17','010-7746-7252',5000000,3);
insert into employee values
(seq_employee.nextval, '이원미','팀장','2014-10-05','010-1187-8120',3000000,3);
insert into employee values
(seq_employee.nextval, '고현태','사원','2014-08-06','010-2902-9937',2500000,3);
insert into employee values
(seq_employee.nextval, '남궁호석','사원','2015-11-27','010-7698-9665',2000000,3);
insert into employee values
(seq_employee.nextval, '전성혁','사장','2009-11-16','010-1237-3248',5000000,4);
insert into employee values
(seq_employee.nextval, '조혜수','팀장','2013-08-08','010-3803-4062',3000000,4);
insert into employee values
(seq_employee.nextval, '표다은','사원','2011-01-13','010-8905-4846',2500000,4);
insert into employee values
(seq_employee.nextval, '추소희','사원','2010-04-25','010-6185-8736',2000000,4);
insert into employee values
(seq_employee.nextval, '신영혜','사장','2010-10-20','010-1637-5177',5000000,5);
insert into employee values
(seq_employee.nextval, '심기용','팀장','2018-04-13','010-1360-6382',3000000,5);
insert into employee values
(seq_employee.nextval, '황기훈','사원','2010-06-01','010-2231-4598',2500000,5);
insert into employee values
(seq_employee.nextval, '설동수','사원','2014-08-16','010-2569-7794',2000000,5);
insert into employee values
(seq_employee.nextval, '하우준','사장','2013-05-14','010-8175-8316',5000000,6);
insert into employee values
(seq_employee.nextval, '권승식','팀장','2016-05-16','010-4682-7440',3000000,6);
insert into employee values
(seq_employee.nextval, '남궁세정','사원','2015-04-03','010-1270-7881',2500000,6);
insert into employee values
(seq_employee.nextval, '정영태','사원','2011-12-20','010-8289-4218',2000000,6);
insert into employee values
(seq_employee.nextval, '성영진','사장','2012-12-03','010-2820-9209',5000000,7);
insert into employee values
(seq_employee.nextval, '윤준현','팀장','2015-10-31','010-4091-1362',3000000,7);
insert into employee values
(seq_employee.nextval, '고선영','사원','2013-05-16','010-1603-4623',2500000,7);
insert into employee values
(seq_employee.nextval, '한태호','사원','2009-02-06','010-6547-2645',2000000,7);
insert into employee values
(seq_employee.nextval, '안현정','사장','2012-04-29','010-6315-1146',5000000,8);
insert into employee values
(seq_employee.nextval, '사공범우','팀장','2009-09-11','010-9179-2330',3000000,8);
insert into employee values
(seq_employee.nextval, '설윤호','사원','2013-10-17','010-7293-3592',2500000,8);
insert into employee values
(seq_employee.nextval, '탁민철','사원','2009-02-13','010-7646-2340',2000000,8);
insert into employee values
(seq_employee.nextval, '이기철','사장','2010-09-20','010-1461-7391',5000000,9);
insert into employee values
(seq_employee.nextval, '강진하','팀장','2010-09-01','010-5264-8046',3000000,9);
insert into employee values
(seq_employee.nextval, '허주환','사원','2011-11-16','010-3483-8935',2500000,9);
insert into employee values
(seq_employee.nextval, '남궁선아','사원','2012-02-27','010-2881-4744',2000000,9);
insert into employee values
(seq_employee.nextval, '서태준','사장','2015-04-09','010-9954-6542',5000000,10);
insert into employee values
(seq_employee.nextval, '최기정','팀장','2012-09-22','010-2333-3437',3000000,10);
insert into employee values
(seq_employee.nextval, '하다은','사원','2018-02-10','010-6040-6378',2500000,10);
insert into employee values
(seq_employee.nextval, '봉현기','사원','2012-01-18','010-1141-5481',2000000,10);
insert into employee values
(seq_employee.nextval, '고희영','사장','2012-01-18','010-6811-6491',5000000,11);
insert into employee values
(seq_employee.nextval, '서우원','팀장','2012-01-18','010-2475-5676',3000000,11);
insert into employee values
(seq_employee.nextval, '안태희','사원','2012-01-18','010-5612-7027',2500000,11);
insert into employee values
(seq_employee.nextval, '홍용하','사원','2012-01-18','010-2700-6368',2000000,11);
insert into employee values
(seq_employee.nextval, '강효준','사장','2012-01-18','010-7192-6242',5000000,12);
insert into employee values
(seq_employee.nextval, '표영철','팀장','2012-01-18','010-3126-5577',3000000,12);
insert into employee values
(seq_employee.nextval, '문윤혁','사원','2012-01-18','010-6407-1564',2500000,12);
insert into employee values
(seq_employee.nextval, '안원석','사원','2012-01-18','010-9417-9310',2000000,12);
insert into employee values
(seq_employee.nextval, '노은선','사장','2012-01-18','010-9906-9136',5000000,13);
insert into employee values
(seq_employee.nextval, '권광석','팀장','2012-01-18','010-4570-6135',3000000,13);
insert into employee values
(seq_employee.nextval, '봉서은','사원','2012-01-18','010-5032-9828',2500000,13);
insert into employee values
(seq_employee.nextval, '설병하','사원','2012-01-18','010-8771-7415',2000000,13);
insert into employee values
(seq_employee.nextval, '제갈수진','사장','2012-01-18','010-6855-7402',5000000,14);
insert into employee values
(seq_employee.nextval, '이경은','팀장','2012-01-18','010-6317-1323',3000000,14);
insert into employee values
(seq_employee.nextval, '전남기','사원','2012-01-18','010-1525-8053',2500000,14);
insert into employee values
(seq_employee.nextval, '풍수혁','사원','2012-01-18','010-4746-2758',2000000,14);

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

insert into gas values(seq_gas.nextval, '프로판', 1420, 4200, 1);
insert into gas values(seq_gas.nextval, '부탄', 1330, 3900, 1);
insert into gas values(seq_gas.nextval, '프로판', 1310, 3400, 2);
insert into gas values(seq_gas.nextval, '부탄', 1530, 2200, 2);
insert into gas values(seq_gas.nextval, '프로판', 1520, 2700, 3);
insert into gas values(seq_gas.nextval, '부탄', 1530, 2200, 3);
insert into gas values(seq_gas.nextval, '프로판', 1320, 3300, 4);
insert into gas values(seq_gas.nextval, '부탄', 1340, 2000, 4);
insert into gas values(seq_gas.nextval, '프로판', 1570, 3000, 5);
insert into gas values(seq_gas.nextval, '부탄', 1350, 2100, 5);
insert into gas values(seq_gas.nextval, '프로판', 1350, 3000, 6);
insert into gas values(seq_gas.nextval, '부탄', 1490, 2100, 6);
insert into gas values(seq_gas.nextval, '프로판', 1540, 3700, 7);
insert into gas values(seq_gas.nextval, '부탄', 1300, 3000, 7);
insert into gas values(seq_gas.nextval, '프로판', 1500, 3500, 8);
insert into gas values(seq_gas.nextval, '부탄', 1400, 2000, 8);
insert into gas values(seq_gas.nextval, '프로판', 1460, 3900, 9);
insert into gas values(seq_gas.nextval, '부탄', 1400, 2600, 9);
insert into gas values(seq_gas.nextval, '프로판', 1590, 3500, 10);
insert into gas values(seq_gas.nextval, '부탄', 1580, 2800, 10);
insert into gas values(seq_gas.nextval, '프로판', 1310, 1500, 11);
insert into gas values(seq_gas.nextval, '부탄', 1440, 4100, 11);
insert into gas values(seq_gas.nextval, '프로판', 1330, 3000, 12);
insert into gas values(seq_gas.nextval, '부탄', 1440, 2400, 12);
insert into gas values(seq_gas.nextval, '프로판', 1330, 2600, 13);
insert into gas values(seq_gas.nextval, '부탄', 1330, 2200, 13);
insert into gas values(seq_gas.nextval, '프로판', 1410, 2500, 14);
insert into gas values(seq_gas.nextval, '부탄', 1430, 4100, 14);

insert into cylinder_order values(seq_cylinder_order.nextval, '2003-1-24', 5, 4, 76800, 4, 1);
insert into cylinder_order values(seq_cylinder_order.nextval, '2004-9-4', 10, 3, 67500, 1, 1);
insert into cylinder_order values(seq_cylinder_order.nextval, '2008-2-1', 20, 70, 2443000, 4, 1);
insert into cylinder_order values(seq_cylinder_order.nextval, '2011-6-22', 50, 10, 371000, 4, 1);
insert into cylinder_order values(seq_cylinder_order.nextval, '2008-3-29', 20, 110, 3740000, 4, 2);
insert into cylinder_order values(seq_cylinder_order.nextval, '2011-5-13', 50, 10, 392000, 2, 2);
insert into cylinder_order values(seq_cylinder_order.nextval, '2015-5-20', 185, 1, 580000, 4, 2);
insert into cylinder_order values(seq_cylinder_order.nextval, '2008-7-31', 20, 140, 4186000, 2, 3);
insert into cylinder_order values(seq_cylinder_order.nextval, '2010-9-28', 50, 10, 388000, 4, 3);
insert into cylinder_order values(seq_cylinder_order.nextval, '2014-8-5', 185, 3, 1530000, 1, 3);
insert into cylinder_order values(seq_cylinder_order.nextval, '2000-11-14', 3, 4, 52000, 1, 4);
insert into cylinder_order values(seq_cylinder_order.nextval, '2006-1-7', 13, 11, 281600, 1, 4);
insert into cylinder_order values(seq_cylinder_order.nextval, '2009-4-6', 20, 90, 2385000, 3, 4);
insert into cylinder_order values(seq_cylinder_order.nextval, '2011-2-25', 50, 10, 337000, 3, 4);
insert into cylinder_order values(seq_cylinder_order.nextval, '2006-1-16', 13, 13, 314600, 4, 5);
insert into cylinder_order values(seq_cylinder_order.nextval, '2008-11-14', 20, 70, 2198000, 1, 5);
insert into cylinder_order values(seq_cylinder_order.nextval, '2010-7-31', 50, 10, 370000, 2, 5);
insert into cylinder_order values(seq_cylinder_order.nextval, '2016-5-6', 200, 1, 760000, 3, 5);
insert into cylinder_order values(seq_cylinder_order.nextval, '2005-11-26', 10, 5, 139000, 1, 6);
insert into cylinder_order values(seq_cylinder_order.nextval, '2006-9-26', 13, 7, 209300, 3, 6);
insert into cylinder_order values(seq_cylinder_order.nextval, '2009-7-21', 20, 110, 3102000, 2, 6);
insert into cylinder_order values(seq_cylinder_order.nextval, '2010-6-24', 50, 20, 704000, 2, 6);
insert into cylinder_order values(seq_cylinder_order.nextval, '2002-11-17', 5, 2, 40200, 1, 7);
insert into cylinder_order values(seq_cylinder_order.nextval, '2004-11-21', 10, 5, 119500, 3, 7);
insert into cylinder_order values(seq_cylinder_order.nextval, '2006-8-28', 13, 10, 254000, 1, 7);
insert into cylinder_order values(seq_cylinder_order.nextval, '2008-1-20', 20, 120, 3048000, 3, 7);
insert into cylinder_order values(seq_cylinder_order.nextval, '2011-4-10', 50, 10, 345000, 4, 7);
insert into cylinder_order values(seq_cylinder_order.nextval, '2001-3-11', 3, 2, 22000, 4, 8);
insert into cylinder_order values(seq_cylinder_order.nextval, '2007-5-10', 13, 10, 299000, 2, 8);
insert into cylinder_order values(seq_cylinder_order.nextval, '2008-3-22', 20, 140, 4858000, 1, 8);
insert into cylinder_order values(seq_cylinder_order.nextval, '2011-8-27', 50, 20, 626000, 2, 8);
insert into cylinder_order values(seq_cylinder_order.nextval, '2015-9-18', 185, 1, 590000, 1, 8);
insert into cylinder_order values(seq_cylinder_order.nextval, '2000-2-28', 3, 2, 23800, 3, 9);
insert into cylinder_order values(seq_cylinder_order.nextval, '2006-8-17', 13, 8, 184000, 1, 9);
insert into cylinder_order values(seq_cylinder_order.nextval, '2008-12-21', 20, 60, 1728000, 1, 9);
insert into cylinder_order values(seq_cylinder_order.nextval, '2010-4-25', 50, 20, 660000, 1, 9);
insert into cylinder_order values(seq_cylinder_order.nextval, '2000-2-11', 3, 2, 24400, 4, 10);
insert into cylinder_order values(seq_cylinder_order.nextval, '2007-11-24', 13, 14, 334600, 3, 10);
insert into cylinder_order values(seq_cylinder_order.nextval, '2009-7-16', 20, 60, 2052000, 3, 10);
insert into cylinder_order values(seq_cylinder_order.nextval, '2011-2-12', 50, 10, 332000, 2, 10);
insert into cylinder_order values(seq_cylinder_order.nextval, '2015-5-12', 185, 3, 1680000, 3, 10);
insert into cylinder_order values(seq_cylinder_order.nextval, '2009-2-31', 20, 90, 2547000, 1, 11);
insert into cylinder_order values(seq_cylinder_order.nextval, '2010-3-11', 50, 10, 398000, 3, 11);
insert into cylinder_order values(seq_cylinder_order.nextval, '2001-9-2', 3, 3, 39000, 2, 12);
insert into cylinder_order values(seq_cylinder_order.nextval, '2008-10-2', 20, 120, 3108000, 4, 12);
insert into cylinder_order values(seq_cylinder_order.nextval, '2011-7-3', 50, 20, 632000, 3, 12);
insert into cylinder_order values(seq_cylinder_order.nextval, '2003-5-2', 5, 3, 55200, 4, 13);
insert into cylinder_order values(seq_cylinder_order.nextval, '2007-5-14', 13, 14, 365400, 2, 13);
insert into cylinder_order values(seq_cylinder_order.nextval, '2009-7-25', 20, 110, 2871000, 4, 13);
insert into cylinder_order values(seq_cylinder_order.nextval, '2011-8-17', 50, 20, 718000, 4, 13);
insert into cylinder_order values(seq_cylinder_order.nextval, '2012-1-1', 100, 2, 720000, 2, 13);
insert into cylinder_order values(seq_cylinder_order.nextval, '2001-1-27', 3, 1, 13500, 2, 14);
insert into cylinder_order values(seq_cylinder_order.nextval, '2008-10-16', 20, 60, 1926000, 2, 14);
insert into cylinder_order values(seq_cylinder_order.nextval, '2010-11-22', 50, 10, 356000, 2, 14);
insert into cylinder_order values(seq_cylinder_order.nextval, '2013-9-23', 100, 2, 640000, 4, 14);
insert into cylinder_order values(seq_cylinder_order.nextval, '2016-8-1', 200, 1, 780000, 3, 14);

insert into gas_order values(seq_gas_order.nextval, '2005-8-31', '프로판', 1100, 1364000, 2, 1);
insert into gas_order values(seq_gas_order.nextval, '2011-10-30', '부탄', 1000, 1280000, 4, 1);
insert into gas_order values(seq_gas_order.nextval, '2007-5-13', '프로판', 1200, 1368000, 9, 2);
insert into gas_order values(seq_gas_order.nextval, '2014-2-28', '부탄', 2500, 3175000, 7, 2);
insert into gas_order values(seq_gas_order.nextval, '2003-4-6', '프로판', 2100, 2478000, 5, 3);
insert into gas_order values(seq_gas_order.nextval, '2016-6-25', '부탄', 1200, 1452000, 11, 3);
insert into gas_order values(seq_gas_order.nextval, '2004-3-2', '프로판', 1100, 1309000, 4, 4);
insert into gas_order values(seq_gas_order.nextval, '2015-6-20', '부탄', 1100, 1452000, 8, 4);
insert into gas_order values(seq_gas_order.nextval, '2007-8-8', '프로판', 2700, 3024000, 6, 5);
insert into gas_order values(seq_gas_order.nextval, '2013-10-29', '부탄', 2500, 3225000, 3, 5);
insert into gas_order values(seq_gas_order.nextval, '2002-12-14', '프로판', 1300, 1430000, 14, 6);
insert into gas_order values(seq_gas_order.nextval, '2019-12-23', '부탄', 1900, 2451000, 6, 6);
insert into gas_order values(seq_gas_order.nextval, '2008-7-19', '프로판', 2900, 3248000, 12, 7);
insert into gas_order values(seq_gas_order.nextval, '2014-5-22', '부탄', 2500, 3300000, 9, 7);
insert into gas_order values(seq_gas_order.nextval, '2000-4-25', '프로판', 1500, 1845000, 1, 8);
insert into gas_order values(seq_gas_order.nextval, '2018-11-5', '부탄', 1700, 2159000, 11, 8);
insert into gas_order values(seq_gas_order.nextval, '2003-5-16', '프로판', 1500, 1740000, 2, 9);
insert into gas_order values(seq_gas_order.nextval, '2012-1-3', '부탄', 2900, 3857000, 14, 9);
insert into gas_order values(seq_gas_order.nextval, '2006-2-23', '프로판', 2400, 2688000, 10, 10);
insert into gas_order values(seq_gas_order.nextval, '2012-10-25', '부탄', 2800, 3612000, 11, 10);
insert into gas_order values(seq_gas_order.nextval, '2005-4-29', '프로판', 2500, 2950000, 11, 11);
insert into gas_order values(seq_gas_order.nextval, '2013-11-6', '부탄', 2500, 3425000, 13, 11);
insert into gas_order values(seq_gas_order.nextval, '2000-8-7', '프로판', 1700, 1989000, 12, 12);
insert into gas_order values(seq_gas_order.nextval, '2016-4-11', '부탄', 2800, 3640000, 2, 12);
insert into gas_order values(seq_gas_order.nextval, '2003-3-21', '프로판', 1400, 1792000, 7, 13);
insert into gas_order values(seq_gas_order.nextval, '2015-9-10', '부탄', 1600, 1984000, 12, 13);
insert into gas_order values(seq_gas_order.nextval, '2004-1-8', '프로판', 1100, 1210000, 12, 14);
insert into gas_order values(seq_gas_order.nextval, '2016-6-13', '부탄', 2500, 3225000, 10, 14);

insert into charge values
(seq_charge.nextval, '2001-5-3', 4,  4*(select gprice from gas where gno = 1), 1,3);
insert into charge values
(seq_charge.nextval, '2011-8-26', 26,  26*(select gprice from gas where gno = 2), 2,13);
insert into charge values
(seq_charge.nextval, '2007-12-22', 12,  12*(select gprice from gas where gno = 3), 3,24);
insert into charge values
(seq_charge.nextval, '2018-1-27', 35,  35*(select gprice from gas where gno = 4), 4,4);
insert into charge values
(seq_charge.nextval, '2003-6-5', 39,  39*(select gprice from gas where gno = 5), 5,24);
insert into charge values
(seq_charge.nextval, '2011-1-31', 27,  27*(select gprice from gas where gno = 6), 6,21);
insert into charge values
(seq_charge.nextval, '2002-10-15', 1,  1*(select gprice from gas where gno = 7), 7,10);
insert into charge values
(seq_charge.nextval, '2018-10-14', 3,  3*(select gprice from gas where gno = 8), 8,13);
insert into charge values
(seq_charge.nextval, '2002-2-30', 17,  17*(select gprice from gas where gno = 9), 9,23);
insert into charge values
(seq_charge.nextval, '2016-9-16', 24,  24*(select gprice from gas where gno = 10), 10,25);
insert into charge values
(seq_charge.nextval, '2005-4-18', 42,  42*(select gprice from gas where gno = 11), 11,18);
insert into charge values
(seq_charge.nextval, '2014-6-17', 40,  40*(select gprice from gas where gno = 12), 12,13);
insert into charge values
(seq_charge.nextval, '2000-4-7', 44,  44*(select gprice from gas where gno = 13), 13,5);
insert into charge values
(seq_charge.nextval, '2014-8-24', 49,  49*(select gprice from gas where gno = 14), 14,1);
insert into charge values
(seq_charge.nextval, '2001-8-6', 18,  18*(select gprice from gas where gno = 15), 15,17);
insert into charge values
(seq_charge.nextval, '2011-7-23', 1,  1*(select gprice from gas where gno = 16), 16,5);
insert into charge values
(seq_charge.nextval, '2008-5-18', 21,  21*(select gprice from gas where gno = 17), 17,2);
insert into charge values
(seq_charge.nextval, '2015-6-25', 32,  32*(select gprice from gas where gno = 18), 18,4);
insert into charge values
(seq_charge.nextval, '2000-3-16', 26,  26*(select gprice from gas where gno = 19), 19,4);
insert into charge values
(seq_charge.nextval, '2019-9-9', 21,  21*(select gprice from gas where gno = 20), 20,2);
insert into charge values
(seq_charge.nextval, '2000-9-18', 20,  20*(select gprice from gas where gno = 21), 21,4);
insert into charge values
(seq_charge.nextval, '2018-7-11', 24,  24*(select gprice from gas where gno = 22), 22,22);
insert into charge values
(seq_charge.nextval, '2004-4-2', 3,  3*(select gprice from gas where gno = 23), 23,14);
insert into charge values
(seq_charge.nextval, '2010-9-4', 1,  1*(select gprice from gas where gno = 24), 24,15);
insert into charge values
(seq_charge.nextval, '2001-9-3', 8,  8*(select gprice from gas where gno = 25), 25,2);
insert into charge values
(seq_charge.nextval, '2019-3-3', 44,  44*(select gprice from gas where gno = 26), 26,24);
insert into charge values
(seq_charge.nextval, '2002-8-2', 24,  24*(select gprice from gas where gno = 27), 27,4);
insert into charge values
(seq_charge.nextval, '2018-11-15', 31,  31*(select gprice from gas where gno = 28), 28,5);

insert into payment values(seq_payment.nextval, '2000-4-23', null);
insert into payment values(seq_payment.nextval, '2001-2-5', null);
insert into payment values(seq_payment.nextval, '2002-9-15', null);
insert into payment values(seq_payment.nextval, '2003-2-24', null);
insert into payment values(seq_payment.nextval, '2004-8-13', null);
insert into payment values(seq_payment.nextval, '2005-5-27', null);
insert into payment values(seq_payment.nextval, '2006-9-26', null);
insert into payment values(seq_payment.nextval, '2007-10-26', null);
insert into payment values(seq_payment.nextval, '2008-2-24', null);
insert into payment values(seq_payment.nextval, '2009-7-19', null);
insert into payment values(seq_payment.nextval, '2010-4-2', null);
insert into payment values(seq_payment.nextval, '2011-1-30', null);
insert into payment values(seq_payment.nextval, '2012-5-19', null);
insert into payment values(seq_payment.nextval, '2013-8-18', null);

insert into sale values(seq_sale.nextval, 1, 2, 1, 19);
insert into sale values(seq_sale.nextval, 1, 3, 1, 25);
insert into sale values(seq_sale.nextval, 17, 4, 1, 19);
insert into sale values(seq_sale.nextval, 49, 5, 1, 7);
insert into sale values(seq_sale.nextval, 5, 6, 1, 18);
insert into sale values(seq_sale.nextval, 1, 7, 1, 17);
insert into sale values(seq_sale.nextval, 1, 8, 1, 10);
insert into sale values(seq_sale.nextval, 1, 9, 1, 25);
insert into sale values(seq_sale.nextval, 1, 2, 2, 24);
insert into sale values(seq_sale.nextval, 2, 3, 2, 23);
insert into sale values(seq_sale.nextval, 2, 4, 2, 10);
insert into sale values(seq_sale.nextval, 20, 5, 2, 5);
insert into sale values(seq_sale.nextval, 1, 7, 2, 19);
insert into sale values(seq_sale.nextval, 2, 8, 2, 14);
insert into sale values(seq_sale.nextval, 2, 9, 2, 21);
insert into sale values(seq_sale.nextval, 2, 1, 3, 25);
insert into sale values(seq_sale.nextval, 2, 2, 3, 2);
insert into sale values(seq_sale.nextval, 12, 4, 3, 2);
insert into sale values(seq_sale.nextval, 26, 5, 3, 9);
insert into sale values(seq_sale.nextval, 9, 6, 3, 24);
insert into sale values(seq_sale.nextval, 2, 7, 3, 2);
insert into sale values(seq_sale.nextval, 2, 8, 3, 4);
insert into sale values(seq_sale.nextval, 2, 9, 3, 3);
insert into sale values(seq_sale.nextval, 2, 1, 4, 9);
insert into sale values(seq_sale.nextval, 1, 2, 4, 15);
insert into sale values(seq_sale.nextval, 2, 3, 4, 19);
insert into sale values(seq_sale.nextval, 14, 4, 4, 2);
insert into sale values(seq_sale.nextval, 48, 5, 4, 12);
insert into sale values(seq_sale.nextval, 6, 6, 4, 15);
insert into sale values(seq_sale.nextval, 1, 7, 4, 20);
insert into sale values(seq_sale.nextval, 1, 8, 4, 3);
insert into sale values(seq_sale.nextval, 2, 9, 4, 24);
insert into sale values(seq_sale.nextval, 2, 1, 5, 13);
insert into sale values(seq_sale.nextval, 1, 2, 5, 13);
insert into sale values(seq_sale.nextval, 2, 3, 5, 15);
insert into sale values(seq_sale.nextval, 19, 4, 5, 14);
insert into sale values(seq_sale.nextval, 43, 5, 5, 6);
insert into sale values(seq_sale.nextval, 1, 6, 5, 7);
insert into sale values(seq_sale.nextval, 2, 7, 5, 5);
insert into sale values(seq_sale.nextval, 1, 9, 5, 17);
insert into sale values(seq_sale.nextval, 3, 1, 6, 19);
insert into sale values(seq_sale.nextval, 1, 2, 6, 24);
insert into sale values(seq_sale.nextval, 1, 3, 6, 12);
insert into sale values(seq_sale.nextval, 12, 4, 6, 24);
insert into sale values(seq_sale.nextval, 26, 5, 6, 4);
insert into sale values(seq_sale.nextval, 7, 6, 6, 7);
insert into sale values(seq_sale.nextval, 1, 8, 6, 22);
insert into sale values(seq_sale.nextval, 1, 9, 6, 10);
insert into sale values(seq_sale.nextval, 2, 2, 7, 16);
insert into sale values(seq_sale.nextval, 2, 4, 7, 15);
insert into sale values(seq_sale.nextval, 25, 5, 7, 17);
insert into sale values(seq_sale.nextval, 5, 6, 7, 4);
insert into sale values(seq_sale.nextval, 1, 7, 7, 2);
insert into sale values(seq_sale.nextval, 2, 8, 7, 18);
insert into sale values(seq_sale.nextval, 1, 9, 7, 11);
insert into sale values(seq_sale.nextval, 1, 1, 8, 8);
insert into sale values(seq_sale.nextval, 2, 2, 8, 13);
insert into sale values(seq_sale.nextval, 1, 3, 8, 7);
insert into sale values(seq_sale.nextval, 13, 4, 8, 13);
insert into sale values(seq_sale.nextval, 48, 5, 8, 22);
insert into sale values(seq_sale.nextval, 2, 8, 8, 3);
insert into sale values(seq_sale.nextval, 2, 9, 8, 22);
insert into sale values(seq_sale.nextval, 3, 1, 9, 13);
insert into sale values(seq_sale.nextval, 1, 3, 9, 1);
insert into sale values(seq_sale.nextval, 17, 4, 9, 2);
insert into sale values(seq_sale.nextval, 47, 5, 9, 16);
insert into sale values(seq_sale.nextval, 9, 6, 9, 7);
insert into sale values(seq_sale.nextval, 1, 7, 9, 9);
insert into sale values(seq_sale.nextval, 2, 9, 9, 9);
insert into sale values(seq_sale.nextval, 2, 3, 10, 6);
insert into sale values(seq_sale.nextval, 47, 5, 10, 14);
insert into sale values(seq_sale.nextval, 9, 6, 10, 7);
insert into sale values(seq_sale.nextval, 1, 7, 10, 7);
insert into sale values(seq_sale.nextval, 2, 8, 10, 8);
insert into sale values(seq_sale.nextval, 2, 9, 10, 3);
insert into sale values(seq_sale.nextval, 1, 1, 11, 17);
insert into sale values(seq_sale.nextval, 1, 2, 11, 16);
insert into sale values(seq_sale.nextval, 7, 4, 11, 9);
insert into sale values(seq_sale.nextval, 49, 5, 11, 18);
insert into sale values(seq_sale.nextval, 7, 6, 11, 18);
insert into sale values(seq_sale.nextval, 2, 7, 11, 19);
insert into sale values(seq_sale.nextval, 2, 9, 11, 14);
insert into sale values(seq_sale.nextval, 1, 1, 12, 9);
insert into sale values(seq_sale.nextval, 2, 2, 12, 19);
insert into sale values(seq_sale.nextval, 1, 3, 12, 16);
insert into sale values(seq_sale.nextval, 12, 4, 12, 24);
insert into sale values(seq_sale.nextval, 30, 5, 12, 13);
insert into sale values(seq_sale.nextval, 6, 6, 12, 18);
insert into sale values(seq_sale.nextval, 2, 8, 12, 8);
insert into sale values(seq_sale.nextval, 2, 9, 12, 15);
insert into sale values(seq_sale.nextval, 4, 1, 13, 19);
insert into sale values(seq_sale.nextval, 2, 2, 13, 21);
insert into sale values(seq_sale.nextval, 2, 3, 13, 12);
insert into sale values(seq_sale.nextval, 17, 4, 13, 8);
insert into sale values(seq_sale.nextval, 38, 5, 13, 15);
insert into sale values(seq_sale.nextval, 3, 6, 13, 8);
insert into sale values(seq_sale.nextval, 1, 7, 13, 6);
insert into sale values(seq_sale.nextval, 1, 8, 13, 25);
insert into sale values(seq_sale.nextval, 1, 9, 13, 21);
insert into sale values(seq_sale.nextval, 2, 1, 14, 20);
insert into sale values(seq_sale.nextval, 17, 5, 14, 17);
insert into sale values(seq_sale.nextval, 1, 6, 14, 8);
insert into sale values(seq_sale.nextval, 2, 8, 14, 1);

update payment set psum =(select sum(c.cprice * s.squantity)from cylinder c join sale s on c.cno = s.cno where pno=1) where pno =1;
update payment set psum =(select sum(c.cprice * s.squantity)from cylinder c join sale s on c.cno = s.cno where pno=2) where pno =2;
update payment set psum =(select sum(c.cprice * s.squantity)from cylinder c join sale s on c.cno = s.cno where pno=3) where pno =3;
update payment set psum =(select sum(c.cprice * s.squantity)from cylinder c join sale s on c.cno = s.cno where pno=4) where pno =4;
update payment set psum =(select sum(c.cprice * s.squantity)from cylinder c join sale s on c.cno = s.cno where pno=5) where pno =5;
update payment set psum =(select sum(c.cprice * s.squantity)from cylinder c join sale s on c.cno = s.cno where pno=6) where pno =6;
update payment set psum =(select sum(c.cprice * s.squantity)from cylinder c join sale s on c.cno = s.cno where pno=7) where pno =7;
update payment set psum =(select sum(c.cprice * s.squantity)from cylinder c join sale s on c.cno = s.cno where pno=8) where pno =8;
update payment set psum =(select sum(c.cprice * s.squantity)from cylinder c join sale s on c.cno = s.cno where pno=9) where pno =9;
update payment set psum =(select sum(c.cprice * s.squantity)from cylinder c join sale s on c.cno = s.cno where pno=10) where pno =10;
update payment set psum =(select sum(c.cprice * s.squantity)from cylinder c join sale s on c.cno = s.cno where pno=11) where pno =11;
update payment set psum =(select sum(c.cprice * s.squantity)from cylinder c join sale s on c.cno = s.cno where pno=12) where pno =12;
update payment set psum =(select sum(c.cprice * s.squantity)from cylinder c join sale s on c.cno = s.cno where pno=13) where pno =13;
update payment set psum =(select sum(c.cprice * s.squantity)from cylinder c join sale s on c.cno = s.cno where pno=14) where pno =14;

select *
from employee
where sno = 2;

select ename, hiredate, job ,salary
from employee
where job = '사장';

select count(ename)
from employee
where sno = 10;

select eno, sum(osum)
from cylinder_order
group by eno;

select cusno, sum(csum)
from charge
group by cusno
order by cusno;

select c.cvoluem as 용량, s.squantity as 수량, c.cprice* s.squantity as 가격 
from cylinder c join sale s
on c.cno = s.cno
where pno = 10;