/***********************************************
* 03일차 수업
***********************************************/
--  그룹함수

--  단일행함수
select  first_name,
        salary,
        round(salary, 2)
from employees;


-- 그룹함수
select sum(salary)
from employees;

-- 오류
select  first_name,
        salary,
        sum(salary)
from employees;

select  first_name,
        salary,
        sum(salary)
from employees;
-- ------------------------------
# count()
-- ------------------------------
select  *
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
select  count(*), 
        sum(salary),
        sum(employee_id)
from employees
;


-- ------------------------------
# avg()   null 포함여부 주의
-- ------------------------------
select  count(*),
        sum(salary),
        avg(salary)
from employees
;


-- ------------------------------
# max() / min()
-- ------------------------------
select  count(*),
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



select  first_name,
        commission_pct,
        if(commission_pct is null ,0 ,1 ) state
from employees;

-- ------------------------------
/*
직원아이디, 월급, 업무아이디, 실제월급(realSalary)을 출력하세요.
실제월급은 job_id 가 'AC_ACCOUNT' 면 월급+월급*0.1,
                  'SA_REP' 월급+월급*0.2,
                  'ST_CLERK' 면 월급+월급*0.3
                  그외에는 월급으로 계산하세요
*/
select  employee_id,
        salary,
        job_id,
        case when job_id = 'AC_ACCOUNT' then salary+salary*0.1
             when job_id = 'SA_REP' then salary+salary*0.2
             when job_id = 'ST_CLERK' then salary+salary*0.3
             else salary
        end as realSalary
from employees
;

/*
직원의 이름, 부서번호, 팀을 출력하세요
팀은 코드로 결정하며 부서코드가 
    10~50 이면 'A-TEAM'
    60~100이면 'B-TEAM'
    110~150이면 'C-TEAM' 
    나머지는 '팀없음' 으로 
출력하세요
*/
select  first_name,
        department_id,
        case when department_id >= 10 and department_id <= 50 then 'A-TEAM'
             when department_id >= 60 and department_id <= 100 then 'B-TEAM'
             when department_id >= 100 and department_id <= 150 then 'C-TEAM'
             else '팀없음'
        end as team
from employees
;

select  first_name,
        department_id,
        case when department_id between 10 and 50 then 'A-TEAM'
             when department_id between 60 and 100 then 'B-TEAM'
             when department_id between 100 and 150 then 'C-TEAM'
             else '팀없음'
        end as team
from employees
;



-- ------------------------------
# join
-- ------------------------------
-- 사원이름, 부서명 , 부서번호 <--- 원하는 결과
-- 데이터가 2개의 테이블(employees, departments)에 나눠져 있다

-- 직원
select *
from employees;

-- 부서
select *
from departments;


-- 2개의 데이블을 합치기 (join)
-- 107*27개의 row값이 생기고
-- 두테이블의 모든 컬럼이 한개로 합쳐진다 
-- (department_id 컬럼은 양쪽테이블에 있음)
select *
from employees, departments
;

-- 원하는 컬럼명만 출력
-- department_id 컬럼때문에 오류(양쪽테이블에 같은 컬럼명으로 존재)
-- 어느테이블의 department_id 컬럼인지 명확하게 표시해야함
select  first_name, 
        department_name, 
        department_id
from employees, departments
; -- 오류

-- 테이블명을 써서 department_id 컬럼 어느테이블인지 표시함
select  first_name, 
        department_name, 
        employees.department_id,
        departments.department_id
from employees, departments
;

-- 테이블 별명쓰기
-- 겹치지 않는 컬럼명은 테이블 별명을 쓰지 않아도 된다
-- 하지만 써도 된다
-- 겹치는 컬럼명은 꼭 써야 된다
select  e.first_name, 
        d.department_name, 
        e.department_id,
        d.department_id
from employees e, departments d
;


select  e.first_name, 
        d.department_name, 
        e.department_id,
        d.department_id
from employees e, departments d
where e.department_id = d.department_id
;

select e.first_name, 
       d.department_name, 
       e.department_id,
       d.department_id
from employees e 
join departments d
   on e.department_id = d.department_id
;

select *
from employees;









-- join
select  e.first_name, 
        d.department_name, 
        e.department_id,
        d.department_id
from employees e, departments d
;

select first_name, department_name, department_id
from employees, departments
;



select 107*27;





