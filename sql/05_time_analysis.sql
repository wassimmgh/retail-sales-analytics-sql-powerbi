/* =========================================================
   05_time_analysis.sql
   Time analysis (year, month, seasonality)
   No VIEW version (direct STR_TO_DATE)
========================================================= */

USE retail_sales;

-- D.1_1 : Sales by Year
SELECT
  YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Year,
  ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY Year
ORDER BY Year;


-- D.1_2 : Profit by Year
SELECT
  YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Year,
  ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Year
ORDER BY Year;


-- D.1_3 : Most Profitable Year
SELECT
  YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Year,
  ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Year
ORDER BY Total_Profit DESC
LIMIT 1;


-- D.1_4 : Least Profitable Year
SELECT
  YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Year,
  ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Year
ORDER BY Total_Profit ASC
LIMIT 1;


-- D.2_5 : Sales By Month (chronological From 1 To 12)
SELECT
  MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month_Number,
  MONTHNAME(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month_Name,
  ROUND(SUM(Sales), 2) AS CA_Mensuelle
FROM superstore
GROUP BY Month_Number, Month_Name
ORDER BY Month_Number;


-- D.2_6 : Profit by Month (Ranking By Most Profitable Month to Least)
SELECT
  MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month_Number,
  MONTHNAME(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month_Name,
  ROUND(SUM(Profit), 2) AS Profit_Mensuelle
FROM superstore
GROUP BY Month_Number, Month_Name
ORDER BY Profit_Mensuelle DESC;


-- D.2_7 : Seasonality (Sales + Profit + Margin) Chronological Order
SELECT
  MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month_Number,
  MONTHNAME(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month_Name,
  ROUND(SUM(Sales), 2) AS CA_Mensuelle,
  ROUND(SUM(Profit), 2) AS Profit_Mensuelle,
  ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS Margin_Pct
FROM superstore
GROUP BY Month_Number, Month_Name
ORDER BY Month_Number;


-- D.2_8 : Loss-making Months (if any) / Answer : NONE
SELECT
  MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month_Number,
  MONTHNAME(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month_Name,
  ROUND(SUM(Sales), 2) AS CA_Mensuelle,
  ROUND(SUM(Profit), 2) AS Profit_Mensuelle,
  ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS Margin_Pct
FROM superstore
GROUP BY Month_Number, Month_Name
HAVING SUM(Profit) < 0
ORDER BY Profit_Mensuelle ASC;
