
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

 -- ������ �� ����
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
 WHERE hire_date LIKE '03%'; -- 03���� �����ϴ� �͵� �ڿ� ���� �ֵ�
 
 SELECT first_name, hire_date
 FROM employees
 WHERE hire_date LIKE '%15'; -- �տ� ���� ������ ������� �ڿ� 15�� �����ϴ� �͵�
 
 SELECT first_name, hire_date
 FROM employees
 WHERE hire_date LIKE '%05%'; 
 -- 05�� ������ �� �����´� ��/��/�� �� �ƹ��ų�
 
 
 
 
 
 
 
 
 
 
 
 
 
 