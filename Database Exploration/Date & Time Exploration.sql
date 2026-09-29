/*
=============================================================
        DATE & TIME EXPLORATION ANALYSIS
=============================================================

Purpose:
    Explore customer birth-year information and customer
    activity timelines using date-related analysis.

Analysis:
    1. Identify the minimum and maximum customer birth years.
    2. Calculate the age gap across customers.
    3. Identify each customer's first recorded order year.
    4. Calculate customer lifespan based on the first
       recorded order year.

Source Tables:
    gold.dim_cust
    gold.fact_sales

=============================================================
*/

-- 1. Customer Birth-Year Range
SELECT 
    MIN(YEAR(birth_date)) AS min_age_year,
    MAX(YEAR(birth_date)) AS max_age_year,
    MAX(YEAR(birth_date)) - MIN(YEAR(birth_date)) AS age_gap
FROM gold.dim_cust;


-- 2. Customer First Recorded Order & Lifespan
SELECT *
FROM (
    SELECT
        cust_key,
        MIN(YEAR(order_date)) OVER (PARTITION BY cust_key) AS first_visit,
        YEAR(GETDATE()) 
            - MIN(YEAR(order_date)) OVER (PARTITION BY cust_key) AS lifespan
    FROM gold.fact_sales
) l
WHERE first_visit IS NOT NULL
ORDER BY lifespan DESC;
