use hrdb;
/*****************************
select 문  (조회)
*****************************/

-- select ~ from절
-- 테이블 전체 조회하기
select * from employees;
select * from departments;
select * from locations;
select * from countries;
select * from regions;
select * from jobs;
select * from job_history;
SELECT * fRom joB_History;

-- select 절
select first_name, salary   
from employees;

#모든 직원의 직원아이디(employee_id), 이름 (fisrt_name), 성(last_name) 
#을 출력하세요
select employee_id, first_name, last_name from employees;

#모든 직원의 이름(fisrt_name)과 
#전화번호 입사일 월급을 출력하세요
select first_name, phone_number, hire_date, salary
from employees;


#모든 직원의 이름(first_name)과 성(last_name), 
#월급, 전화번호, 이메일, 입사일을 출력하세요
select 	first_name, 
	last_name, 
        salary, 
        phone_number, 
        email, 
        hire_date 
from employees;

-- 출력할 때 컬럼에 별명 사용하기
#직원아이디, 이름, 월급을 출력하세요. 
#단 직원아이디는 empNO, 이름은 "f-name", 월급은 "월 급" 으로 컬럼명을 출력하세요
select 	employee_id empNO,
	first_name as 'f-name',
        salary as '월 급'
from employees;

#직원의 이름(fisrt_name)과 전화번호, 입사일, 월급 으로 표시되도록 출력하세요
select 	first_name 이름,
	phone_number 전화번호,
        hire_date 입사일,
        salary 월급
from employees;

#직원의 직원아이디를 사 번, 이름(first_name), 성(last_name), 
#월급, 전화번호, 이메일, 입사일로 표시되도록 출력하세요
select 	employee_id '사 번',
	first_name 이름,
        last_name 성,
        salary 월급,
        phone_number 전화번호,
        email 이메일,
        hire_date 입사일
from employees;

-- 산술 연산자 사용하기
select 	first_name,
	salary 월급,
        salary-100 '월급-식대',
        salary*12 연봉,
        salary*12+500 보너스포함,
        salary/30 일급,
        employee_id%3 '워크샵 팀'
from employees;

-- 문자열은 0 으로 처리  --> 오류가 나지 않으므로 확인이 안될 수 있다
select job_id*12
from employees;

-- 컬럼 합치기
select 	first_name, 
	last_name,
	concat(first_name, ' ' , last_name) name,
        concat(first_name, ' ' , last_name, ' hire date is ', hire_date ) name2
from employees;

-- 테이블의 컬럼명테이블의 데이터,  문자열,숫자는 그대로 출력 
select 	first_name,
	salary*12 연봉,
        '(주)개발자' company, 
        3 상태
from employees;

-- 테이블 명 생략가능, 가상의 테이블 dual
select now() ;

select now() 
from dual;

select 123*5;

-- where 절
#부서번호가 10인 사원의 이름을 구하시오
select first_name, department_id
from employees
where department_id = 10;

#월급이 15000 이상인 사원들의 이름과 월급을 출력하세요
select 	first_name, 
	salary
from employees
where salary >= 15000;

#07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select 	first_name,
	hire_date
from employees
where hire_date >= '2007-01-01'
;



#이름이 Lex인 직원의 이름과 월급을 출력하세요  
# - 문자열 대소문자를 구별하지 않는다.  구별하려면 binary 사용
select 	first_name,
	salary
from employees
where first_name = 'Lex'
;

select 	first_name,
	salary
from employees
where binary first_name = 'lex'
;

#월급이 14000이상 17000이하인 사원의
#이름과 월급을 구하시오
select 	first_name,
	salary
from employees
where salary >= 14000
and salary <= 17000
;

#월급이 14000 이하이거나 17000 이상인 사원의 이름과 월급을 출력하세요
select 	first_name,
	salary
from employees
where salary <= 14000
or salary >=17000
;

#입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select 	first_name,
	hire_date
from employees
where hire_date >= '2004-01-01'
and hire_date <= '2005-12-31'
;

-- BETWEEN 연산자로 특정구간 값 출력하기
#월급이 14000 이상 17000이하인 사원의
#이름과 월급을 구하시오
select	first_name,
	salary
from employees
where salary >= 14000
and salary <= 17000
;

select	first_name,
	salary
from employees
where salary between 14000 and 17000
;

select	first_name,
	salary
from employees
where salary between 17000 and 14000
;


-- IN 연산자로 여러 조건을 검사하기
#Neena, Lex, John 의 이름, 성, 월급의
#구하시오
select 	first_name,
	last_name,
        salary
from employees
where first_name = 'Neena'
or first_name = 'Lex'
or first_name = 'John'
or first_name = 'David'
;

select 	first_name,
	last_name,
        salary
from employees
where first_name in ('Neena', 'Lex', 'John', 'David')
;


select 	first_name,
	salary
from employees
where salary = 2100
or salary = 3100
or salary = 4100
or salary = 5100
;

select 	first_name,
	salary
from employees
where salary in (2100, 3100, 4100, 5100)
;



