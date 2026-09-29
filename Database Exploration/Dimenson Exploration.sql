
/*
=============================================================
        DIMENSION EXPLORATION ANALYSIS
=============================================================

Purpose:
    Explore the distinct values and attributes available in
    the customer and product dimension tables.

Analysis:
    1. Explore customer gender.
    2. Explore customer country.
    3. Explore customer marital status.
    4. Explore product line.
    5. Explore product maintenance information.

Source Tables:
    gold.dim_cust
    gold.dim_prd

=============================================================
*/


/*=============================================================
  1. CUSTOMER DIMENSION EXPLORATION
=============================================================*/

-- Explore customer gender
SELECT DISTINCT gender
FROM gold.dim_cust;


-- Explore customer country
SELECT DISTINCT country
FROM gold.dim_cust;


-- Explore customer marital status
SELECT DISTINCT martial_status
FROM gold.dim_cust;


/*=============================================================
  2. PRODUCT DIMENSION EXPLORATION
=============================================================*/

-- Explore product line
SELECT DISTINCT product_line
FROM gold.dim_prd;


-- Explore product maintenance
SELECT DISTINCT maintenance
FROM gold.dim_prd;
