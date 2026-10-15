-- Project: ShopSphere E-Commerce Analytics Platform
-- File: 01_data_quality_checks.sql
-- Purpose: Check the quality and reliability of raw sales data.
-- Source: ecommerce_raw.sales_raw

-- 1. Check total number of records
SELECT
  COUNT(*) AS total_rows
FROM `ecommerce_raw.sales_raw`;


-- 2. Inspect column names and data types
SELECT
  column_name,
  data_type
FROM `shopsphere-analytics-511100.ecommerce_raw.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'sales_raw'
ORDER BY ordinal_position;


-- 3. Check for missing values in key fields
SELECT
  COUNT(*) AS total_rows,
  COUNTIF(Order_ID IS NULL) AS missing_order_id,
  COUNTIF(Order_Date IS NULL) AS missing_order_date,
  COUNTIF(Quantity IS NULL) AS missing_quantity,
  COUNTIF(Total_Sales IS NULL) AS missing_total_sales,
  COUNTIF(Profit IS NULL) AS missing_profit
FROM `ecommerce_raw.sales_raw`;


-- 4. Check for duplicate order IDs
SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT Order_ID) AS unique_order_id,
  COUNT(*) - COUNT(DISTINCT Order_ID) AS duplicate_order_id
FROM `ecommerce_raw.sales_raw`;


-- 5. Validate numerical business rules
SELECT
  COUNTIF(Quantity <= 0) AS invalid_quantity,
  COUNTIF(Unit_Price <= 0) AS invalid_unit_price,
  COUNTIF(Discount_Percent < 0 OR Discount_Percent > 30)
    AS invalid_discount,
  COUNTIF(Total_Sales <= 0) AS invalid_total_sales,
  COUNTIF(Shipping_Cost < 0) AS invalid_shipping_cost
FROM `ecommerce_raw.sales_raw`;


-- 6. Check sales against the expected business formula
SELECT
  COUNT(*) AS total_rows,
  COUNTIF(
    ABS(
      Total_Sales -
      (Quantity * Unit_Price * (1 - Discount_Percent / 100))
    ) > 0.01
  ) AS sales_formula_mismatches,
  MAX(
    ABS(
      Total_Sales -
      (Quantity * Unit_Price * (1 - Discount_Percent / 100))
    )
  ) AS maximum_difference
FROM `ecommerce_raw.sales_raw`;
