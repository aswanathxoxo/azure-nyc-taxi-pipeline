# Azure NYC Taxi Data Pipeline

Coursework submission for **7DATA002W Big Data and Cloud Computing**  
University of Westminster, 2025/26.

This project builds an Azure data pipeline for the NYC TLC Yellow Taxi 2024 dataset. The pipeline ingests the monthly taxi files, stores them in a zoned data lake, processes the data with Synapse Spark, and makes the curated output available through Synapse Serverless SQL.

The full run processed **41,169,720 raw rows** and produced **35,632,762 curated rows** after validation, cleaning, deduplication, enrichment, and anonymisation. The final row count was checked across Spark and SQL to confirm consistency.

## Architecture

The main flow is:

NYC TLC public data source  
-> Synapse Pipeline `pl_ingest_yellow_taxi`  
-> Azure Blob Storage / ADLS Gen2 style data lake  
-> Synapse Spark notebooks  
-> Synapse Serverless SQL view `vw_yellow_trips`  
-> Analytical outputs

The storage layout uses four zones:

- `raw`
- `processed`
- `curated`
- `rejected`

The Spark processing is split into three notebooks:

1. `01_validate_raw.ipynb`
2. `02_clean_dedupe.ipynb`
3. `03_curate_enrich.ipynb`

The final SQL analysis covers hourly demand, borough fare and tip patterns, and weekday versus weekend trips.

Security settings include managed identity, RBAC, secure transfer, TLS 1.2, Key Vault, and basic anonymisation in the curated layer.

## Repository structure

- `/notebooks` contains the Synapse Spark notebooks
- `/sql` contains the Serverless SQL setup and analytical queries
- `/adf` contains the exported Synapse pipeline JSON
- `/docs` contains screenshots, architecture notes, and supporting evidence
- `/scripts` contains helper scripts used during development

## Dataset

The dataset used is the **NYC TLC Yellow Taxi 2024** trip record data.

It includes 12 monthly Parquet files for 2024, with **41,169,720 rows** after ingestion.

Source: https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page

The `taxi_zone_lookup.csv` file was also used to add borough and zone names to pickup and drop-off locations.

## Current state

This repository contains the final coursework artefacts as of **4 May 2026**. The technical report explains the design choices, implementation steps, validation checks, results, limitations, and reflection.

## License

MIT — see `LICENSE`.
