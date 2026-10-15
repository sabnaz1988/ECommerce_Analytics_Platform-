# ShopSphere E-Commerce Analytics Platform

1. ## Project Overview

### Business Context

ShopSphere is a fictional e-commerce business. This project analyses sales data to understand revenue, profitability, product performance and customer purchasing behaviour.

### Project Objective

The objective is to use data validation and SQL analysis to identify business trends, evaluate product performance and develop data-driven recommendations.

### Dataset

- Source: Global E-Commerce Sales & Customer Data (Kaggle)
- Table: ecommerce_raw.sales_raw
- Records: 2,000 rows
- Columns: 15
- Analysis period: 2 January 2023 – 31 December 2025
- Analysis tool: Google BigQuery (SQL)

2. ## Python Data Exploration

### Purpose

Python was used to explore the raw e-commerce dataset locally before and alongside SQL analysis in BigQuery.

### Tools and Libraries

- Python
- pandas
- NumPy

### Exploration Performed

The python/explore_data.py script was used to examine:

- Dataset dimensions, column names and data types.
- Missing values and duplicate order IDs.
- The date range covered by the dataset.
- Summary statistics for numerical columns.
- Values in categorical columns, such as customer segment, region and product category.
- Consistency between recorded sales and the expected sales calculation.

### Role in the Project
- Python helps us understand the dataset and identify potential quality issues before deeper business analysis in BigQuery.

3. ## BigQuery Data Quality and Validation

### Checks Performed

Using Google BigQuery SQL, we checked:

- Total row count and column data types.

- Missing values in key fields.

- Duplicate order IDs.

- Numerical business rules.

- Recorded sales against the expected sales formula, allowing for rounding differences.

### Results

- Total records: 2,000

- Missing values in the checked key fields: 0

- Duplicate order IDs: 0

- Invalid values in the numerical checks performed: 0

- Sales formula mismatches exceeding $0.01: 0

- Maximum difference from the expected sales formula: approximately $0.005

### Interpretation

The checks found no issues in the fields and rules tested. This supports using the dataset for exploratory business analysis, but it does not guarantee that every field is accurate or that every possible data-quality issue has been identified.

4. ## Business Question 1: How Have Revenue and Profit Changed Over Time?

### Key Findings

- Total revenue: $484,559.34

- Total profit: $158,872.32

- Overall profit margin: 32.79%

- Revenue and profit both declined in 2024 compared with 2023.

- Both recovered in 2025, which recorded the highest annual revenue and profit across the three years.

- Year-over-year revenue growth was approximately -5.65% in 2024 and +6.32% in 2025.

### Interpretation

The results show a decline in performance during 2024, followed by a recovery in 2025. Further analysis is needed to understand which factors may have contributed to these changes.

### Potential Business Action

Investigate monthly sales trends, product performance, customer segments and discount patterns to identify possible contributors to the changes in revenue and profit.

5. ##  Business Question 2: Which Products and Categories Perform Best?

### Category Findings

- Furniture generated the highest revenue ($256,274.68) and profit ($81,171.57).

- Technology generated $139,518.22 in revenue and $48,268.65 in profit.

- Clothing & Accessories achieved the highest category profit margin at 37.64%.

- Office Supplies had the lowest category profit margin at 17.12%.

### Product Findings

- The Standing Desk Converter recorded the highest revenue among the top-revenue products analysed, at $46,614.22.

- The Ergonomic Office Chair generated the highest profit among those top-revenue products, at $15,104.58.

- The Business Casual Blazer had the highest profit margin in the top-margin product analysis, at 41.91%, based on 40 records.

### Interpretation

Furniture is the strongest category by total revenue and profit in this dataset, while Clothing & Accessories has a higher profit margin. Office Supplies may warrant further investigation because its recorded margin is lower than the other categories.

### Potential Business Action

Investigate product costs, discount levels and sales volumes to understand why profitability differs across categories. Consider product-level performance when prioritising promotions, rather than relying on revenue or profit margin alone.