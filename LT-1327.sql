/*
# 1327. List the Products Ordered in a Period
# Link: https://leetcode.com/problems/list-the-products-ordered-in-a-period/
#
# Approach:
# - Join the `Products` and `Orders` tables using `product_id`.
# - Filter orders placed in February 2020 using
#   `EXTRACT(YEAR_MONTH FROM order_date) = 202002`.
# - Group by `product_id` (and `product_name` for SQL standard compliance).
# - Calculate the total units ordered using `SUM(unit)`.
# - Return only products whose total ordered units are at least 100.
#
# Time Complexity: O(n)
# Space Complexity: O(1) (excluding the output)
*/

SELECT
    p.product_name,
    SUM(o.unit) AS unit
FROM Products p
JOIN Orders o
ON p.product_id = o.product_id
WHERE EXTRACT(YEAR_MONTH FROM o.order_date) = 202002
GROUP BY p.product_id, p.product_name
HAVING SUM(o.unit) >= 100;
