---------------------------------
-- 1. ���̺� �����̽� (* DBA ����� ������ �α���) ��: SYSTEM OR SYS
---------------------------------
-- ���̺� �����̽� ����
CREATE TABLESPACE       TS_USER01
   DATAFILE 'C:\ORACLE\DATA\TS_USER_01.dbf' SIZE 1024M
   AUTOEXTEND ON NEXT 100M MAXSIZE UNLIMITED
   SEGMENT SPACE MANAGEMENT AUTO;
   
-- ���̺� �����̽� ����
DROP TABLESPACE       TS_USER01
   INCLUDING CONTENTS AND DATAFILES CASCADE CONSTRAINTS;
---------------------------------
-- 2. �����
---------------------------------   
-- ����� ����
CREATE USER HAITEAM
                  IDENTIFIED BY        HAITEAM
                  DEFAULT TABLESPACE   TS_USER01
                  TEMPORARY TABLESPACE TEMP;

-- ����� �⺻���� ���� ����
ALTER USER HAITEAM
   IDENTIFIED BY HAITEAM2;
   -- ACCOUNT LOCK/UNLOCK
   
-- ����� ���̺� �����̽� ����
ALTER USER HAITEAM
    DEFAULT TABLESPACE USERS;
    
---------------------------------
-- 3. ����� ����
---------------------------------  
-- ����� ���� ���� (����/���ҽ� �� ���̺� ����)
GRANT CONNECT, RESOURCE, DBA TO HAITEAM;

-- ����� ���� ȸ�� (����/���ҽ� �� ���̺� ����)
REVOKE DBA FROM HAITEAM;


SELECT * FROM 
(SELECT 
        CONCAT(REGIONID,CONCAT('_',PRODUCT)) AS KEY
        ,REGIONID
        , PRODUCT
        , YEARWEEK
        , CASE WHEN QTY > 700000
                THEN 700000
                ELSE QTY END AS QTY
        FROM KOPO_CHANNEL_SEASONALITY_NEW
        WHERE 1=1
        AND PRODUCT IN ('PRODUCT1','PRODUCT2')
        AND SUBSTR(YEARWEEK,5,6) != '53')A
LEFT JOIN        
(SELECT B.KEY
    , AVG(QTY)
    , SUM(QTY)
    , COUNT(QTY)
FROM (
    SELECT 
        CONCAT(REGIONID,CONCAT('_',PRODUCT)) AS KEY
        ,REGIONID
        , PRODUCT
        , YEARWEEK
        , CASE WHEN QTY > 700000
                THEN 700000
                ELSE QTY END AS QTY
        FROM KOPO_CHANNEL_SEASONALITY_NEW
        WHERE 1=1
        AND PRODUCT IN ('PRODUCT1','PRODUCT2')
        AND SUBSTR(YEARWEEK,5,6) != '53'
)B
GROUP BY KEY)B
ON A.KEY = B.KEY
WHERE 1=1
AND REGIONID = 'A43'
    
    GROUP BY REGIONID, PRODUCTGROUP

SELECT * FROM KOPO_CHANNEL_SEASONALITY_NEW

---------------------------------
-- 4. ���� ���̺� ���� (* ������ ����� ������ �α���)
---------------------------------  
-- ����� ������ ���� ��
-- ���� ���̺� ����
CREATE TABLE KOPO_PRODUCT_VOLUME
(
  REGIONID          VARCHAR2(20),
  PRODUCTGROUP      VARCHAR2(20),
  YEARWEEK          VARCHAR2(6),
  VOLUME            NUMBER
);

-- ���̺� ��� ��ȸ
SELECT * FROM TABS;

