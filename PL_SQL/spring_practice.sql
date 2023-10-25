SELECT * FROM freeboard;

DELETE FROM freeboard
WHERE bno = 22;

DROP SEQUENCE freeboard_seq;

CREATE SEQUENCE freeboard_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;

-----------------------------


CREATE TABLE tbl_reply(
    reply_no NUMBER PRIMARY KEY,
    reply_text VARCHAR2(1000) NOT NULL,
    reply_writer VARCHAR2(100) NOT NULL,
    reply_pw VARCHAR2(100) NOT NULL,
    reply_date DATE DEFAULT sysdate,
    bno NUMBER,
    update_date DATE DEFAULT NULL,
    
    
    CONSTRAINT reply_bno_fk FOREIGN KEY(bno) REFERENCES freeboard(bno)
    ON DELETE CASCADE -- �����ϰ� �ִ� �θ��� ������ �� �ڽ��� ���� ���� ����.
);

CREATE SEQUENCE reply_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 10000
    NOCYCLE
    NOCACHE;
    
SELECT * FROM tbl_reply;


---------------------------


-- SNS �Խ���
CREATE TABLE snsboard(
    bno NUMBER PRIMARY KEY,
    writer VARCHAR2(50) NOT NULL,
    upload_path VARCHAR2(100),
    file_loca VARCHAR2(100),
    file_name VARCHAR2(100),
    file_real_name VARCHAR2(100),
    content VARCHAR2(4000),
    reg_date DATE DEFAULT sysdate
);

CREATE SEQUENCE snsboard_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 100000
    NOCYCLE
    NOCACHE;



SELECT * from snsboard;

TRUNCATE TABLE snsboard;

-- ���ƿ� ���̺�
CREATE TABLE sns_like(
    lno NUMBER PRIMARY KEY,
    user_id VARCHAR2(50) NOT NULL,
    bno NUMBER NOT NULL
);

-- ON DELETE CASCADE;
-- �ܷ� Ű(FK)�� ������ ��, �����ϴ� �����Ͱ� �����Ǵ� ���
-- �����ϰ� �ִ� �����͵� �Բ� ������ �����ϰڴ�.
ALTER TABLE sns_like ADD FOREIGN KEY(bno)
REFERENCES snsboard(bno)
ON DELETE CASCADE;


CREATE SEQUENCE sns_like_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 100000
    NOCYCLE
    NOCACHE;
    
SELECT * FROM sns_like;


SELECT tbl2.*, NVL(b.like_cnt, 0) AS like_cnt
FROM
    (
    SELECT ROWNUM AS rn, tbl.*
        FROM
        (
            SELECT * FROM snsboard
            ORDER BY bno DESC
        ) tbl
    ) tbl2
LEFT JOIN 
(
SELECT 
    bno,
    COUNT(*) AS like_cnt
FROM sns_like
GROUP BY bno
) b
ON tbl2.bno = b.bno
WHERE rn > 0
AND rn <= 3;



SELECT tbl2.*,
	(SELECT COUNT(*) FROM sns_like WHERE bno = tbl2.bno) AS like_cnt
	FROM
		(
		SELECT ROWNUM AS rn, tbl.*
			FROM
			(
			SELECT * FROM snsboard
			ORDER BY bno DESC
			) tbl
		)tbl2
WHERE rn > 0
AND rn <= 3;


-- 231025
CREATE TABLE test_location(
    area1 VARCHAR2(50),
    area2 VARCHAR2(50),
    nx NUMBER,
    ny NUMBER,
    latitude NUMBER(20, 15),
    longitude NUMBER(20, 15)
);

SELECT * FROM test_location;

SELECT * FROM
    (
    SELECT ROWNUM AS rn, nx, ny 
    FROM test_location
    WHERE area1 = '��⵵'
    AND area2 LIKE '%�Ⱦ�ø��ȱ�%'
    )
WHERE ROWNUM = 1;