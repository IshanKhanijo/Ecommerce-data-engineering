CREATE SCHEMA gold

CREATE VIEW gold.final
AS
SELECT 
    *
FROM
    OPENROWSET(
        BULK'https://olistdatastoreageaccount.blob.core.windows.net/olistdata/silver/',
        FORMAT = 'PARQUET'
    ) AS result1