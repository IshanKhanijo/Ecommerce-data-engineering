CREATE VIEW gold.final2
AS
SELECT 
    *
FROM
    OPENROWSET(
        BULK'https://olistdatastoreageaccount.blob.core.windows.net/olistdata/silver/',
        FORMAT = 'PARQUET'
    ) AS result2
WHERE order_status = 'delivered'

SELECT
TOP 10 *
FROM gold.final2