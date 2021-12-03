--4장 다양한 함수
--일반 함수
--null 값 처리 : nvl() / nvl2()
--사원의 연봉 계산하기
select ename, salary, commission, salary*12+nvl(commission, 0) as 연봉
from employee
order by 연봉 desc;

select ename, salary, commission, nvl2(commission, salary*12+commission, salary*12) as 연봉
from employee --(표현식, null아닐경우, null일경우)
order by 4 desc;

--조건판별하는 switch문 : decode()
--부서 이름 출력하기
select ename, dno, decode(dno, 10, 'ACCOUNTING',
                            20, 'RESARCH',
                            30, 'SALES',
                            40, 'OPERATIONS',
                            'DEFAULT')as 부서명
from employee
order by dno;

--조건판별하는 if else문 : case문 - 관계연산자를 이용해서 다양한 조건식을 작성
--부서 이름 출력하기
select ename, dno, case when dno=10 then 'ACCOUNTING'
                        when dno=20 then 'RESARCH'
                        when dno=30 then 'SALES'
                        when dno=40 then 'OPERATIONS'
                        else 'DEFAULT'
                    end as 부서명
from employee
order by dno;

--혼자해보기
--1번 substr 함수를 사용하여 사원들의 입사 년도와 달만 출력
select substr(hiredate,1,2) as 년도, substr(hiredate,4,2)as 달
from employee;

--2번 substr 함수를 사용하여 4월에 입사한 사원만 출력
select *
from employee
where substr(hiredate, 4, 2) = '04';

--3번 mod 함수를 사용하여 사원번호가 짝수인 사원만 검색
select *
from employee
where mod(eno, 2) = 0;

--4번 입사일을 연도는 2자리(YY), 월은 숫자(MON)로 표시하고 요일은 약어(DY)로 출력
select hiredate, to_char(hiredate, 'yy/Mon/dd DY')
from employee;

--5번 올해 며칠이 지났는지 출력, 올해 며칠이 남았는지 출력
--현재 날짜에서 올해 1월1일을 뺀 결과를 출력, to_date 함수를 사용하여 데이터 형을 일치
select round(sysdate - to_date('2021-01-01', 'YYYY-MM-DD'))as 지난날,
        round(to_date('2021/12/31', 'YYYY/MM/DD') -sysdate)as 남은날
from dual;

--6번 사원들과 직속상관 사번을 출력, 직속상관이 없는 사원은 NULL 대신에 0으로 출력
select eno, ename, nvl(manager, 0)
from employee;

--7번 decode 함수로 직급에 따라 급여를 인상 -->case문으로도 작성해보기
--'ANALYST':200, 'SALESMAN':180, 'MANAGER':150, 'CLERK':100
select eno, ename, job, salary, decode(job, 'ANALYST' , salary+200
                                            'SALESMAN', salary+180
                                            'MANAGER', salary+150
                                            'CLERK', salary+100)
from employee;

