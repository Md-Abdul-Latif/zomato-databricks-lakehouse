# Zomato Databricks Lakehouse & Analytics Project

A modern **data engineering and analytics project built on Databricks** using a Zomato restaurant and food-order dataset.

The project demonstrates an end-to-end **Lakehouse architecture**, including data ingestion, transformation, data quality validation, dimensional modeling, fact-table creation, and analytical dashboards.

## 🚧 Project Status

**Currently in development**

The core Bronze, Silver, and Gold data layers have been implemented and validated. Dashboard development and final documentation are currently in progress.

---

## 🎯 Project Objectives

The main objectives of this project are to:

* Build an end-to-end data pipeline using Databricks
* Implement a Bronze → Silver → Gold Lakehouse architecture
* Process CSV source data using PySpark and Spark SQL
* Store transformed data using Delta tables
* Clean and standardize raw data
* Handle invalid and duplicate records
* Implement dimensional and fact-table modeling
* Perform data quality and validation checks
* Create business-oriented analytical datasets
* Build interactive dashboards using Databricks SQL
* Demonstrate practical data engineering best practices

---

## 🏗️ Architecture

The project follows a Medallion/Lakehouse architecture:

```text
                    ┌──────────────────────┐
                    │     Source CSVs      │
                    │                      │
                    │ countries.csv        │
                    │ foods.csv            │
                    │ menus.csv             │
                    │ orders.csv            │
                    │ restaurants.csv      │
                    │ users.csv             │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │    Bronze Layer      │
                    │                      │
                    │ Raw/Ingested Data    │
                    │ Delta Tables         │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │     Silver Layer     │
                    │                      │
                    │ Cleaning             │
                    │ Standardization      │
                    │ Type Casting         │
                    │ Deduplication        │
                    │ Data Validation      │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │      Gold Layer      │
                    │                      │
                    │ Dimensions           │
                    │ Fact Tables          │
                    │ Aggregations         │
                    │ Business Metrics     │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │  Databricks SQL      │
                    │     Dashboards       │
                    │                      │
                    │ KPIs & Analytics     │
                    └──────────────────────┘
```

---

## 🥉 Bronze Layer

The Bronze layer contains the initially ingested source data.

Source datasets include:

* `countries`
* `foods`
* `menus`
* `orders`
* `restaurants`
* `users`

Metadata such as ingestion timestamp and source file information is retained to support data lineage and traceability.

---

## 🥈 Silver Layer

The Silver layer contains cleaned and standardized datasets.

Key transformations include:

* Trimming leading and trailing whitespace
* Standardizing column values
* Casting columns to appropriate data types
* Removing duplicate records
* Filtering invalid or null business keys
* Standardizing restaurant, food, user, and order identifiers
* Converting order dates to proper date types
* Validating relationships between datasets

The cleaned Silver tables are stored as Delta tables under the `workspace.zomato_silver` schema.

### Silver Tables

| Table         | Purpose                     |
| ------------- | --------------------------- |
| `countries`   | Country reference data      |
| `foods`       | Food/item information       |
| `menus`       | Restaurant menu information |
| `orders`      | Customer order transactions |
| `restaurants` | Restaurant information      |
| `users`       | Customer/user information   |

---

## 🥇 Gold Layer

The Gold layer provides analytics-ready datasets designed for business reporting and dashboard development.

Current Gold datasets include:

### Dimension Tables

* `dim_foods`
* `dim_users`
* `dim_restaurants`

### Fact / Analytical Tables

* `daily_sales`
* `customer_order_analysis`

The Gold layer combines cleaned transactional and reference data to provide meaningful business metrics for analytical reporting.

---

## 🔍 Data Quality

Data quality checks are included as part of the pipeline.

Current validation checks include:

* Row-count validation
* Null key validation
* Duplicate-key detection
* Distinct-key validation
* Uniqueness validation
* Referential integrity checks
* Invalid identifier detection
* Overall table status validation

Example validation result:

```text
table_name                overall_status
-----------------------------------------
customer_order_analysis  PASS
daily_sales              PASS
dim_foods                PASS
dim_restaurants          PASS
dim_users                PASS
```

The data quality notebook is responsible for validating the final analytical datasets before dashboard consumption.

---

## 📊 Dashboard

The project includes analytical dashboards built using **Databricks SQL**.

Dashboard development is currently in progress.

The first dashboard focuses on **customer and order analysis**, with metrics and visualizations intended to provide insights into:

* Customer ordering behavior
* Order volume
* Sales performance
* Restaurant activity
* Food/menu activity
* Customer-level order patterns

Additional dashboards and visualizations may be added as the project develops.

---

## 📁 Project Structure

```text
zomato-databricks-lakehouse/
│
├── data/
│   ├── countries.csv
│   ├── foods.csv
│   ├── menus.csv
│   ├── orders.csv
│   ├── restaurants.csv
│   └── users.csv
│
├── docs/
│   └── architecture/
│
├── notebooks/
│   ├── 01_bronze_ingestion.py
│   ├── 02_silver_transformation.py
│   ├── 03_gold_dimensions.py
│   ├── 04_gold_fact_orders.py
│   └── 05_data_quality.py
│
├── .gitignore
├── README.md
└── requirements.txt
```

---

## 🛠️ Technologies

The project currently uses:

* **Databricks**
* **Apache Spark**
* **PySpark**
* **Spark SQL**
* **Delta Lake**
* **Databricks SQL**
* **Git / GitHub**
* **Python**

---

## 📓 Notebooks

| Notebook                      | Description                                      |
| ----------------------------- | ------------------------------------------------ |
| `01_bronze_ingestion.py`      | Ingests raw source files into the Bronze layer   |
| `02_silver_transformation.py` | Cleans, standardizes, and validates source data  |
| `03_gold_dimensions.py`       | Creates Gold dimension tables                    |
| `04_gold_fact_orders.py`      | Creates analytical fact and aggregation datasets |
| `05_data_quality.py`          | Performs data quality and integrity checks       |

---

## 📈 Current Data Scale

The current implementation processes approximately:

| Dataset     | Records |
| ----------- | ------: |
| Foods       |   371K+ |
| Menus       |   665K+ |
| Restaurants |   148K+ |
| Users       |    100K |
| Orders      |     281 |
| Countries   |     249 |

The relatively small order dataset is useful for demonstrating the complete pipeline architecture, transformation logic, dimensional modeling, data quality validation, and dashboard workflow.

---

## 🔄 End-to-End Pipeline

The current workflow is:

```text
CSV Source Data
      ↓
Bronze Ingestion
      ↓
Silver Transformation
      ↓
Data Cleaning & Validation
      ↓
Gold Dimensions
      ↓
Gold Fact / Analytical Tables
      ↓
Data Quality Checks
      ↓
Databricks SQL
      ↓
Analytics Dashboards
```

---

## 🚀 Future Improvements

Planned improvements include:

* Complete the remaining Databricks SQL dashboards
* Add additional business KPIs
* Improve dashboard interactivity with filters
* Add more advanced analytical queries
* Improve pipeline orchestration
* Add incremental ingestion
* Add stronger schema evolution handling
* Implement automated data-quality monitoring
* Add CI/CD integration
* Improve documentation and architecture diagrams
* Add production-oriented monitoring and logging

---

## 📌 Project Purpose

This project is intended as a practical demonstration of **modern data engineering using Databricks and Lakehouse architecture**.

It focuses not only on moving data from source to destination, but also on:

**data quality → transformation → modeling → analytics → visualization**

The goal is to demonstrate how raw operational data can be transformed into reliable, analytics-ready datasets for business intelligence and decision-making.
