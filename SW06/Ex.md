```sql
-- Ex 1
SELECT
a.s_year,
a.s_quarter,
SUM(a.sales) AS total_sales
FROM ap_sales a
GROUP BY a.s_year, a.s_quarter
ORDER BY a.s_year, a.s_quarter;


-- Ex 2
SELECT
a.s_year,
a.s_quarter,
SUM(a.sales) AS total_sales
FROM ap_sales a
GROUP BY GROUPING SETS
(a.s_year, (a.s_year, a.s_quarter))
ORDER BY a.s_year, a.s_quarter;

-- Ex 3

SELECT
a.s_year,
a.s_quarter,
SUM(a.sales) AS total_sales,
GROUPING(a.s_year),
GROUPING(a.s_quarter)
FROM ap_sales a
GROUP BY GROUPING SETS
(a.s_year, (a.s_year, a.s_quarter))
ORDER BY a.s_year, a.s_quarter;

-- Ex 4
SELECT
a.s_year,
a.s_month,
a.sales AS monthly_sales,
SUM(a.sales) OVER (
ORDER BY a.s_year, a.s_month

) AS cum_monthly_sales_total
FROM ap_sales a
ORDER BY a.s_year, a.s_month
;

-- Ex 5
SELECT
a.s_year, a.s_month,
a.sales AS monthly_sales,
SUM(a.sales) OVER (
ORDER BY a.s_year, a.s_month

) AS cum_monthly_sales_total,
SUM(a.sales) OVER (
PARTITION BY a.s_year
ORDER BY a.s_year, a.s_month

) AS cum_monthly_sales_per_year
FROM ap_sales a
ORDER BY a.s_year, a.s_month;

-- Ex 6 a
SELECT
a.s_year, a.s_month,
a.sales AS monthly_sales,
LAG(a.sales,1) OVER (ORDER BY a.s_year,
a.s_month) AS previous_month_sales
FROM ap_sales a
ORDER BY a.s_year, a.s_month;

-- Ex 6 b

SELECT
a.s_year,
a.s_month,
a.sales AS monthly_sales,
LAG(a.sales,1) OVER (
ORDER BY a.s_year, a.s_month

) AS previous_month_sales,
TO_CHAR(
ROUND((a.sales/(LAG(a.sales,1) OVER (
ORDER BY a.s_year, a.s_month
)) -1)*100,1),'9999.9'
)||' %' AS change
FROM ap_sales a
ORDER BY a.s_year, a.s_month;

```
