
 SELECT * FROM employees;
 
 -- WHERE 절 비교 (데이터 값은 대/소 문자를 구분합니다.)
 SELECT first_name, last_name, job_id
 FROM employees
 WHERE job_id = 'IT_PROG'; 
 -- JOB_ID가 문자열이기 때문에 비교도 문자열로 한다.
 -- IT_PROG를 소문자로 하면 조회가 되지 않는다.
 -- 데이터값은 대/소 문자 구분이 철저하다
 
 SELECT * FROM employees
 WHERE last_name = 'King';
 
 SELECT *
 FROM employees
 WHERE department_id = 90; --숫자형 이기에 ''안붙임
 
 SELECT *
 FROM employees
 WHERE salary >= 15000
 AND salary < 20000;
 
 SELECT * FROM employees
 WHERE hire_date = '04/01/30'; 
 -- 날짜는 date타입   date타입은 문자열과 비교 가능

 -- 데이터 행 제한
 SELECT * FROM employees
 WHERE salary BETWEEN 15000 AND 20000;
 -- BETWEEN 사이라는 뜻의 조건문 
 -- 데이터가 많을 땐 부등호가 조금 더 빠르다

 SELECT * FROM employees
 WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';
 
 -- IN 연산자의 사용 ( 특정 값들과 비교할 때 사용 )
 SELECT * FROM employees
 WHERE manager_id IN (100, 101, 102);
 
 SELECT * FROM employees
 WHERE job_id IN ('IT_PROG', 'AD_VP');
 
 -- LIKE 연산자  
 -- (검색에서 많이 쓴다 연관된 것들 키워드만 입력해도 모든 글 들어옴) 
 -- %는 어떠한 문자든, _는 데이터의 자리(위치)를 찾아낼 때
 SELECT first_name, last_name, hire_date
 FROM employees
 WHERE hire_date LIKE '03%'; -- 03으로 시작하는 것들 뒤에 뭐가 있든
 
 SELECT first_name, hire_date
 FROM employees
 WHERE hire_date LIKE '%15'; -- 앞에 뭐가 들어오든 상관없이 뒤에 15로 시작하는 것들
 
 SELECT first_name, hire_date
 FROM employees
 WHERE hire_date LIKE '%05%'; 
 -- 05가 있으면 다 가져온다 년/월/일 중 아무거나
 
 
 
 
 
 
 
 
 
 
 
 
 
 