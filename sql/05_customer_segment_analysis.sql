-- -- Project: ShopSphere E-Commerce Analytics Platform
-- Business Question 3:
-- How does purchasing behaviour differ across customer segments?

SELECT
  Customer_Segment,
  COUNT(*) AS number_of_orders,
  ROUND(SUM(Total_Sales), 2) AS total_revenue,
  ROUND(SUM(Profit), 2) AS total_profit,
  ROUND(AVG(Total_Sales), 2) AS average_sales_per_order,
  ROUND(
    SAFE_DIVIDE(SUM(Profit), SUM(Total_Sales)) * 100,
    2
  ) AS profit_margin_percentage
FROM `shopsphere-analytics-511100.ecommerce_raw.sales_raw`
GROUP BY Customer_Segment
ORDER BY total_revenue DESC;
