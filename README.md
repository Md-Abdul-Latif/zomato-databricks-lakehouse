### Zomato Databricks Lakehouse & Analytics Project
A modern **data engineering and analytics project built on Databricks** using a Zomato restaurant and food-order dataset.

The project demonstrates an end-to-end **Lakehouse architecture**, including data ingestion, transformation, data quality validation, dimensional modeling, fact-table creation, and analytical dashboards.

## 🚧 Project Status

**Currently in development**

The core Bronze, Silver, and Gold data layers have been implemented and validated. Dashboard development and final documentation are currently in progress.

---

## 🏗️ Architecture Diagram

![Medallion Architecture](docs/architecture/architecture_diagram.txt)

### Layer Overview

| Layer | Purpose | Key Operations |
| :--- | :--- | :--- |
| **🥉 Bronze** | Raw data ingestion | CSV → Delta tables, add audit columns |
| **🥈 Silver** | Data cleaning | Null handling, type correction, deduplication |
| **🥇 Gold** | Business-ready data | Star schema, aggregations, KPIs |
| **📊 Dashboards** | Visualization | 4 interactive dashboards |

### Notebooks

| Order | Notebook | Layer |
| :--- | :--- | :--- |
| 1 | `01_bronze_ingestion` | Bronze |
| 2 | `02_silver_transformation` | Silver |
| 3 | `03_gold_dimensions` | Gold |
| 4 | `04_gold_analytics` | Gold |
| 5 | `05_data_quality` | Validation |
