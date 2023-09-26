
-- insert
-- ���̺� ���� Ȯ��
DESC departments;
-- ���̺� �տ� ��ũ�� �����ϴ� ��� ��
-- ORDER BY DESC�� ��������

-- INSERT�� ù��° ��� ( ��� �÷� �����͸� �� ���� ���� )
INSERT INTO departments
VALUES(290, '������', 102, 1800);
-- department_id department_name, manager_id, location_id
INSERT INTO departments
VALUES(300, '���ߺ�', null, null);


SELECT * FROM departments;
ROLLBACK; -- ���� ������ �ٽ� �ڷ� �ǵ����� Ű����

-- INSERT�� �ι�° ��� 
-- ( ���� �÷��� �����ϰ� ����, NOT NULL Ȯ���ϼ���!)
INSERT INTO departments
    (department_id, department_name, manager_id, location_id)
VALUES
    (280, '���ߺ�', 103, 1700);
 
INSERT INTO departments
    (department_id, department_name, location_id)
VALUES
    (290, '�ѹ���', 1700);  

INSERT INTO departments
    (department_id, location_id)
VALUES
    (290, 1700);   -- department_name �� NULL�� ������� �ʴ´�.
SELECT * FROM departments;
ROLLBACK;

-- �纻 ���̺� ���� CTAS
-- �纻 ���̺��� ������ �� �׳� �����ϸ� -> ��ȸ�� �����ͱ��� ��� ����
-- WHERE���� false�� (1 = 2) �����ϸ� -> ���̺��� ������ ����ǰ� �����ʹ� ���� X
CREATE TABLE emps AS
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1 = 2);
-- WHERE 1 = 2 : FALSE �Ϻη� ��¡���� �ǹ�
-- �Ҹ� ���� ���� ������ FALSE�� ���鶧 �����
-- �����ʹ� �������� �ʰ� ������ �����´�

CREATE TABLE emps AS
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1 = 2);
-- �����Ϳ� ������ �����´�
-- ���� ���� ����
SELECT * FROM emps;
DROP TABLE emps;

-- INSERT ( �������� ) (���� �˷��ذ� �� ���� ����Ѵ�)
INSERT INTO emps
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE department_id = 50);

-------------------------------------------------------

-- UPDATE
CREATE TABLE emps AS
(SELECT * FROM employees);

UPDATE emps SET salary = 30000
WHERE employee_id = 100;

SELECT * FROM emps;

-- UPDATE�� ������ ���� ������ ������ �� �� �����ؾ� �մϴ�.
-- �׷��� ������ ���� ����� ���̺� ��ü�� ����˴ϴ�.
UPDATE emps SET salary = 30000; -- ������ϸ� ��ü���� ��
ROLLBACK;

UPDATE emps SET salary = 30000
WHERE employee_id = 100;
SELECT * FROM emps;

UPDATE emps SET salary = salary + salary * 0.1
WHERE employee_id = 100;


UPDATE emps 
SET phone_number = '010.4742.8917', manager_id= 102
WHERE employee_id = 100;

-- UPDATE (��������)
UPDATE emps
    SET (job_id, salary, manager_id) =
    (
        SELECT job_id, salary, manager_id
        FROM emps
        WHERE employee_id = 100
    )
WHERE employee_id = 101;
-- employee_id = 100 ������
-- employee_id = 101 �� �����Ѵ�.

SELECT * FROM emps;

-------------------------------------------------------------------

-- DELETE
DELETE FROM emps; -- ������ ���� ������ �ȿ� �ִ� ��� �����͸� �����
ROLLBACK;

DELETE FROM emps
WHERE employee_id = 103;

-- DELETE (��������)
DELETE FROM emps
WHERE department_id = (SELECT department_id FROM departments
                        WHERE department_name = 'IT');


