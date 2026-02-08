/* =========================================================
   02_kpis_global.sql
   Project: Retail Superstore Sales Analysis
   DB: MySQL
   Notes:
   - Column names contain spaces (e.g., `Order ID`, `Order Date`)
   - Sales/Profit are numeric
========================================================= */

USE retail_sales;

-- A_0: Quick sanity checks
SELECT COUNT(*) AS total_rows FROM superstore;

-- A_1: Total Revenue (Chiffre d'affaires)
SELECT ROUND(SUM(Sales), 2) AS CA_Total
FROM superstore;

-- A_2: Total Profit
SELECT ROUND(SUM(Profit), 2) AS Profit_Total
FROM superstore;

-- A_3: Global Margin (%)
SELECT ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS Global_Margin_Pct
FROM superstore;

-- A_4: Total Orders (distinct orders) Showing the orders with Unique IDs (No Redundancy)
SELECT COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM superstore;

-- A_5: Average Order Value (AVG_Order_Value / Panier moyen) (How much does each Order is Solde on average?)
SELECT ROUND(SUM(Sales) / NULLIF(COUNT(DISTINCT `Order ID`), 0), 2) AS Average_Order_Value
FROM superstore;

-- (Optional) Total Customers  Showing the Customers with Unique IDs (No Redundancy)
SELECT COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM superstore;

-- (Optional) Average Sales per Customer (How much does each Customer is Spending on average?)
SELECT ROUND(SUM(Sales) / NULLIF(COUNT(DISTINCT `Customer ID`), 0), 2) AS Avg_Sales_Per_Customer
FROM superstore;

