/* =========================================================
   03_category_analysis.sql
   Category & Sub-Category performance
========================================================= */

USE retail_sales;

-- B_6: Most profitable categories
SELECT
  Category,
  ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

-- B_7: High sales but low profit categories
SELECT
  Category,
  ROUND(SUM(Profit), 2) AS Total_Profit,
  ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY Category
ORDER BY Total_Profit ASC, Total_Sales DESC;

-- B_8: Loss-making sub-categories (profit < 0) Sub-Categories with negative profit
SELECT
  `Sub-Category`,
  ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY `Sub-Category`
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;

-- B_9: Margin by category (%) Gain or Loss
SELECT
  Category,
  ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS Margin_Pct
FROM superstore
GROUP BY Category
ORDER BY Margin_Pct DESC;

-- (Optional) Sales & Profit by sub-category (ranking by Profit DESC
SELECT
  `Sub-Category`,
  ROUND(SUM(Sales), 2) AS Total_Sales,
  ROUND(SUM(Profit), 2) AS Total_Profit,
  ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS Margin_Pct
FROM superstore
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;

