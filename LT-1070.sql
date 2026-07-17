/*
Problem: 1070. Product Sales Analysis III
Link: https://leetcode.com/problems/product-sales-analysis-iii/

Approach:
- Find the earliest (minimum) year for each product using a subquery.
- Join the original Sales table with the subquery on:
  1. product_id
  2. year = first_year
- This returns the quantity and price corresponding to the first year each product was sold.

Time Complexity: O(n)
Space Complexity: O(n)
*/

SELECT
    s.product_id,
    s.year AS first_year,
    s.quantity,
    s.price
FROM Sales s
JOIN (
    SELECT
        product_id,
        MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) f
ON s.product_id = f.product_id
AND s.year = f.first_year;
