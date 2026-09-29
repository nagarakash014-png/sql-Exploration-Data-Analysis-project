
/*
=============================================================
        RANKING ANALYSIS
=============================================================

Purpose:
    Rank countries, products, categories, and customers based
    on sales and revenue measures to identify the highest-
    performing dimensions.

Analysis:
    1. Rank countries by total sales.
    2. Identify the top 10 products by total sales.
    3. Rank categories by total revenue.
    4. Identify the top 10 customers by total revenue.

Source Tables:
    gold.fact_sales
    gold.dim_cust
    gold.dim_prd

=============================================================
*/


/*=============================================================
  1. RANK COUNTRIES BY SALES
=============================================================*/

SELECT
    country,
    SUM(sales) AS total_sales,
    ROW_NUMBER() OVER (
        ORDER BY SUM(sales) DESC
    ) AS ranking_by_sales
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_cust AS c
    ON f.cust_key = c.cust_key
GROUP BY country;


/*=============================================================
  2. TOP 10 PRODUCTS BY SALES
=============================================================*/

SELECT TOP 10
    product_name,
    SUM(sales) AS total_sales,
    ROW_NUMBER() OVER (
        ORDER BY SUM(sales) DESC
    ) AS ranking_by_sales
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_prd AS p
    ON f.product_key = p.product_key
GROUP BY product_name;


/*=============================================================
  3. RANK CATEGORIES BY REVENUE
=============================================================*/

SELECT
    categorie,
    SUM(sales) AS revenue,
    ROW_NUMBER() OVER (
        ORDER BY SUM(sales) DESC
    ) AS ranking_by_rev
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_prd AS p
    ON f.product_key = p.product_key
GROUP BY categorie;


/*=============================================================
  4. TOP 10 CUSTOMERS BY REVENUE
=============================================================*/

SELECT TOP 10
    cust_key,
    SUM(sales) AS revenue,
    ROW_NUMBER() OVER (
        ORDER BY SUM(sales) DESC
    ) AS ranking_by_rev_cust
FROM gold.fact_sales
GROUP BY cust_key;
