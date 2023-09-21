-- ����Ŭ �� �� �ּ�

/*
 ����Ŭ ���� �� �ּ�
 ����
*/

-- ��ȸ�ϱ�
-- SELECT �÷���( ������ ���� ) FROM ���̺� �̸�
-- *�� ����̶�� ���̴�
-- ���� �����ư or (ctrl + enter)
-- �빮�� �ҹ��� ���� ���� select * from employees �� �ص� ����
-- �׷����� Ű���带 �빮�ڷ� �ۼ��ϴ� ���� ����
-- �ĺ���, ���̺� �̸��� �ҹ��ڷ� �ۼ��ؾ� �Ѵ�
SELECT * FROM employees;

-- �������� ���� ctrl f7�� �� ���� ������������ �ٲ��ش�
SELECT
    *
FROM
    employees;


-- �� ���� ������ ���� ������ �Ʒ��� ������� ����
SELECT employee_id, first_name, last_name
FROM employees;

SELECT email, phone_number, hire_date
FROM employees;

-- �÷��� ��ȸ�ϴ� ��ġ���� * / + - ������ �����մϴ�.
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    salary + salary*0.1 AS ������
FROM employees;

-- NULL ���� Ȯ�� (���� 0�̳� �����̶��� �ٸ� �����Դϴ�.)
-- ���� 0�� 0�� ���̰� NULL�� ���� ���� �� NULL�� ������ �ȵ�
SELECT department_id, commission_pct
FROM employees;

-- ��Ī ���̱� alias ���� AS
-- alias (�÷���, ���̺���� �̸��� �����ؼ� ��ȸ�մϴ�.)
SELECT
    first_name AS �̸�,
    last_name AS ��,
    salary AS �޿�
FROM employees;


-- ���ڿ��� �����ؼ� column�� ���ش�
/*
 ����Ŭ�� Ȭ����ǥ�� ���ڸ� ǥ���ϰ�, ���ڿ� �ȿ� Ȭ����ǥ��
 ǥ���ϰ� �ʹٸ� ''�� �ι� �������� ���ø� �˴ϴ�.
 ������ �����ϰ� �ʹٸ� || �� ����մϴ�.
*/
SELECT
    --first_name + last_name �ȵ�
    first_name || ' ' || last_name || '''s salary is $' || salary 
    AS �޿�����
FROM employees;


SELECT department_id FROM employees;
-- ��ȸ�� �ߺ��� ���� DISTINCT
SELECT DISTINCT department_id FROM employees;


-- Ű���� ROWNUM, ROWID
-- (**�ο��: ������ ���� ��ȯ�Ǵ� �� ��ȣ�� ���) ��ȸ�� ���� ��ȣ ��ȯ������
-- �۹�ȣ�� �� �������� ( ����ִ� ��ȣ�� �ִ� )
-- �ο���� �������� �������( ����ִ� ��ȣ�� ���� )
-- (�ο���̵�: �����ͺ��̽� ���� ���� �ּҸ� ��ȯ) ��ȸ�� ���� �ּҰ�
SELECT ROWNUM, ROWID, employee_id
FROM employees;





