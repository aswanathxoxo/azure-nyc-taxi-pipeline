# Azure NYC Taxi Data Pipeline

Coursework submission for 7DATA002W Big Data and Cloud Computing
(University of Westminster, 2025/26).

End-to-end Azure platform ingesting NYC TLC Yellow Taxi 2024 data,
processing it with Synapse Spark, and serving analytics through
Synapse Serverless SQL.

## Architecture
ADF (Synapse Pipelines) -> Blob Storage (raw/processed/curated/rejected)
-> Synapse Spark -> Synapse Serverless SQL

## Repository structure
- /notebooks - Synapse Spark notebooks (.ipynb)
- /adf      - pipeline JSON exports
- /sql      - Synapse SQL scripts
- /docs     - architecture diagram, screenshots, security notes
- /scripts  - helper scripts

## Dataset
NYC TLC Yellow Taxi 2024, 12 monthly Parquet files (~35M rows).
Source: https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page