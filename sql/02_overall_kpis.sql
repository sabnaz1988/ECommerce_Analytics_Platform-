
-- Project: ShopSphere E-Commerce Analytics Platform
-- File: 02_overall_kpis.sql
-- Purpose: Calculate overall business performance metrics.

-- Calculate overall revenue, profit and profit margin
SELECT
  ROUND(SUM(Profit), 2) AS total_profit,
  ROUND(SUM(Total_Sales), 2) AS total_revenue,
  ROUND(
    SAFE_DIVIDE(SUM(Profit), SUM(Total_Sales)) * 100,
    2
  ) AS profit_margin_percentage
FROM `ecommerce_raw.sales_raw`;
