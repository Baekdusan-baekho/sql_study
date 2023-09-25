
SELECT * FROM info;
SELECT * FROM auth;

-- �̳�(����)����
SELECT
    *
FROM info i
INNER JOIN auth a
ON i.auth_id = a.auth_id;

-- ����Ŭ ���� (�� ��� ���մϴ�.)
SELECT
    *
FROM info i, auth a
WHERE i.auth_id = a.auth_id;

-- auth_id �÷��� �׳� ���� ��ȣ�ϴ� ��� ��ϴ�.
-- �� ������ ���� ���̺� ��� �����ϱ� �����Դϴ�.
-- �̷� ����, �÷��� ���̺� �̸��� ���̴���, ��Ī�� ���ż�
-- Ȯ���ϰ� ������ ���ּ���.
SELECT
    auth.auth_id, title, content, name
FROM info
INNER JOIN auth
ON info.auth_id = auth.auth_id;


SELECT
    auth.auth_id, title, content, name
FROM info
JOIN auth -- JOIN�̶�� ���� �⺻ INNER JOIN�� ����Ų��.
ON info.auth_id = auth.auth_id;

-- �ʿ��� �����͸� ��ȸ�ϰڴ�! ��� �Ѵٸ�
-- WHERE ������ ���� �Ϲ� ������ �ɾ� �ֽø� �˴ϴ�.
SELECT
    a.auth_id, title, content, name
FROM info i
JOIN auth a
ON i.auth_id = a.auth_id
WHERE a.name = '�̼���';

-- �ƿ��� (�ܺ�) ����
SELECT
    *
FROM info i LEFT OUTER JOIN auth a
ON i.auth_id = a.auth_id;

SELECT
    *
FROM info i, auth a
WHERE i.auth_id = a.auth_id(+);
