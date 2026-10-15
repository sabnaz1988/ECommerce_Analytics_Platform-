-- 
-- Project: ShopSphere E-Commerce Analytics Platform
-- File: 06_regional_analysis.sql
-- Purpose: Analyse revenue, profit and profitability by region and country.
-- Business Question 4: Which regions and countries generate the highest revenue and profit?


-- 1. Compare revenue, profit and profit margin by region

SELECT
  Region,
  COUNT(*) AS number_of_orders,
  ROUND(SUM(Total_Sales), 2) AS total_revenue,
  ROUND(SUM(Profit), 2) AS total_profit,
  ROUND(
    SAFE_DIVIDE(SUM(Profit), SUM(Total_Sales)) * 100,
    2
  ) AS profit_margin_percentage
FROM `shopsphere-analytics-511100.ecommerce_raw.sales_raw`
GROUP BY Region
ORDER BY total_revenue DESC;


-- 2. Compare revenue, profit and profit margin by country

SELECT
  Country,
  Region,
  COUNT(*) AS number_of_orders,
  ROUND(SUM(Total_Sales), 2) AS total_revenue,
  ROUND(SUM(Profit), 2) AS total_profit,
  ROUND(
    SAFE_DIVIDE(SUM(Profit), SUM(Total_Sales)) * 100,
    2
  ) AS profit_margin_percentage
FROM `shopsphere-analytics-511100.ecommerce_raw.sales_raw`
GROUP BY Country, Region
ORDER BY total_revenue DESC;


-- 3. Identify the top 10 countries by revenue

SELECT
  Country,
  Region,
  COUNT(*) AS number_of_orders,
  ROUND(SUM(Total_Sales), 2) AS total_revenue,
  ROUND(SUM(Profit), 2) AS total_profit,
  ROUND(
    SAFE_DIVIDE(SUM(Profit), SUM(Total_Sales)) * 100,
    2
  ) AS profit_margin_percentage
FROM `shopsphere-analytics-511100.ecommerce_raw.sales_raw`
GROUP BY Country, Region
ORDER BY total_revenue DESC
LIMIT 10;
