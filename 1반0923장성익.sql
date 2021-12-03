--4장 다양한 함수
--문자 함수
--문자 길이 반환 함수 : length/lengthb
select length('Oracle Mania'), length('오라클 매니아')
from dual;

select lengthb('Oracle Mania'), lengthb('오라클 매니아') --한글 1글자는 3byte로 처리
from dual;

--문자 추출하기 : substr/substrb
select substr('Oracle Mania',4 , 3), substr('Oracle Mania',-4, 3)
from dual;

--이름이 N으로 끝나는 사원 검색 : substr 사용
select *
from employee
where substr (ename, -1, 1) = 'N';

--87년도에 입사한 사원 검색
select *
from employee
where substr(hiredate, 1, 2) = '87';

select substrb('오라클매니아',4 , 6), substrb('오라클매니아',-6, 3)
from dual;

--특정 기호로 채우기 : lpad / rpad
select lpad(salary, 10, '*')
from employee;

--앞뒤 공백 제거하기 : trim / ltrim / rtrim
select trim(' Oracle Mania ')
from dual;

--숫자 함수
--반올림, 버림 : round / trunc
select 765.7654, round(765.7654), round(765.7654, 2), round(765.7654, -2)
from dual;

select 765.7654, trunc(765.7654), trunc(765.7654, 2), trunc(765.7654, -2)
from dual;

--나누기의 나머지를 구하기 : mod
select mod(31, 2), mod(31, 5), mod(31, 8)
from dual;

--사원의 급여를 500으로 나눈 나머지 구하기
select ename, salary, mod(salary, 500)
from employee;

--날자 함수
--현재 날짜 표시하기 : sysdate
select sysdate-1 as 어제, sysdate as 오늘, sysdate +1 as 내일
from dual;

--사원들의 근무일수 계산하기
select ename, round(sysdate - hiredate)as 근무일수
from employee;

--사원들의 근무한 개월 수 구하기 : months_between
select ename, sysdate, hiredate, trunc(months_between(sysdate, hiredate))as근무개월수
from employee;

--형 변환 함수
--to_char() : 날짜를 문자로, 숫자를 문자로 변환
select ename, hiredate, to_char(hiredate, 'yy-mm'),
                        to_char(hiredate, 'yyyy/mm/dd, hh24:mi:ss')
from employee;

--현재 날짜와 시간 출력
select sysdate, to_char(sysdate, 'yyyy/mm/dd, hh24:mi:ss')
from dual;

--급여를 출력하면서 통화기호 덧붙이기
select ename, salary, to_char(salary, 'L999,999')
from employee;

--to_date() : 날짜형으로 변환
--1981년2월29일에 입사한 사원 검색
select ename, hiredate
from employee
where hiredate = to_date(19810220, 'yyyymmdd');

--to_number()
select to_number('100,000', '999,999') - to_number('50,000', '999,999')
from dual;