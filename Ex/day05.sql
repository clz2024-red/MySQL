/***********************************************
* 05일차 수업   SubQuery
***********************************************/
/*
'Den' 보다 월급을 많은 사람의 이름과 월급은?

1. 'Den'의 월급을 구한다.   5000
2. 직원테이블 에서 월급이 5000보다 많은 사람을 구한다
3. 질문을 합친다
*/
-- 1. 'Den'의 월급을 구한다.
select salary
from employees
where first_name = 'Den'; -- 11000

-- 직원테이블 에서 월급이 11000보다 많은 사람을 구한다
select *
from employees
where salary >= (11000);

-- 합치기
select first_name, salary
from employees
where salary >= (select salary
                 from employees
                 where first_name = 'Den');


/*
월급을 가장 적게 받는 사람의 이름, 월급, 사원번호는?
1. 직원테이블에서 월급 1000원을 받는 사람을 구한다
2. 1000<-- 직원테이블에서 최소월급
3. 두개를 합친다
*/
-- 구조
select *
from employees
where salary = (최소월급);

-- 최소월급
select min(salary)
from employees;

-- 합치기
select first_name, salary, employee_id
from employees
where salary = (select min(salary)
                from employees);


/*
평균 월급보다 적게 받는 사람의 이름, 월급을 출력하세요?
1. 직원테이블에서 평균월급을 구한다 avg()이용-->10000
2. 직원테이블에서 월급<10000 인 직원을 구한다
3. 질문을 1개로 합친다
*/

-- 평균월급    -- 6461.831776
select avg(salary)
from employees
;

-- 직원테이블에서 6461.831776 보다 월급이 작은직원
select *
from employees
where salary < 6461.831776
;

-- 합치기
select  first_name, 
        salary 
from employees
where salary < (select avg(salary)
                from employees)
;


/*
부서번호가 110인 직원의 월급와 같은 월급을 받는 
모든 직원의 사번, 이름, 월급를 출력하세요
1. 전체: 직원테이블에서 월급이 10000인 직원 구하기
2. 부서번호가 110인 직원의 월급 구하기  --> 10000
3. 합치기
*/
-- 직원테이블에서 월급이 10000인 직원 구하기
select *
from employees
where salary = (10000 --> 부서번호가 110인 직원의 월급 );

-- 부서번호가 110인 직원의 월급 구하기
select salary
from employees
where department_id = 110
; -- 12008.00, 8300.00  결과의 row 1개 이상일때  

select *
from employees
where salary = (10000 --> 부서번호가 110인 직원의 월급이 여러개이다 );


select *
from employees
where salary in (12008.00, 8300.00);


select  employee_id,
        first_name,
        salary
from employees
where salary in (select salary
                 from employees
                 where department_id = 110)
;

select employee_id,
       first_name,
       salary
from employees
where salary = 12008.00
or salary = 8300.00;

/*
각 부서별로 최고월급를 받는 사원의 이름과 월급을 출력하세요
1. 각부서별 최고월급을 구한다 --> 1이상  100부서는 10000,   200번부서는 20000)
2. 직원테이블에서 월급이 10000 또는 20000인 구한다
3. 합친다
*/
-- 각 부서별 최고월급
select max(salary) 
from employees
group by department_id
;

-- 전체
select *
from employees
where salary in (각부서별 최고월급)
;

-- 합치기
-- 부서번호를 제외하고 부서의 최고월급값만 가져와서 비교
-- 다른부서의 같은 월급의 받는 직원도 결과에 포함된다
-- where절에서 부서번호와 월급이 동시에 만족하는 직원만 결과에 포함되어야 한다
select  first_name,
        salary,
        department_id
from employees
where salary in (select max(salary) 
                 from employees
                 group by department_id)
;               
                
-- in 문법 확장 (문법테스트)
-- 여러가지 컬럼을 동시에 비교가능, 컬럼의 갯수와 데이터의 갯수가 일치해야 한다
select  first_name,
        salary,
        department_id
from employees
where (department_id, salary) in ( (10, 4400), (20, 13000), (30,11000) )
;

-- 다시 합치기
-- where절의 in 문법이 컬럼2개(department_id, salary)를 비교하는것으로 변경
select  first_name,
        salary,
        department_id
from employees
where (department_id, salary) in ( select department_id, max(salary) 
                                   from employees
                                   group by department_id  )
;



/*
부서별 최고값 이름
부서별 최고값 이름
월급 최저인 직원의 월급과 이름
*/
select min(salary), first_name
from employees;





