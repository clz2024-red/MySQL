/***********************************************
* 복습
***********************************************/
-- 기본구조 select, from
select *
from employees;

-- mysql은 from 절 생략가능
select 	now();

-- 가상의 테이블 dual
select 	now()
from dual;

-- 4칙연산 
select 	first_name, 
		salary,
        salary*12
from employees;

-- 컬럼 합치기
select 	concat(first_name, '-' , last_name) as name,
        salary,
        salary*12
from employees;

-- selec절에 컬럼명이 아닌 값을 사용했을때
select first_name, '남' as '성 별'
from employees;

-- where 절
select first_name, salary
from employees
where salary != 17000;

-- 비교연산자, 조건이 여려개일때, between, in

-- -----------------------------------------------
/***********************************************
* 02일차 수업
***********************************************/

-- like

select 	first_name, 
		last_name,
        salary
from employees
where first_name like 'L%';

#이름에 am 을 포함한 사원의 이름과 월급을 출력하세요
select first_name, salary
from employees
where first_name like '%am%';

#이름의 두번째 글자가 a 인 사원의 이름과 월급을 출력하세요
select first_name, salary
from employees
where first_name like '_a%';

#이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select first_name, salary
from employees
where first_name like '___a%';

#이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select *
from employees
where first_name like '_a__';


-- null
select 	first_name, 
		salary,
        commission_pct,
        salary*commission_pct
from employees
where salary between 13000 and 15000;

-- is null, is not null
select *
from employees
where commission_pct is null ;   
# 주의  where commission_pct = null

#커미션비율이 있는 사원의 이름과 월급 커미션비율을 출력하세요
select 	first_name,
		salary,
        commission_pct
from employees
where commission_pct is not null ;  


#담당매니저가 없고 커미션비율이 없는 직원의 이름과 매니저아이디 커미션 비율을 출력하세요
select first_name, manager_id, commission_pct
from employees
where manager_id is null
and commission_pct is null;

#부서가 없는 직원의 이름과 월급을 출력하세요
select first_name, salary, department_id
from employees
where department_id is null;

-- ORDER BY 
select first_name, salary 
from employees
where salary >= 10000
order by salary desc;     -- asc  desc

select *
from employees
order by employee_id asc;

select first_name, salary
from employees
order by first_name asc;

select first_name, hire_date
from employees
order by hire_date desc;

select first_name, hire_date, salary
from employees
order by hire_date desc;

-- 1.최근 입사한 순,  2.입사일이 같으면 월급이 많은사람부터
select first_name, hire_date, salary
from employees
order by hire_date desc, salary desc;

#부서번호를 오름차순으로 정렬하고 부서번호, 월급, 이름을 출력하세요
select 	department_id,
		salary,
		first_name
from employees
order by department_id asc;

#월급이 10000 이상인 직원의 이름 월급을 월급이 큰직원부터 출력하세요
select 	first_name,
		salary
from employees
where salary >= 10000
order by salary desc;

#부서번호를 오름차순으로 정렬하고 부서번호가 같으면 월급이 높은 사람부터 
#부서번호 월급 이름을 출력하세요 
select 	department_id, 
		salary, 
        first_name
from employees
order by department_id asc, salary desc;

#직원의 이름, 급여, 입사일을 이름의 알파벳 올림차순으로 출력하세요
select 	first_name,
		salary,
        hire_date
from employees
order by first_name asc;

#직원의 이름, 급여, 입사일을 입사일이 빠른 사람 부터 출력하세요
select 	first_name,
		salary,
        hire_date
from employees
order by hire_date asc; 



select  first_name, 
		hire_date date, 
	    department_id 
from employees 
where hire_date >='2007-01-01'
order by date desc;

/***********************************************
* 02일차 수업  
***********************************************/
-- 단일행 함수
-- 단일행 함수 > 숫자함수 

-- round() :반올림
select 	round(123.123, 2),
		round(123.126, 2),
        round(234.567, 0),
        round(123.456, 0),
        round(123.456),
        round(123.126, -1),
        round(125.126, -1),
        round(123.126, -2)
from dual;

-- tip 콤마 앞에 붙이기
select 	 round(123.123, 2)
		,round(123.456)
        ,round(123.456, 0)
        ,round(234.567, 0)
        ,round(123.126, -2)
        ,round(123.126, -1)
        ,round(125.126, -1)
        ,round(123.126, 2)
from dual;

-- ceil(): 올림
select 	ceil(123.456),  -- 124
		ceil(123.789),  -- 124 
        ceil(123.7892313), -- 124
        ceil(987.1234),  -- 988
        ceil(987.1234)  -- 988
;

-- floor(): 내림
select 	floor(123.456),      -- 123
		floor(123.789),      -- 123
        floor(123.7892313),  -- 123
        floor(987.1234)      -- 987
;

-- truncate(): 자리수 버림
select 	truncate(1234.34567, 2),		
		truncate(1234.34567, 3),
        truncate(1234.34567, 0),
        truncate(1235.34567, -2)
;

select 	first_name, 
		salary, 
		ceil(salary/30) as 일당
from employees
order by salary desc;

-- POWER(숫자, n),  POW(숫자, n): 숫자의 n승   
select  pow(12,2), power(12,2);

-- SQRT(숫자): 숫자의 제곱근  
select  sqrt(144);

-- SIGN(숫자): 숫자가 음수이면 -1, 0이면 0, 양수이면 1  
select 	sign(123),    -- 1
		sign(0),      -- 0
        sign(-123)    -- -1
;

-- ABS(숫자): 절대값  
select 	abs(123),
		abs(0),
        abs(-123)
;

-- GREATEST(x, y, z, ...): 괄호안의 값중 가장 큰값  
select  greatest(2, 0, -2),   -- 2
		greatest(4, 3.2, 5.25),  -- 5.25
		greatest('B', 'A', 'C', 'c')
;

select 	employee_id,
		manager_id,
        department_id,
		greatest(employee_id, manager_id, department_id)
from employees;


select 	least(2, 0, -2),
		least(4, 3.2, 5.25),         
		least('B', 'A', 'C', 'c')
from dual;

select 	employee_id,
		manager_id,
        department_id,
		least(employee_id, manager_id, department_id)
from employees;

-- 단일행 함수 > 문자함수 
-- CONCAT(str1, str2, ..., strn): str1, str2, ..., strn을 연결  
select concat('안녕', '하세요')
from dual;

select concat('안녕', '-', '"하"세요')
from dual;
select concat('안녕', '-', "'하'세요")
from dual;

select concat(first_name,' ', last_name)
from employees;



-- CONCAT_WS(s, str1, str2, ..., strn): str1, str2, ..., strn을 연결할때 사이에 s 로 연결
select concat_ws('*****', 'abc', '123', '가나다')
from dual;

select concat_ws('-', first_name, last_name, salary)
from employees;

-- LCASE(str) 또는 LOWER(str): str의 모든 대문자를 소문자로 변환
select 	first_name,
		lcase(first_name),
        lower(first_name),
        lower('ABCabc!@#$'),
        lower('가나다라마사바')
from employees;

-- UCASE(str) 또는 UPPER(str): str의 모든 소문자를 대문자로 변환
select 	first_name,
		ucase(first_name),
        upper(first_name),
        upper('ABCabc!@#$'),
        upper('가나다라마사바')
from employees;

-- 문자갯수
select 	first_name,
		length(first_name),
        char_length(first_name),
        character_length(first_name)
from employees;


select 	length('a'),
        char_length('a'),
        character_length('a')
from dual;

select 	length('가'),
        char_length('가'),
        character_length('가')
from dual;

-- SUBSTRING(str, pos, len) 또는 SUBSTR(str, pos, len):
select 	first_name,
		substr(first_name, 1, 3),
        substr(first_name, 2, 2),
        substr(first_name, -3, 2)
from employees
where department_id = 100;

select 	substr('901112-1234567', 8, 1),     -- 성별  
 	    substr('901112-1234567', -7, 1),    -- 성별 뒤에서 계산
        substr('901112-1234567', 1, 2),     -- 년도
        substr('901112-1234567', 3, 2),     -- 월  
        substr('901112-1234567', 5, 2)      -- 일
from dual;


-- LPAD(str, len, padstr):  RPAD(str, len, padstr)
select 	first_name,
		lpad(first_name, 10, '*'),
        rpad(first_name, 10, '*')
from employees;

-- TRIM(str)
select 	concat('|',  '          안녕하세요          ', '|'),
		concat('|',  trim('          안녕하세요          '), '|'),
        concat('|',  ltrim('          안녕하세요          '), '|'),
        concat('|',  rtrim('          안녕하세요          '), '|')
from dual;

-- REPLACE(str, from_str, to_str): str에서 from_str을 to_str로 변경
select 	first_name,
		replace(first_name, 'a', '*'),
        replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id = 100;


-- 단일행 함수 > 날짜함수 
select current_date(), curdate();

select current_time(), curtime();

select current_timestamp(), now();

-- 날짜 시간 계산 함수
select  adddate('2021-06-20 00:00:00', INTERVAL 1 YEAR),  
		adddate('2021-06-20 00:00:00', INTERVAL 1 MONTH),  
		adddate('2021-06-20 00:00:00', INTERVAL 1 WEEK),  
		adddate('2021-06-20 00:00:00', INTERVAL 1 DAY),  
		adddate('2021-06-20 00:00:00', INTERVAL 1 HOUR),  
		adddate('2021-06-20 00:00:00', INTERVAL 1 MINUTE),  
		adddate('2021-06-20 00:00:00', INTERVAL 1 SECOND)
;

select  subdate('2021-06-20 00:00:00', INTERVAL 1 YEAR),  
		subdate('2021-06-20 00:00:00', INTERVAL 1 MONTH),  
		subdate('2021-06-20 00:00:00', INTERVAL 1 WEEK),  
		subdate('2021-06-20 00:00:00', INTERVAL 1 DAY),  
		subdate('2021-06-20 00:00:00', INTERVAL 1 HOUR),  
		subdate('2021-06-20 00:00:00', INTERVAL 1 MINUTE),  
		subdate('2021-06-20 00:00:00', INTERVAL 1 SECOND)
;

-- DATEDIFF(): TIMEDIFF(): 
select	datediff('2021-06-21 01:05:05', '2021-06-21 01:00:00'),	
		timediff('2021-06-21 01:05:05', '2021-06-19 01:00:00')
from dual;


select 	first_name,
		hire_date,
        round(datediff(now(), hire_date)/365, 1) workday
from employees
order by workday desc;


-- 변환함수
-- DATE_FORMAT(date, format): date를 format형식으로 변환
select 	now(),
		date_format(now(), '%y-%m-%d %H:%i:%s' ),
        date_format(now(), '%Y-%m-%d(%a) %H:%i:%s %p')
from dual;


-- STR_TO_DATE(str, format): str를 format형식으로 변환
-- 날짜 모양의 문잘열을 날짜형으로 인식하지 못해 -가 계산되지 않는다
select datediff('2021-Jun-04', '2021-06-01') 
from dual;

-- '2021-Jun-04'을 '%Y-%b-%d' 형식으로 해석해서 올바른 날짜형으로 반환
select str_to_date('2021-Jun-04', '%Y-%b-%d')
from dual;

-- '2021-06-01', '%Y-%m-%d' 형식으로 해석해서 올바른 날짜형으로 반환
select str_to_date('2021-06-01', '%Y-%m-%d')
from dual;

-- 각각의 문자열을 날짜형으로 변환시켜서 계산함
select datediff(str_to_date('2021-Jun-04', '%Y-%b-%d'), str_to_date('2021-06-01', '%Y-%m-%d')) 
from dual;

-- 상식선의 날짜표시인 경우 그냥 계산된다
select datediff('2021-06-04', '2021/06/01')
from dual;

-- FORMAT(숫자, p): 숫자에 콤마(,) 를 추가, 소수점 p자리까지 출력
select  format(1234567.89, 2),
		format(1234567.89, 0),
        format(1234567.89, -2)
from dual;

-- ifnull() 값이 null일때 기본값 세팅
select first_name, ifnull(commission_pct, 0)
from employees;




