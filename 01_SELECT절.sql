-- 오라클 한 줄 주석

/*
 오라클 여러 줄 주석
 하하
*/

-- 조회하기
-- SELECT 컬럼명( 여러개 가능 ) FROM 테이블 이름
-- *은 모든이라는 뜻이다
-- 실행 재생버튼 or (ctrl + enter)
-- 대문자 소문자 구분 안함 select * from employees 로 해도 가능
-- 그렇지만 키워드를 대문자로 작성하는 것이 관례
-- 식별자, 테이블 이름은 소문자로 작성해야 한다
SELECT * FROM employees;

-- 관례적인 형식 ctrl f7로 한 줄을 관례형식으로 바꿔준다
SELECT
    *
FROM
    employees;


-- 한 문장 단위로 실행 위에서 아래로 실행되지 않음
SELECT employee_id, first_name, last_name
FROM employees;

SELECT email, phone_number, hire_date
FROM employees;

-- 컬럼을 조회하는 위치에서 * / + - 연산이 가능합니다.
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    salary + salary*0.1 AS 성과금
FROM employees;

-- NULL 값의 확인 (숫자 0이나 공백이랑은 다른 존재입니다.)
-- 숫자 0은 0이 값이고 NULL은 값이 없는 것 NULL은 연산이 안됨
SELECT department_id, commission_pct
FROM employees;

-- 별칭 붙이기 alias 줄임 AS
-- alias (컬럼명, 테이블명의 이름을 변경해서 조회합니다.)
SELECT
    first_name AS 이름,
    last_name AS 성,
    salary AS 급여
FROM employees;


-- 문자열을 연결해서 column을 해준다
/*
 오라클은 홑따옴표로 문자를 표현하고, 문자열 안에 홑따옴표를
 표현하고 싶다면 ''를 두번 연속으로 쓰시면 됩니다.
 문장을 연결하고 싶다면 || 를 사용합니다.
*/
SELECT
    --first_name + last_name 안됨
    first_name || ' ' || last_name || '''s salary is $' || salary 
    AS 급여내역
FROM employees;


SELECT department_id FROM employees;
-- 조회의 중복행 제거 DISTINCT
SELECT DISTINCT department_id FROM employees;


-- 키워드 ROWNUM, ROWID
-- (**로우넘: 쿼리에 의해 반환되는 행 번호를 출력) 조회된 것의 번호 반환가능함
-- 글번호는 안 지워지고 ( 비어있는 번호가 있다 )
-- 로우넘은 가져오는 순서대로( 비어있는 번호가 없다 )
-- (로우아이디: 데이터베이스 내의 행의 주소를 반환) 조회된 것의 주소값
SELECT ROWNUM, ROWID, employee_id
FROM employees;





