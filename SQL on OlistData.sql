SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK'https://olistdatastoreageaccount.blob.core.windows.net/olistdata/silver/',
        FORMAT = 'PARQUET'
    ) AS result1

