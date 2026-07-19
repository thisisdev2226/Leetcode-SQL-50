/*
Problem: 1045. Customers Who Bought All Products
Link: https://leetcode.com/problems/customers-who-bought-all-products/

Approach:
1. Group the records by `customer_id`.
2. Count the distinct products purchased by each customer.
3. Count the total number of products available in the `Product` table.
4. Return only those customers whose distinct purchased product count equals the total number of products.

Time Complexity: O(n + m)
Space Complexity: O(1)

SQL Query:
*/

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(product_key)
    FROM Product
);
