/*
Problem: 1174. Immediate Food Delivery II
Link: https://leetcode.com/problems/immediate-food-delivery-ii/

Approach:
1. For each customer, find their first order (minimum order_date).
2. Compare the first order date with the customer's preferred delivery date.
3. If both dates are the same, it is considered an immediate delivery.
4. Count all immediate first orders and divide by the total number of customers.
5. Multiply by 100 and round the result to two decimal places.

Time Complexity: O(n log n)
- Grouping by customer_id requires sorting/hash aggregation.

Space Complexity: O(n)
- Stores one record for each customer in the derived table.

SQL Query:
*/

SELECT
    ROUND(
        SUM(IF(min_order_date = min_customer_pref_delivery_date, 1, 0)) * 100
        / COUNT(*),
        2
    ) AS immediate_percentage
FROM (
    SELECT
        customer_id,
        MIN(order_date) AS min_order_date,
        MIN(customer_pref_delivery_date) AS min_customer_pref_delivery_date
    FROM Delivery
    GROUP BY customer_id
) AS first_orders;
