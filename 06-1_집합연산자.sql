SELECT
    *
FROM employees;

-- ���� ������
-- ���� �ٸ� ���� ����� ����� �ϳ��� ����, ��, ���̸� ���� �� �ְ� �� �ִ� ������
-- UNION(������ �ߺ�X), UNION ALL(������ �ߺ�O), INTERSECT(������), MINUS(������)
-- �� �Ʒ� column ������ ������ Ÿ���� ��Ȯ�� ��ġ�ؾ� �մϴ�.

SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION
SELECT 
    employee_id, first_name
FROM employees
WHERE department_id = 20;
-- �� �Ʒ� SELECT ������ �ߺ� X

SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION ALL
SELECT 
    employee_id, first_name
FROM employees
WHERE department_id = 20;
-- �� �Ʒ� SELECT ������ �ߺ� O

-- INTERSECT �ߺ��� �͸� ���
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
INTERSECT
SELECT 
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- A-B ������  MINUS
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
MINUS
SELECT 
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- B-A ������  MINUS
SELECT 
    employee_id, first_name
FROM employees
WHERE department_id = 20
MINUS
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%';









