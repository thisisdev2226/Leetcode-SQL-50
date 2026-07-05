/*
Problem: 1581. Customer Who Visited but Did Not Make Any Transactions
Link: https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/

Approach:
- Perform a LEFT JOIN between Visits and Transactions using visit_id.
- Keep only those visits where no matching transaction exists (transaction_id IS NULL).
- Group the remaining records by customer_id.
- Count the number of such visits for each customer.

Time Complexity: O(n + m)
- n = number of rows in Visits
- m = number of rows in Transactions

Space Complexity: O(1)
*/

SELECT
    v.customer_id,
    COUNT(*) AS count_no_trans
FROM Visits AS v
LEFT JOIN Transactions AS t
    ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;
