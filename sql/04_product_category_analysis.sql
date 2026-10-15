
-- Project: ShopSphere E-Commerce Analytics Platform
-- File: 04_product_category_analysis.sql
-- Purpose: Analyse product category and product performance.

-- 1. Compare revenue, profit and profit margin by category
SELECT
  Product_Category,
  ROUND(SUM(Total_Sales), 2) AS total_revenue,
  ROUND(SUM(Profit), 2) AS total_profit,
  ROUND(
    SAFE_DIVIDE(SUM(Profit), SUM(Total_Sales)) * 100,
    2
  ) AS profit_margin_percentage
FROM `ecommerce_raw.sales_raw`
GROUP BY Product_Category
ORDER BY total_revenue DESC;


-- 2. Compare order counts and average sales by category
SELECT
  Product_Category,
  COUNT(*) AS number_of_orders,
  ROUND(SUM(Total_Sales), 2) AS total_revenue,
  ROUND(AVG(Total_Sales), 2) AS average_sales_per_order
FROM `ecommerce_raw.sales_raw`
GROUP BY Product_Category
ORDER BY total_revenue DESC;


-- 3. Identify the highest-revenue products
SELECT
  Product_Name,
  Product_Category,
  COUNT(*) AS number_of_orders,
  ROUND(SUM(Total_Sales), 2) AS total_revenue,
  ROUND(SUM(Profit), 2) AS total_profit
FROM `ecommerce_raw.sales_raw`
GROUP BY Product_Name, Product_Category
ORDER BY total_revenue DESC
LIMIT 10;

-- 4. Identify the products generating the highest total profit
SELECT
  Product_Name,
  Product_Category,
  COUNT(*) AS number_of_orders,
  ROUND(SUM(Total_Sales), 2) AS total_revenue,
  ROUND(SUM(Profit), 2) AS total_profit,
  ROUND(
    SAFE_DIVIDE(SUM(Profit), SUM(Total_Sales)) * 100,
    2
  ) AS profit_margin_percentage
FROM `ecommerce_raw.sales_raw`
GROUP BY Product_Name, Product_Category
ORDER BY total_profit DESC
LIMIT 10;


-- 4. Identify the products generating the highest total profit
SELECT
  Product_Name,
  Product_Category,
  COUNT(*) AS number_of_orders,
  ROUND(SUM(Total_Sales), 2) AS total_revenue,
  ROUND(SUM(Profit), 2) AS total_profit,
  ROUND(
    SAFE_DIVIDE(SUM(Profit), SUM(Total_Sales)) * 100,
    2
  ) AS profit_margin_percentage
FROM `ecommerce_raw.sales_raw`
GROUP BY Product_Name, Product_Category
ORDER BY total_profit DESC
LIMIT 10;

-- 5. Identify high-margin products with at least 10 orders
SELECT
  Product_Name,
  Product_Category,
  COUNT(*) AS number_of_orders,
  ROUND(SUM(Total_Sales), 2) AS total_revenue,
  ROUND(SUM(Profit), 2) AS total_profit,
  ROUND(
    SAFE_DIVIDE(SUM(Profit), SUM(Total_Sales)) * 100,
    2
  ) AS profit_margin_percentage
FROM `ecommerce_raw.sales_raw`
GROUP BY Product_Name, Product_Category
HAVING COUNT(*) >= 10
ORDER BY profit_margin_percentage DESC
LIMIT 10;
