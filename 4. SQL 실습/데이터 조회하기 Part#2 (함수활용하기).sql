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
    
