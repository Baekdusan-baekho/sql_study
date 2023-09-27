-- ���̺�: ����   ||||   ��: ����   ���� ������ �����ϴ�
-- ��� ���̺� ���� ������ ����
/*
view�� �������� �ڷḸ ���� ���� ����ϴ� ���� ���̺��� �����Դϴ�.
��� �⺻ ���̺�� ������ ���� ���̺��̱� ������
�ʿ��� �÷��� ������ �θ� ������ ������ ���ϴ�.
��� �������̺�� ���� �����Ͱ� ���������� ����� ���´� �ƴմϴ�.
�並 ���ؼ� �����Ϳ� �����ϸ� ���� �����ʹ� �����ϰ� ��ȣ�� �� �ֽ��ϴ�.
*/

--�������� ���� ���������� �ζ��κ�

SELECT * FROM user_sys_privs;-- ������ Ȯ���ϴ� �뵵 

-- �ܼ� ��: �ϳ��� ���̺��� �̿��Ͽ� ������ ��
-- ���� �÷� �̸��� �Լ� ȣ�⹮, ����� �� ���� ���� ǥ�����̸� �ȵ˴ϴ�.
SELECT
    employee_id,
    --first_name || ' ' || last_name,
    job_id,
    salary
FROM employees
WHERE department_id = 60;
DROP VIEW view_emp;

CREATE VIEW view_emp AS (
    SELECT
    employee_id,
    first_name || ' ' || last_name AS full_name, 
    -- ���ο� ���� ��Ī�� ����� �־�� �Ѵ�.
    job_id,
    salary
    FROM employees
    WHERE department_id = 60
);

SELECT * FROM view_emp
WHERE salary >= 6000;

-- ���պ�
-- ���� ���̺��� �����Ͽ� �ʿ��� �����͸� �����ϰ� ���� Ȯ���� ���� ���.
CREATE VIEW view_emp_dept_jobs AS (
    SELECT
        e.employee_id,
        first_name || ' ' || last_name AS full_name, 
        d.department_name,
        j.job_title
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    LEFT JOIN jobs j
    ON e.job_id = j.job_id
    
)
ORDER BY employee_id ASC;

SELECT * FROM view_emp_dept_jobs;

-- VIEW�� ���� ( CREATE OR REPLACE VIEW ���� )
-- ���� �̸����� �ش� ������ ����ϸ� �����Ͱ� ����Ǹ鼭 ���Ӱ� �����˴ϴ�.
-- �̸��� ������ ���� ��������� ���� �̸��� ������ ��ü�� �ȴ�
CREATE OR REPLACE VIEW view_emp_dept_jobs AS (
    SELECT
        e.employee_id,
        first_name || ' ' || last_name AS full_name, 
        d.department_name,
        j.job_title,
        e.salary -- �߰�
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    LEFT JOIN jobs j
    ON e.job_id = j.job_id
)
ORDER BY employee_id ASC;

SELECT * FROM view_emp_dept_jobs;

SELECT
    job_title,
    AVG(salary) AS avg
FROM view_emp_dept_jobs
GROUP BY job_title
ORDER BY AVG(salary) DESC; -- SQL ������ Ȯ���� ª����.

-- �� ����
DROP VIEW view_emp;


/*
    VIEW�� INSERT�� �Ͼ�� ��� ���� ���̺��� �ݿ��� �˴ϴ�.
    �׷��� VIEW�� INSERT, UPDATE, DELETE�� ���� ���� ������ �����ϴ�.
    ���� ���̺��� NOT NULL�� ��� VIEW�� INSERT�� �Ұ����մϴ�.
    VIEW���� ����ϴ� �÷��� ������ ��쿡�� �ȵ˴ϴ�.
*/

-- �� ��° �÷��� 'full name'�� ����(virtual column)�̱� ������ insert �ȵ˴ϴ�.
INSERT INTO view_emp_dept_jobs
VALUES(300, 'test', 'test', 'test', 10000); -- �ȵ�
-- ù��° 'test'�� ������ ������ insert, update, delete ��� ���Ѵ�.
-- ù��° 'test' = first_name || ' ' || last_name AS full_name

-- �������� ���ε� ��� �ѹ��� insert���� ����
-- JOIN�� ���� ��� �ѹ��� ������ �� �����ϴ�.
INSERT INTO view_emp_dept_jobs
(employee_id, department_name, job_title, salary)
VALUES(300, 'test', 'test', 10000); -- �ȵ�

-- ���� ���̺��� null�� ������� �ʴ� �÷� ������ �� �� �����ϴ�.
INSERT INTO view_emp
(employee_id, job_id, salary)
VALUES(300, 'test', 10000); -- �ȵ�

-- 103���� �Ĵٺ��� ����Ƽ�� �־ ������� ���� (������ ����)
-- 107���� ��
DELETE FROM view_emp
WHERE employee_id = 103; -- �ȵ�

-- ����, ����, ���� ������ ���� ���̺��� ����, ����, �����ȴ� �����ؾ� �Ѵ�.
-- ����, ����, ���� ������ ���� ���̺� �ݿ��˴ϴ�.
DELETE FROM view_emp
WHERE employee_id = 107;

SELECT * FROM view_emp;
SELECT * FROM employees;
ROLLBACK;

-- WITH CHECK OPTION -> ���� ���� �÷�
-- �並 ������ �� ����� ���� �÷��� �並 ���ؼ� ������ �� ���� ���ִ� Ű����

CREATE OR REPLACE VIEW view_emp_test AS (
    SELECT
    employee_id,
    first_name,
    last_name,
    email,
    hire_date,
    job_id,
    department_id
    FROM employees
    WHERE department_id = 60
)
WITH CHECK OPTION CONSTRAINT view_emp_test_ck;
-- WITH CHECK OPTION ���̺� �� ���� ���ϰ� �� ���� ����
UPDATE view_emp_test
SET department_id = 100
WHERE employee_id = 107;

UPDATE view_emp_test
SET job_id = 'AD_VP'
WHERE employee_id = 107; -- JOB_ID�� �ִ� �ܾ ���� ����

SELECT * FROM view_emp_test;

-- �б� ���� �� -> WITH READ ONLY (DML ������ ���� -> SELECT�� ���)
CREATE OR REPLACE VIEW view_emp_test AS (
    SELECT
    employee_id,
    first_name,
    last_name,
    email,
    hire_date,
    job_id,
    department_id
    FROM employees
    WHERE department_id = 60
)
WITH READ ONLY;


