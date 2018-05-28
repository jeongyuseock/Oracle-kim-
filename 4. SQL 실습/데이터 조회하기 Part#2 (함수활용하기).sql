----------------------------------------------------------
----------------- ���� �Լ� -------------------------------
----------------------------------------------------------
-- 1. ��/�ҹ��� ����
SELECT
    LOWER(PRODUCT) AS CASE1,
    UPPER(PRODUCT) AS CASE2
FROM KOPO_CHANNEL_SEASONALITY_NEW

-- 2. �÷� �� ��ġ��
SELECT
    CONCAT(REGIONID, CONCAT('_',PRODUCT)) AS KEYCOL,
    REGIONID||'_'||PRODUCT AS KEYCOL2
FROM KOPO_CHANNEL_SEASONALITY_NEW

-- 3. �÷� �� �����ϱ�
SELECT
    PRODUCT,
    SUBSTR(PRODUCT,1,7)
FROM KOPO_CHANNEL_SEASONALITY_NEW

-- 4. �÷� �� ä���
SELECT
    LPAD(PRODUCT,10,'0')
FROM KOPO_CHANNEL_SEASONALITY_NEW

  -- KOPO_CUSTOMERDATA ���̺���
  -- CUSTOMERCODE�� 12�ڸ��� ��ȸ�ϼ���
  -- ��, 12�ڸ��� �ȵ� ��� �տ� *�� ä�켼��
  SELECT 
  LPAD(CUSTOMERCODE,12,'*')
  FROM KOPO_CUSTOMERDATA
  
-- 5. �÷� �� ���� (LTRIM, RTRIM, TRIM)
SELECT
    LTRIM(PRODUCT,'PRO'),
    RTRIM(PRODUCT,'56')
FROM KEOOPO_CHANNEL_SEASONALITY_NEW

-- 6. �����ϱ� (REPLACE)
SELECT
    REGIONID,
    REPLACE(REGIONID, 'A', 'REGION')
FROM KOPO_CHANNEL_SEASONALITY_NEW

    -- KOPO_CUSTOMERDATA�� ���ڵ�� 10�ڸ��̴�
    -- ���� 10�ڸ��� �ƴϸ� ���ʿ� 0���� ä���
    -- ���� ���ڵ��� �� 4�ڸ��� ��ȣȭ�� ���� * ó���� �ϼ���
    
    SELECT 
    REPLACE(LPAD(CUSTOMERCODE,10,0), 
            SUBSTR(LPAD(CUSTOMERCODE,10,0),-4) , '****')
    FROM KOPO_CUSTOMERDATA
    
----------------------------------------------------------
----------------- ���� �Լ� -------------------------------
----------------------------------------------------------   


SELECT
    ROUND(12.345,2)
    ,CEIL(12.345)
    ,FLOOR(12.345)
    ,MOD(12,10)
    ,POWER(3,2)
    FROM DUAL

-- MOD ������ ������ ��������
-- Ư�� 3�������� ACTION�� ���Ұ�� Ȱ��
SELECT
        FIRST_NUMBER,
        SECOND_NUMBER,
        FIRST_NUMBER/SECOND_NUMBER AS AVG,
        ROUND(FIRST_NUMBER/SECOND_NUMBER) AS ROUND_EX,
        CEIL(FIRST_NUMBER/SECOND_NUMBER) AS CEIL_EX,
        FLOOR(FIRST_NUMBER/SECOND_NUMBER) AS FLOOR_EX,
        MOD(FIRST_NUMBER, SECOND_NUMBER) AS MOD_EX,
        POWER(FIRST_NUMBER, SECOND_NUMBER) AS POW_EX
        FROM NUMBER_EXAMPLE


----------------------------------------------------------
----------------- ��¥ �Լ� -------------------------------
----------------------------------------------------------   

SELECT
    SYSDATE,
    NEXT_DAY(SYSDATE,2),
    LAST_DAY(SYSDATE)
    FROM DUAL
    
SELECT TO_CHAR(SYSDATE-7, 'YYYYWW') FROM DUAL

SELECT TO_CHAR(SYSDATE, 'YYYYWW') FROM DUAL

SELECT TO_CHAR(SYSDATE-30, 'YYYYMMDD') FROM DUAL

SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL

SELECT TO_CHAR(SYSDATE-1, 'YYYYMMDD') FROM DUAL
  
SELECT TO_CHAR(SYSDATE, 'YYYY MON DD HH MI') FROM DUAL 

----------------------------------------------------------
----------------- ��� ���� �ٷ�� -------------------------
----------------------------------------------------------   

    -- �����÷� week �������� ����
    SELECT * FROM SORT_EXAMPLE
    ORDER BY LPAD(WEEK,2,0)

    -- ��Ȯ�� ���� 1 - ABS(FCST-ACTUAL) / FCST
    SELECT 
        YEARWEEK
        ,ACTUAL
        ,FCST
        ,ROUND((1-ABS(FCST-ACTUAL)/FCST),4) * 100 AS ACCURACY
        FROM RMSE_MAE_EXAMPLE2

SELECT * FROM RMSE_MAE_EXAMPLE