
-- Project: ShopSphere E-Commerce Analytics Platform
-- File: 03_revenue_profit_trends.sql
-- Purpose:Analyse annual revenue, profit and year-over-year revenue growth.
-- Business Question 1: How have revenue and profit changed over time?

-- 1. Compare revenue and profit by year
SELECT
  EXTRACT(YEAR FROM Order_Date) AS order_year,
  ROUND(SUM(Total_Sales), 2) AS total_revenue,
  ROUND(SUM(Profit), 2) AS total_profit
FROM `ecommerce_raw.sales_raw`
GROUP BY order_year
ORDER BY order_year;


-- 2. Calculate year-over-year revenue growth
WITH yearly_sales AS (
  SELECT
    EXTRACT(YEAR FROM Order_Date) AS order_year,
    SUM(Total_Sales) AS total_revenue,
    SUM(Profit) AS total_profit
  FROM `ecommerce_raw.sales_raw`
  GROUP BY order_year
)

SELECT
  order_year,
  ROUND(total_revenue, 2) AS total_revenue,
  ROUND(
    SAFE_DIVIDE(
      total_revenue - LAG(total_revenue) OVER (ORDER BY order_year),
      LAG(total_revenue) OVER (ORDER BY order_year)
    ) * 100,
    2
  ) AS revenue_growth_percent,
  ROUND(total_profit, 2) AS total_profit
FROM yearly_sales
ORDER BY order_year;
