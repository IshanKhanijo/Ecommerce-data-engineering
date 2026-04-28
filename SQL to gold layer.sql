CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'pass@12345678australia';

CREATE DATABASE SCOPED CREDENTIAL ishanadmin WITH IDENTITY = 'Managed Identity';

CREATE EXTERNAL FILE FORMAT extfileformat2 WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);

CREATE EXTERNAL DATA SOURCE final_goldlayer WITH (
    LOCATION = 'https://olistdatastoreageaccount.blob.core.windows.net/olistdata/gold/',
    CREDENTIAL = ishanadmin
);

CREATE EXTERNAL TABLE gold.finaltable1 WITH (
    LOCATION = 'finalServing' ,
    DATA_SOURCE = final_goldlayer,
    FILE_FORMAT = extfileformat2
) AS
SELECT * FROM gold.final2

SELECT * FROM gold.finaltable1