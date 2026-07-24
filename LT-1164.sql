/*
Problem: 1164. Product Price at a Given Date
Link: https://leetcode.com/problems/product-price-at-a-given-date/

Approach:
- Find the latest price change for each product on or before '2019-08-16'
  using MAX(change_date) grouped by product_id.
- Retrieve the corresponding price for those products.
- Some products may not have any price update before the given date.
  According to the problem, their price should be 10.
- Use UNION to combine:
    1. Products having a valid price before the given date.
    2. Products whose default price is 10.

Time Complexity: O(n log n)
Space Complexity: O(n)

SQL Query:
*/

SELECT
    product_id,
    new_price AS price
FROM Products
WHERE (product_id, change_date) IN (
    SELECT
        product_id,
        MAX(change_date)
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)

UNION

SELECT
    product_id,
    10 AS price
FROM Products
WHERE product_id NOT IN (
    SELECT product_id
    FROM Products
    WHERE change_date <= '2019-08-16'
);
