CREATE DATABASE TaxiAnalytics;
GO

USE TaxiAnalytics;
GO

CREATE MASTER KEY ENCRYPTION BY PASSWORD = '<STRONG_PASSWORD!Tx_2026>';
GO

CREATE DATABASE SCOPED CREDENTIAL WorkspaceIdentity
WITH IDENTITY = 'Managed Identity';
GO

CREATE EXTERNAL DATA SOURCE CuratedLake
WITH (
    LOCATION = 'https://straccajs.dfs.core.windows.net/curated',
    CREDENTIAL = WorkspaceIdentity
);
GO

CREATE OR ALTER VIEW vw_yellow_trips AS
SELECT *
FROM OPENROWSET(
    BULK 'yellow_trips/**',
    DATA_SOURCE = 'CuratedLake',
    FORMAT = 'PARQUET'
) AS rows;
GO