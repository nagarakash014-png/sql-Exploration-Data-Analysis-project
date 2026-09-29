
/*
=============================================================
        MAGNITUDE ANALYSIS
=============================================================

Purpose:
    Analyze business measures across different dimensions
    to understand sales magnitude and performance.

Analysis:
    1. Analyze sales and average sales per customer.
    2. Analyze sales and average sales per product.
    3. Analyze sales performance by category.
    4. Analyze sales performance by sub-category.
    5. Analyze sales performance across years.

Source Tables:
    gold.fact_sales
    gold.dim_prd

=============================================================
*/


/*=============================================================
  1. SALES BY CUSTOMER
=============================================================*/

SELECT 
    cust_key,
    SUM(sales) AS sales_per_cust,
    AVG(sales) AS avg_sales_cust
FROM gold.fact_sales
GROUP BY cust_key
ORDER BY sales_per_cust;


/*=============================================================
  2. SALES BY PRODUCT
=============================================================*/

SELECT 
    product_key,
    SUM(sales) AS sales_by_product,
    AVG(sales) AS avg_sales_product
FROM gold.fact_sales
GROUP BY product_key
ORDER BY sales_by_product;


/*=============================================================
  3. SALES BY CATEGORY
=============================================================*/

SELECT 
    categorie,
    SUM(sales) AS sales_per_category,
    AVG(sales) AS avg_sales_per_category,
    MIN(sales) AS low_sales_cat,
    MAX(sales) AS high_sales_cust
FROM gold.fact_sales AS s
LEFT JOIN gold.dim_prd AS p
    ON s.product_key = p.product_key
GROUP BY categorie;


/*=============================================================
  4. SALES BY SUB-CATEGORY
=============================================================*/

SELECT 
    sub_categorie,
    SUM(sales) AS sales_per_category,
    AVG(sales) AS avg_sales_per_category,
    MIN(sales) AS low_sales_cat,
    MAX(sales) AS high_sales_cust
FROM gold.fact_sales AS s
LEFT JOIN gold.dim_prd AS p
    ON s.product_key = p.product_key
GROUP BY sub_categorie;


/*=============================================================
  5. SALES BY YEAR
=============================================================*/

SELECT 
    YEAR(order_date) AS year,
    SUM(sales) AS sales_by_year
FROM gold.fact_sales
GROUP BY YEAR(order_date)
ORDER BY year;
