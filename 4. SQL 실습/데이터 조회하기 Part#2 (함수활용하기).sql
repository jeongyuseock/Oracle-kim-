----------------------------------------------------------
----------------- ���� �Լ� -------------------------------
----------------------------------------------------------
-- 1. ��/�ҹ��� ����
SELECT
    LOWER(PRODUCT) AS CASE1,
    UPPER(PRODUCT) AS CASE2
FROM KOPO_CHANNEL_SEASONALITY_NEW;

-- 2. �÷� �� ��ġ��
SELECT
    CONCAT(REGIONID, CONCAT('_',PRODUCT)) AS KEYCOL,
    REGIONID||'_'||PRODUCT AS KEYCOL2
FROM KOPO_CHANNEL_SEASONALITY_NEW;

-- 3. �÷� �� �����ϱ�
SELECT
    PRODUCT,
    SUBSTR(PRODUCT,1,7)
FROM KOPO_CHANNEL_SEASONALITY_NEW;

-- 4. �÷� �� ä���
SELECT
    LPAD(PRODUCT,10,'0')
FROM KOPO_CHANNEL_SEASONALITY_NEW;

  -- KOPO_CUSTOMERDATA ���̺���
  -- CUSTOMERCODE�� 12�ڸ��� ��ȸ�ϼ���
  -- ��, 12�ڸ��� �ȵ� ��� �տ� *�� ä�켼��
  SELECT 
  LPAD(CUSTOMERCODE,12,'*')
  FROM KOPO_CUSTOMERDATA;
  
-- 5. �÷� �� ���� (LTRIM, RTRIM, TRIM)
SELECT
    LTRIM(PRODUCT,'PRO'),
    RTRIM(PRODUCT,'56')
FROM KEOOPO_CHANNEL_SEASONALITY_NEW;

-- 6. �����ϱ� (REPLACE)
SELECT
    REGIONID,
    REPLACE(REGIONID, 'A', 'REGION')
FROM KOPO_CHANNEL_SEASONALITY_NEW;

    -- KOPO_CUSTOMERDATA�� ���ڵ�� 10�ڸ��̴�
    -- ���� 10�ڸ��� �ƴϸ� ���ʿ� 0���� ä���
    -- ���� ���ڵ��� �� 4�ڸ��� ��ȣȭ�� ���� * ó���� �ϼ���
    
    SELECT 
    REPLACE(LPAD(CUSTOMERCODE,10,0), 
            SUBSTR(LPAD(CUSTOMERCODE,10,0),-4) , '****')
    FROM KOPO_CUSTOMERDATA;
    
----------------------------------------------------------
----------------- ���� �Լ� -------------------------------
----------------------------------------------------------   


SELECT
    ROUND(12.345,2)
    ,CEIL(12.345)
    ,FLOOR(12.345)
    ,MOD(12,10)
    ,POWER(3,2)
    FROM DUAL;

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
        FROM NUMBER_EXAMPLE;


----------------------------------------------------------
----------------- ��¥ �Լ� -------------------------------
----------------------------------------------------------   

SELECT
    SYSDATE,
    NEXT_DAY(SYSDATE,2),
    LAST_DAY(SYSDATE)
    FROM DUAL;
    
SELECT TO_CHAR(SYSDATE-7, 'YYYYWW') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYYWW') FROM DUAL;

SELECT TO_CHAR(SYSDATE-30, 'YYYYMMDD') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL;

SELECT TO_CHAR(SYSDATE-1, 'YYYYMMDD') FROM DUAL;
  
SELECT TO_CHAR(SYSDATE, 'YYYY MON DD HH MI') FROM DUAL ;

----------------------------------------------------------
----------------- ��� ���� �ٷ�� -------------------------
----------------------------------------------------------   

    -- �����÷� week �������� ����
    SELECT * FROM SORT_EXAMPLE
    ORDER BY LPAD(WEEK,2,0);

    -- ��Ȯ�� ���� 1 - ABS(FCST-ACTUAL) / FCST
    SELECT 
        YEARWEEK
        ,ACTUAL
        ,FCST
        ,ROUND((1-ABS(FCST-ACTUAL)/FCST),4) * 100 AS ACCURACY
        FROM RMSE_MAE_EXAMPLE2;


----------------------------------------------------------
----------------- ��� �Լ� �ٷ�� -------------------------
----------------------------------------------------------   

-- CASE WHEN ����
-- CUSTOMERID ���� ù��° ���ڿ��� B->A->C �ܷ̿� �����ϴ� ������ �����ϱ�
SELECT a.*,
case when substr(CUSTID,1,1)='A' then 1
when substr(CUSTID,1,1)='B' then 0
when substr(CUSTID,1,1)='C' then 2
else 3 end as newOrder
from CUSTOMERDATA a
order by newOrder; 

-- CASE WHEN �ǽ�
-- KOPO_CUSTOMERDATA ���̺���
-- TOTAL_AMOUNT�� 10�� �̻��ΰ�� HIGH
-- �̿ܿ��� LOW ��� CUSTOMER_SEG �÷��� �����ϼ���
SELECT 
    A.*,
    CASE WHEN A.TOTAL_AMOUNT >= 100000 THEN 'HIGH'
         ELSE 'LOW' END AS CUSTOMER_SEG
 FROM KOPO_CUSTOMERDATA A;

-- DECODE ����
SELECT A.*
       ,DECODE(A.GENDER, 'Male',1, 'Female',2,0) AS SORT_ORDER
FROM KOPO_CUSTOMERDATA A
WHERE 1=1
ORDER BY SORT_ORDER;

-- DECODE �ǽ�
-- DT_RESULT_FINAL3 ���̺���
-- ��Ȯ���� �����ϼ���
-- ��, �������� 0�ΰ�� ��Ȯ���� 0
-- ��Ȯ�� = 1- ABS(������-������)/������

SELECT DECODE(PREDICTION_QTY,0,0, 1-ABS(PREDICTION_QTY-REAL_QTY)/PREDICTION_QTY) AS ANSWER
FROM DT_RESULT_FINAL3;
              



----------------------------------------------------------
----------------- ���� �Լ� (Group by) --------------------
----------------------------------------------------------  

-- �Ϲ� ���
SELECT AVG(QTY) FROM KOPO_CHANNEL_SEASONALITY_NEW;

-- ������ �ŷ��� ����
SELECT REGIONID, AVG(QTY) FROM KOPO_CHANNEL_SEASONALITY_NEW
GROUP BY REGIONID
ORDER BY REGIONID;

-- ����, ��ǰ�� ����
SELECT REGIONID, PRODUCT, AVG(QTY) FROM KOPO_CHANNEL_SEASONALITY_NEW
GROUP BY REGIONID,PRODUCT
ORDER BY REGIONID,PRODUCT;

-- ������ ����
SELECT SUBSTR(YEARWEEK,5,6) AS WEEK,
       AVG(QTY) AS QTY_AVG 
FROM KOPO_CHANNEL_SEASONALITY_NEW
GROUP BY SUBSTR(YEARWEEK,5,6)
ORDER BY SUBSTR(YEARWEEK,5,6);

-- GROUP BY �ǽ�
-- RMSE_MAE_EXAMPLE ���̺��� Ȱ���Ͽ�
-- ITEM�� RMSE�� ���ϼ���
-- MAE �� ������ ���
-- RMSE �� �� ������ ������ ����� ����� �� Root�� ����� (ū ������ �߻��� �κп� ���� �ñ׳� ����)
-- RMSE(Root Mean Square Error / MAE) Extract
SELECT ITEM
       ,SUM(DIFF)
       ,COUNT(*)
       ,SUM(DIFF)/COUNT(*)
       ,SUM(DIFF_POW)
       ,COUNT(*)
       ,SQRT(SUM(DIFF_POW)/COUNT(*)) AS RMSE
        FROM (
            SELECT ITEM
                   ,YEARWEEK
                   ,QTY
                   ,PREDICTION
                   ,ABS(QTY-PREDICTION) AS DIFF
                   ,POWER(ABS(QTY-PREDICTION),2) AS DIFF_POW
                   FROM RMSE_MAE_EXAMPLE
        )
GROUP BY ITEM;
    

    
    
   