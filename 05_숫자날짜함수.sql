
-- 숫자함수
-- ROUND(반올림)
-- 원하는 반올림 위치를 매개값으로 지정. 위치를 음수를 주는 것도 가능
SELECT
    ROUND(3.1415, 3), ROUND(45.923, 0), ROUND(45.923, -1)
FROM dual;

-- TRUNC(절사)
-- 정해진 소수점 자리수까지 잘라냅니다.
-- 반올림 없이 밑에 다 버림
SELECT
    TRUNC(3.1415, 3), TRUNC(45.923, 0), TRUNC(45.923, -1)
FROM dual;

-- ABS(절대값)
SELECT
    ABS(-34)
FROM dual;

-- CEIL(올림), FLOOR(내림)
SELECT CEIL(3.14), FLOOR(3.14)
FROM dual;

-- MOD(나머지) 자바 %기호
SELECT 10/4, MOD(10, 4)
FROM dual;


-- 날짜 함수

-- sysdate: 컴퓨터의 현재 날짜, 시간 정보를 가져와서 제공하는 함수
-- 오라클에서 제공하는 현재 날짜 제공 키워드
SELECT sysdate FROM dual;
-- systimestamp: 컴퓨터의 시간 정보를 가져와서 제공하는 함수
SELECT systimestamp FROM dual;

-- 날짜도 연산이 가능합니다.

SELECT sysdate + 1 FROM dual; -- 현재 DAY 에 +1

-- 날짜타입와 날짜타입는 더하기가 안됨 뺄셈만 가능
SELECT first_name, sysdate - hire_date
FROM employees;-- 일수

SELECT first_name, hire_date,(sysdate - hire_date)/365 AS year
FROM employees;-- 년수

SELECT first_name, hire_date, (sysdate - hire_date)/7 AS week
FROM employees;-- 주수

-- 날짜 반올림, 절사
SELECT ROUND(sysdate) FROM dual; -- 일 기준으로 반올림
SELECT ROUND(sysdate, 'year') FROM dual; -- 년 기준으로 반올림
SELECT ROUND(sysdate, 'month') FROM dual; -- 월 기준으로 반올림
SELECT ROUND(sysdate, 'day') FROM dual; -- 일 기준으로 반올림
-- 한주 기준으로 이번주에서 반올림 오늘은 목요일 결과는 다음주 일요일

SELECT TRUNC(sysdate) FROM dual; -- 일 기준으로 절삭
SELECT TRUNC(sysdate, 'year') FROM dual; -- 년 기준으로 절삭
SELECT TRUNC(sysdate, 'month') FROM dual; -- 월 기준으로 절삭
SELECT TRUNC(sysdate, 'day') FROM dual; -- 일 기준으로 절삭



