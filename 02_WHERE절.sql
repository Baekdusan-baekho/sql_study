
 SELECT * FROM employees;
 
 -- WHERE �� �� (������ ���� ��/�� ���ڸ� �����մϴ�.)
 SELECT first_name, last_name, job_id
 FROM employees
 WHERE job_id = 'IT_PROG'; 
 -- JOB_ID�� ���ڿ��̱� ������ �񱳵� ���ڿ��� �Ѵ�.
 -- IT_PROG�� �ҹ��ڷ� �ϸ� ��ȸ�� ���� �ʴ´�.
 -- �����Ͱ��� ��/�� ���� ������ ö���ϴ�
 
 SELECT * FROM employees
 WHERE last_name = 'King';
 
 SELECT *
 FROM employees
 WHERE department_id = 90; --������ �̱⿡ ''�Ⱥ���
 
 SELECT *
 FROM employees
 WHERE salary >= 15000
 AND salary < 20000;
 
 SELECT * FROM employees
 WHERE hire_date = '04/01/30'; 
 -- ��¥�� dateŸ��   dateŸ���� ���ڿ��� �� ����

 -- ������ �� ���� BETWEEN LIKE IN
 SELECT * FROM employees
 WHERE salary BETWEEN 15000 AND 20000;
 -- BETWEEN ���̶�� ���� ���ǹ� 
 -- �����Ͱ� ���� �� �ε�ȣ�� ���� �� ������

 SELECT * FROM employees
 WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';
 
 -- IN �������� ��� ( Ư�� ����� ���� �� ��� )
 SELECT * FROM employees
 WHERE manager_id IN (100, 101, 102);
 
 SELECT * FROM employees
 WHERE job_id IN ('IT_PROG', 'AD_VP');
 
 -- LIKE ������  
 -- (�˻����� ���� ���� ������ �͵� Ű���常 �Է��ص� ��� �� ����) 
 -- %�� ��� ���ڵ�, _�� �������� �ڸ�(��ġ)�� ã�Ƴ� ��
 SELECT first_name, last_name, hire_date
 FROM employees
 WHERE hire_date LIKE '03%'; -- 03������ �����ϴ� �͵� �ڿ� ���� �ֵ�
 
 SELECT first_name, hire_date
 FROM employees
 WHERE hire_date LIKE '%15'; -- �տ� ���� ������ ������� �ڿ� 15�� �����ϴ� �͵�
 
 SELECT first_name, hire_date
 FROM employees
 WHERE hire_date LIKE '%05%'; 
 -- 05�� ������ �� �����´� ��/��/�� �� �ƹ��ų�
 
 SELECT first_name, hire_date
 FROM employees
 WHERE hire_date LIKE '___05%'; -- 5���� �Ի��� ���
 -- ������ ã�� 4��° �ڸ��� ( _ 3�� )3�ڸ� �ǳ� �ٰ� �˻�
 
 
 -- IS NULL (null ���� ã��)
 SELECT * FROM employees
 WHERE manager_id IS NULL;
 
 SELECT * FROM employees
 WHERE commission_pct IS NULL;
 
 
 -- AND ��θ��� true , OR ������ �� �Ѱ��� ���� true
 -- AND �� OR���� ���� ������ ����.
 SELECT * FROM employees
 WHERE job_id = 'IT_PROG' -- 2��
 OR job_id = 'FI_MGR'
 AND salary >= 6000; -- 1��
 
 SELECT * FROM employees
 WHERE (job_id = 'IT_PROG' 
 OR job_id = 'FI_MGR')
 AND salary >= 6000; 
 
 
 -- �������� ���� ( SELECT ������ ���� �������� ��ġ�˴ϴ�.)
 -- ORDER BY ������ �� �̸�  ��� 
 -- ASC : ascending �������� �⺻���̶� ��������
 -- DESC : descending ��������
 SELECT * FROM employees
 ORDER BY hire_date ASC;
 
 SELECT * FROM employees
 ORDER BY hire_date DESC;
 
 SELECT * FROM employees
 WHERE job_id = 'IT_PROG'
 ORDER BY first_name ASC;
 
 SELECT * FROM employees
 WHERE salary >= 5000
 ORDER BY employee_id DESC;
 
 SELECT
    first_name,
    salary*12 AS pay
 FROM employees
 ORDER BY pay ASC;
 
 

 
 
 
 
 
 
 
 