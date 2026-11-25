SELECT region, category, SUM(sales) AS total_sales
FROM sales_data
GROUP BY ROLLUP(region, category);
