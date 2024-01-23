/***********************************************
* 03일차 수업
***********************************************/
-- 그룹함수

-- 단일행함수
select  first_name,
        salary,
        round(salary, 2)
from employees;


-- 그룹함수
select sum(salary)
from employees;

-- 오류
select 	first_name,
		salary,
        sum(salary)
from employees;
-- ------------------------------
# count()
-- ------------------------------
select *
from employees;

select count(*)
from employees;

select count(first_name)
from employees;

select count(manager_id)
from employees;

select count(commission_pct)
from employees;

select count(*), count(commission_pct)
from employees;


-- 월급이 16000 초과 되는 직원의 수는?
select count(commission_pct)
from employees
where salary > 16000
;

-- ------------------------------
# sum()
-- ------------------------------
select 	count(*), 
		sum(salary),
        sum(employee_id)
from employees
;


-- ------------------------------
# avg()   null 포함여부 주의
-- ------------------------------
select 	count(*),
		sum(salary),
        avg(salary)
from employees
;


-- ------------------------------
# max() / min()
-- ------------------------------
select 	count(*),
		max(salary),
        min(salary)
from employees
;

select max(salary)
from employees
;


-- ------------------------------
# GROUP BY 절
-- ------------------------------
-- 부서번호, 월급 출력
select department_id, salary
from employees
;

-- department_id 로 그룹후 그룹별로 max값과 평균값 출력
-- 그룹번호가 필요 
select max(salary), avg(salary)
from employees
group by department_id
;

-- 그룹에 참여한 컬럼은 select절에 사용할 수 있다, 그룹의 대표값
select department_id, max(salary), avg(salary)
from employees
group by department_id
;

-- 그룹에 참여하지 않는 컬럼명은 사용할 수 없다
select department_id, max(salary), avg(salary), first_name
from employees
group by department_id
;


-- 그룹을 세분화  그룹안에 그룹만들기
-- 그룹에 참여한 컬럼명은 select 절에 사용할 수 있다
select department_id, job_id, max(salary), avg(salary)
from employees
group by department_id, job_id
;


# 월급(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 월급합계를 출력하세요
-- where절에는 그룹함수를 쓸수 없다  
-- 합계를 계산하기전에 where절을 실행한다
select department_id, count(*), sum(salary)
from employees
where sum(salary) >= 20000
group by department_id
;  


-- ------------------------------
# HAVING 절
-- ------------------------------
select department_id, count(*), sum(salary)
from employees
-- where sum(salary) >= 20000
where department_id = 100
group by department_id
having sum(salary) >= 20000
-- and department_id = 100
;  


