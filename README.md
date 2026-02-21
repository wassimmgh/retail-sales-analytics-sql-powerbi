# Data Dictionary – Retail Sales Dataset

## 📌 Description

This dataset represents retail sales transactions from a Superstore.

Each row corresponds to a single product sold within a customer order.

# Retail Sales Analytics (SQL + Power BI) — Superstore

## Overview
Project portfolio: end-to-end retail sales analysis using SQL + Power BI.
Dataset: Superstore (Orders / Sales / Profit).

## Objectives
- Track core KPIs (Sales, Profit, Margin %)
- Analyze performance by Category & Sub-Category
- Time analysis (trends + filters)
- YoY Growth analysis (in progress / known limitation)

## KPIs
- Total Sales
- Total Profit
- Margin %

## Power BI Dashboard
### 1) KPI Overview
![KPI Overview](powerbi/kpi_overview.png)

### 2) Time Analysis
(ajoute tes images time_analysis_*.png)

### 3) Category Analysis
![Category Analysis](powerbi/category_analysis.png)

## SQL Scripts
- `sql/02_kpis_global.sql` — Global KPIs
- `sql/03_category_analysis.sql` — Category/Sub-category analysis
- `sql/05_time_analysis.sql` — Time analysis
- `sql/06_yoy_trends.sql` — YoY trends

## Repository Structure
- `data/raw/` — dataset
- `sql/` — SQL scripts
- `powerbi/` — PBIX + dashboard screenshots
- `docs/` — documentation (dictionary, KPI definitions)

## How to Use
1. Open the `.pbix` file in Power BI Desktop: `powerbi/Projet_Superstore_powerBI.pbix`
2. Ensure dataset path points to: `data/raw/superstore.csv`
3. Refresh data

## Notes / Limitations
- YoY measures depend on a proper Date table and clean relationships.

## 📊 Columns

| Column Name     | Description |
|-----------------|------------|
| order_id        | Unique identifier of the order |
| order_date      | Date when the order was placed |
| ship_date       | Date when the order was shipped |
| ship_mode       | Shipping method used |
| customer_id     | Unique customer identifier |
| customer_name   | Customer full name |
| segment         | Customer segment (Consumer, Corporate, Home Office) |
| country         | Country name |
| region          | Region name |
| state           | State name |
| city            | City name |
| product_id      | Unique product identifier |
| category        | Product category |
| sub_category    | Product sub-category |
| product_name    | Product name |
| sales           | Sales amount (USD) |
| quantity        | Quantity ordered |
| discount        | Discount applied |
| profit          | Profit amount (USD) |

---

## 📝 Notes

- Monetary values are expressed in **USD**.
- One order can contain multiple products.
- Dates were originally stored as text and converted using `STR_TO_DATE()` for analysis.
