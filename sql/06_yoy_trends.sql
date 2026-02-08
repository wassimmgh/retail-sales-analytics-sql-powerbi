/* =========================================================
   06_yoy_trends.sql
   Year-over-Year growth (Sales & Profit)
========================================================= */

USE retail_sales;

-- YoY Sales growth (YoY = Year over Year) / N=2014 - N+1=2015 ...
SELECT
  year,
  total_sales,
  ROUND(
    (total_sales - LAG(total_sales) OVER (ORDER BY year))
    / NULLIF(LAG(total_sales) OVER (ORDER BY year), 0) * 100,
    2
  ) AS yoy_growth_pct
FROM (
  SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS year,
    SUM(Sales) AS total_sales
  FROM superstore
  GROUP BY year
) t
ORDER BY year;

-- YoY Sales & Profit growth (YoY = Year over Year) / N=2014 - N+1=2015 ...
SELECT
  year,
  total_sales,
  total_profit,
  ROUND(
    (total_sales - LAG(total_sales) OVER (ORDER BY year))
    / NULLIF(LAG(total_sales) OVER (ORDER BY year), 0) * 100,
    2
  ) AS sales_yoy_pct,
  ROUND(
    (total_profit - LAG(total_profit) OVER (ORDER BY year))
    / NULLIF(LAG(total_profit) OVER (ORDER BY year), 0) * 100,
    2
  ) AS profit_yoy_pct
FROM (
  SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS year,
    SUM(Sales)  AS total_sales,
    SUM(Profit) AS total_profit
  FROM superstore
  GROUP BY year
) t
ORDER BY year;
