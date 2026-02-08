/* =========================================================
   04_geo_analysis.sql
   Geographic performance
========================================================= */

USE retail_sales;

-- C_10: Margin by region (%) Gain Or Loss By Region (West/East/South/Central)
SELECT
  Region,
  ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS Margin_Pct
FROM superstore
GROUP BY Region
ORDER BY Margin_Pct DESC;

-- C_11: Top 10 cities by sales (with state for uniqueness) 
SELECT
  State,
  City,
  ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY State, City
ORDER BY Total_Sales DESC
LIMIT 10;

-- Top 10 cities by profit (with state)
SELECT
  State,
  City,
  ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY State, City
ORDER BY Total_Profit DESC
LIMIT 10;

-- C_12: Cities with high sales but negative profit (risk list) Loosing Cities
SELECT
  State,
  City,
  ROUND(SUM(Sales), 2) AS Total_Sales,
  ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY State, City
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC, Total_Sales DESC
LIMIT 10;

-- (Optional) State level summary / Showing (Sales/Profit/Margin) By State, Where we are profitable and where we are not (With The margin Showing the Best Ratio)
SELECT
  State,
  ROUND(SUM(Sales), 2) AS Total_Sales,
  ROUND(SUM(Profit), 2) AS Total_Profit,
  ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS Margin_Pct
FROM superstore
GROUP BY State
ORDER BY Total_Profit DESC;

