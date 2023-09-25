
SELECT * FROM info;
SELECT * FROM auth;

-- 이너(내부)조인
SELECT
    *
FROM info i
INNER JOIN auth a
ON i.auth_id = a.auth_id;

-- 오라클 문법 (잘 사용 안합니다.)
SELECT
    *
FROM info i, auth a
WHERE i.auth_id = a.auth_id;

-- auth_id 컬럼을 그냥 쓰면 모호하다 라고 뜹니다.
-- 그 이유는 양쪽 테이블에 모두 존재하기 때문입니다.
-- 이럴 때는, 컬럼에 테이블 이름을 붙이던지, 별칭을 쓰셔서
-- 확실하게 지목을 해주세요.
SELECT
    auth.auth_id, title, content, name
FROM info
INNER JOIN auth
ON info.auth_id = auth.auth_id;


SELECT
    auth.auth_id, title, content, name
FROM info
JOIN auth -- JOIN이라고만 쓰면 기본 INNER JOIN을 가르킨다.
ON info.auth_id = auth.auth_id;

-- 필요한 데이터만 조회하겠다! 라고 한다면
-- WHERE 구문을 통해 일반 조건을 걸어 주시면 됩니다.
SELECT
    a.auth_id, title, content, name
FROM info i
JOIN auth a
ON i.auth_id = a.auth_id
WHERE a.name = '이순신';

-- 아우터 (외부) 조인
SELECT
    *
FROM info i LEFT OUTER JOIN auth a
ON i.auth_id = a.auth_id;

SELECT
    *
FROM info i, auth a
WHERE i.auth_id = a.auth_id(+);
