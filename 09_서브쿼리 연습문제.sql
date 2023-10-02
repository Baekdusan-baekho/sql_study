
/*
���� 1.
-EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� �����͸� ��� �ϼ��� 
(AVG(�÷�) ���)
-EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� ���� ����ϼ���
-EMPLOYEES ���̺��� job_id�� IT_PROG�� ������� ��ձ޿����� ���� ������� 
�����͸� ����ϼ���
*/ -- 3�� ���� ������, ��, WHERE ���� ���

SELECT
    *
FROM employees 
WHERE salary > 
(
    SELECT
     AVG(salary)
    FROM employees
);

SELECT
    COUNT(*)
FROM employees 
WHERE salary > 
(
    SELECT
     AVG(salary)
    FROM employees
);


SELECT
(
SELECT
    *
FROM employees e
WHERE salary > 
    (
        SELECT
            AVG(salary)
        FROM employees
    )
    )
FROM employees
WHERE job_id = 'IT_PROG';


SELECT
    *
FROM employees 
WHERE salary > 
(
    SELECT
     AVG(salary)
    FROM employees
    WHERE job_id = 'IT_PROG'
);

/*
���� 2.
-DEPARTMENTS���̺��� manager_id�� 100�� �μ��� ���� �ִ� �������
��� ������ ����ϼ���.
*/ 
SELECT * FROM employees
WHERE department_id = (SELECT
    department_id
FROM departments
WHERE manager_id = 100);


/*
���� 3.
-EMPLOYEES���̺��� ��Pat���� manager_id���� ���� manager_id�� ���� ��� ����� �����͸� 
����ϼ���
-EMPLOYEES���̺��� ��James��(2��)���� manager_id�� ���� ��� ����� �����͸� ����ϼ���.
*/
SELECT
    manager_id
FROM employees
WHERE first_name = 'Pat';

SELECT
    *
FROM employees e
WHERE manager_id > 
(
SELECT
    manager_id
FROM employees 
WHERE first_name = 'Pat'
);

SELECT
    *
FROM employees e1
WHERE e1.manager_id  IN
(
SELECT
   e.manager_id
FROM employees e
WHERE e.first_name = 'James'
);


/*
���� 4.
-EMPLOYEES���̺� ���� first_name�������� �������� �����ϰ�, 41~50��° �������� 
�� ��ȣ, �̸��� ����ϼ���
*/
SELECT * FROM
(
SELECT ROWNUM AS rn, tb1.first_name
    FROM
    (
    SELECT
         *
    FROM employees
    ORDER BY first_name DESC
    )tb1
)
WHERE rn >40 AND rn <= 50;
/*
���� 5.
-EMPLOYEES���̺��� hire_date�������� �������� �����ϰ�, 31~40��° �������� 
�� ��ȣ, ���id, �̸�, ��ȣ, �Ի����� ����ϼ���.
*/

SELECT * FROM
(
SELECT ROWNUM AS rn, tb1.*
    FROM
    (
    SELECT
         employee_id, first_name, phone_number, hire_date
    FROM employees
    ORDER BY hire_date ASC
    )tb1
)
WHERE rn >30 AND rn <= 40;


/*
���� 6.
employees���̺� departments���̺��� left �����ϼ���
����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ��� �� ����մϴ�.
����) �������̵� ���� �������� ����
*/
SELECT
    e.employee_id, e.first_name || ' ' || e.last_name AS name
    , e.department_id, d.department_name
FROM employees e
LEFT OUTER JOIN departments d
on e.department_id = d.department_id
ORDER BY e.employee_id ASC;

/*
���� 7.
���� 6�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
*/

SELECT
    e.employee_id, e.first_name || ' ' || e.last_name, e.department_id,
    (
    SELECT d.department_name
    from departments d 
    WHERE d.department_id = e.department_id
    ) AS department_name
FROM employees e
ORDER BY  e.employee_id ASC;


/*
���� 8.
departments���̺� locations���̺��� left �����ϼ���
����) �μ����̵�, �μ��̸�, �Ŵ������̵�, �����̼Ǿ��̵�, ��Ʈ��_��巹��, ����Ʈ �ڵ�, ��Ƽ �� ����մϴ�
����) �μ����̵� ���� �������� ����
*/
SELECT
    d.*, loc.street_address, loc.postal_code, loc.city
FROM departments d
LEFT JOIN locations loc
ON d.location_id = loc.location_id
ORDER BY d.department_id ASC;



/*
���� 9.
���� 8�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
*/
-- �Ѱ� �Ѱ� ������ �Ѵ� ��Į�� ������ �Ѱ��� ���� ���
SELECT
    d.*,
    (
    SELECT loc.street_address
    FROM locations loc
    WHERE loc.location_id = d.location_id
    ) AS street_address,
    (
    SELECT loc.postal_code
    FROM locations loc
    WHERE loc.location_id = d.location_id
    ) AS postal_cod,
    (
    SELECT loc.city
    FROM locations loc
    WHERE loc.location_id = d.location_id
    ) AS city
FROM departments d
ORDER BY d.department_id ASC;

/*
���� 10.
locations���̺� countries ���̺��� left �����ϼ���
����) �����̼Ǿ��̵�, �ּ�, ��Ƽ, country_id, country_name �� ����մϴ�
����) country_name���� �������� ����
*/
SELECT
    loc.location_id, loc.street_address,loc.city,
    co.country_id, co.country_name
FROM locations loc
LEFT JOIN countries co
ON loc.country_id =  co.country_id
ORDER BY co.country_name ASC;



/*
���� 11.
���� 10�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
*/

SELECT
    loc.location_id, loc.street_address,loc.city,
    (
    SELECT
    co.country_id
    FROM countries co
    WHERE co.country_id = loc.country_id
    ) AS country_id,
    (
    SELECT
    co.country_name
    FROM countries co
    WHERE co.country_id = loc.country_id
    ) AS country_name
FROM locations loc
ORDER BY country_name ASC;
 -- FROM countries co�� �ٱ� ORDER BY���� ������� ���Ѵ�. 


/*
���� 12. 
employees���̺�, departments���̺��� left���� hire_date�� �������� �������� 
1-10��° �����͸� ����մϴ�.
����) rownum�� �����Ͽ� ��ȣ, �������̵�, �̸�, ��ȭ��ȣ, �Ի���, 
�μ����̵�, �μ��̸� �� ����մϴ�.
����) hire_date�� �������� �������� ���� �Ǿ�� �մϴ�. rownum�� Ʋ������ �ȵ˴ϴ�.
*/
SELECT * FROM(
    SELECT ROWNUM AS rn, a.*
    FROM(
        SELECT
            e.employee_id, e.first_name, 
            e.phone_number, e.hire_date, 
            e.department_id, d.department_name
        FROM employees e
        LEFT OUTER JOIN departments d
        ON e.department_id = d.department_id
        ORDER BY hire_date ASC
        ) a
    )
WHERE rn > 0 AND rn <= 10;
/*
���� 13. 
--EMPLOYEES �� DEPARTMENTS ���̺��� JOB_ID�� SA_MAN ����� ������ LAST_NAME, JOB_ID, 
DEPARTMENT_ID,DEPARTMENT_NAME�� ����ϼ���.
*/
SELECT 
    tb1.*, d.department_name
FROM
    (
    SELECT
        e.last_name, e.job_id, e.department_id
    FROM employees e
    WHERE e.job_id = 'SA_MAN'
    ) tb1
JOIN departments d
ON tb1.department_id = d.department_id;
/*
���� 14
--DEPARTMENTS ���̺��� �� �μ��� ID, NAME, MANAGER_ID�� �μ��� ���� �ο����� ����ϼ���.
--�ο��� ���� �������� �����ϼ���.
--����� ���� �μ��� ������� �ʽ��ϴ�.
*/
SELECT * FROM employees;
SELECT * FROM departments;

SELECT
    d.department_id, d.department_name, d.manager_id,
    a.total
FROM departments d
JOIN
    (
    SELECT
        department_id, COUNT(*) AS total
    FROM employees 
    GROUP BY department_id
    ) a
ON d.department_id = a.department_id
ORDER BY a.total DESC;
-- INNER ������ ON d.department_id = a.department_id 
-- �̰��� �ڵ����� ����ִ� �μ��� �����͸� ���� �ʴ´�.

SELECT
    d.department_id, d.department_name, d.manager_id,
    (
        SELECT
            COUNT(*)
        FROM employees e
        WHERE e.department_id = d.department_id
    ) AS total
FROM departments d
WHERE d.manager_id IS NOT NULL
ORDER BY total DESC;

/*
���� 15
--�μ��� ���� ���� ���ο�, �ּ�, �����ȣ, �μ��� ��� ������ ���ؼ� ����ϼ���.
--�μ��� ����� ������ 0���� ����ϼ���.
*/
SELECT
    d.*,
    loc.street_address, loc.postal_code,
    NVL(tbl.result, 0) AS �μ�����ձ޿�
FROM departments d
JOIN locations loc
ON d.location_id = loc.location_id
LEFT JOIN
    (
    SELECT
        department_id,
        TRUNC (AVG(salary), 0) AS result
    FROM employees
    GROUP BY department_id
    ) tbl
ON d.department_id = tbl.department_id;


-- ��Į��
SELECT
    d.*,
    loc.street_address, loc.postal_code,
    NVL(
    (
    SELECT
        TRUNC (AVG(salary), 0)
    FROM employees e
    WHERE e.department_id = d.department_id
    ),
    0) AS �μ�����ձ޿�
FROM departments d
JOIN locations loc
ON d.location_id = loc.location_id;


/*
���� 16
-���� 15 ����� ���� DEPARTMENT_ID�������� �������� �����ؼ� 
ROWNUM�� �ٿ� 1-10 ������ ������ ����ϼ���.
*/
SELECT * FROM
    (
    SELECT ROWNUM AS rn, tbl2.*
        FROM
        (
        SELECT
            d.*,
            loc.street_address, loc.postal_code,
            NVL(tbl.result, 0) AS �μ�����ձ޿�
        FROM departments d
        JOIN locations loc
        ON d.location_id = loc.location_id
        LEFT JOIN
            (
            SELECT
                department_id,
                TRUNC (AVG(salary), 0) AS result
            FROM employees
            GROUP BY department_id
            ) tbl
        ON d.department_id = tbl.department_id
        ) tbl2
    )
WHERE rn > 0 AND rn <= 10;
