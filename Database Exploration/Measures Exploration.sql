
/*
=============================================================
        MEASURES & KPI ANALYSIS
=============================================================

Purpose:
    Calculate key measures and overall business KPIs from
    the sales fact table.

Analysis:
    1. Calculate total sales.
    2. Calculate average sales.
    3. Calculate total quantity.
    4. Calculate total price.
    5. Calculate average price.

Source Table:
    gold.fact_sales

=============================================================
*/


-- Calculate overall sales measures and KPIs
SELECT 
    SUM(sales) AS total_sales,
    AVG(sales) AS avg_sales,
    COUNT(quantity) AS total_quantity,
    SUM(price) AS total_price,
    AVG(price) AS avg_price
FROM gold.fact_sales;
