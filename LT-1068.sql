/*
LeetCode 1068. Product Sales Analysis I
https://leetcode.com/problems/product-sales-analysis-i/

Approach:
- Use a LEFT JOIN to combine the Sales table with the Product table.
- Match the tables using product_id.
- Retrieve the product name from Product and the year and price from Sales.
- Although an INNER JOIN also works for this problem (since every sale has a valid product),
  a LEFT JOIN still returns all sales even if a matching product is missing.

Time Complexity: O(n)
Space Complexity: O(1)
*/

# Write your MySQL query statement below
SELECT p.product_name,
       s.year,
       s.price
FROM Sales AS s
LEFT JOIN Product AS p
ON s.product_id = p.product_id;
