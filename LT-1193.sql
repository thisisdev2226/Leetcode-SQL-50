/*
Problem: 1193. Monthly Transactions I
Link: https://leetcode.com/problems/monthly-transactions-i/

Approach:
1. Extract the month from `trans_date` using `LEFT(trans_date, 7)` (format: YYYY-MM).
2. Group the records by `month` and `country`.
3. Count all transactions using `COUNT(id)` as `trans_count`.
4. Count approved transactions using:
      SUM(IF(state = 'approved', 1, 0))
5. Calculate the total transaction amount using:
      SUM(amount)
6. Calculate the total approved transaction amount using:
      SUM(IF(state = 'approved', amount, 0))
7. Return the aggregated results for each month-country pair.

Time Complexity: O(n)
- Each transaction is processed once.

Space Complexity: O(g)
- `g` is the number of unique (month, country) groups created during aggregation.
*/

SELECT
    LEFT(trans_date, 7) AS month,
    country,
    COUNT(id) AS trans_count,
    SUM(IF(state = 'approved', 1, 0)) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(IF(state = 'approved', amount, 0)) AS approved_total_amount
FROM Transactions
GROUP BY month, country;
