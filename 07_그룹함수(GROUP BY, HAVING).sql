
-- 그룹 함수 AVG, MAX, MIN, SUM, COUNT
-- 그룹화가 되어 있어야 쓸 수 있다.
SELECT
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary)
FROM employees;

SELECT COUNT(*) FROM employees; -- 총 행 데이터의 수
SELECT COUNT(first_name) FROM employees;
SELECT COUNT(commission_pct) FROM employees; 
-- NULL값은 카운트 하지 않음, NULL이 아닌 행의 수
SELECT COUNT(manager_id) FROM employees; -- NULL이 아닌 행의 수

-- 부서별로 그룹화, 그룹함수의 사용
SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id; -- department_id을 기준으로

-- 주의할 점 
-- 그룹 함수는 일반 컬럼과 동시에 그냥 출력할 수는 없습니다.
SELECT
    department_id,
    sum(salary)
FROM employees; -- error

-- GROUP BY절을 사용할 때 GROUP절에 묶이지 않으면 다른 컬럼을 조회할 수 없습니다.
SELECT
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id;
-- error job_id는 그룹화 되지 않아서 안됨 job_id=107개
-- 다른 것들은 그룹화 되어 압축되어 있다 other=12개

-- GROUP BY 2개 이상 사용
SELECT
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id, job_id
-- job_id에 더 맞춰져있다 department_id가 여러개임
ORDER BY department_id; -- department_id 오름차순

-- GROUP BY를 통해 그룹화 할 때 조건을 걸 경우 HAVING을 사용.
SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000;
-- from   groupby   select   having sum

SELECT
    job_id,
    COUNT(*)
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 5;


SELECT
    job_id,
    COUNT(*)
FROM employees
GROUP BY job_id;

-- 부서 아이디가 50 이상인 것들을 그룹화 시키고, 그룹 월급 평균이 5000 이상만 조회
-- 부서 아이디가 50 이상인 WHERE       그룹 월급 평균이 5000 HAVING
SELECT
    department_id,
    AVG(salary) AS 평균
FROM employees
WHERE department_id > 50
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY department_id DESC;


/*
문제 1.
사원 테이블에서 JOB_ID별 사원 수를 구하세요.
사원 테이블에서 JOB_ID별 월급의 평균을 구하세요. 월급의 평균 순으로 내림차순 정렬하세요.
*/
SELECT
    job_id,
    COUNT(*) AS 사원수
FROM employees
GROUP BY job_id;

SELECT
    job_id,
    AVG(salary) AS 평균
FROM employees
GROUP BY job_id
ORDER BY 평균 DESC;


SELECT
    *
FROM employees;

/*
문제 2.
사원 테이블에서 입사 년도 별 사원 수를 구하세요.
(TO_CHAR() 함수를 사용해서 연도만 변환합니다. 그리고 그것을 그룹화 합니다.)
*/
SELECT
    TO_CHAR(hire_date, 'yy') AS 입사년도,
    COUNT(*) AS 사원수
FROM employees
GROUP BY TO_CHAR(hire_date, 'yy')
ORDER BY 입사년도 ASC;


SELECT
    TO_CHAR(hire_id,'99')AS 입사년도
    
FROM employees;


/*
문제 3.
급여가 5000 이상인 사원들의 부서별 평균 급여를 출력하세요. 
단 부서 평균 급여가 7000이상인 부서만 출력하세요.
*/
SELECT
    department_id,
    AVG(salary) AS 평균급여
FROM employees
WHERE salary>=5000
GROUP BY department_id
HAVING AVG(salary)>=7000
ORDER BY department_id;

SELECT
    *
FROM employees;

/*
문제 4.
사원 테이블에서 commission_pct(커미션) 컬럼이 null이 아닌 사람들의
department_id(부서별) salary(월급)의 평균, 합계, count를 구합니다.
조건 1) 월급의 평균은 커미션을 적용시킨 월급입니다.
조건 2) 평균은 소수 2째 자리에서 절삭 하세요.
*/

SELECT
    department_id,
    TRUNC(AVG(salary+ (salary * commission_pct)), 2) AS avg_salary,
    SUM(salary + (salary * commission_pct)) AS sum,
    COUNT(*) AS count
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;

/*
ex18) employees테이블에서 급여의 최대, 최소, 평균, 합을 구하시오

count(컬럼명), max(컬럼명), min(컬럼명), avg(컬럼명), sum(컬럼명) 함수

조건) 평균은 소수이하절삭, 합은 세자리마다 콤마찍고 ￦표시
*/

SELECT
    COUNT(*),
    MAX(salary),
    MIN(salary),
    TRUNC(AVG(salary),0),
    TO_CHAR(SUM(salary), 'L999,999,999,999')
FROM employees;

SELECT
    *
FROM employees;











