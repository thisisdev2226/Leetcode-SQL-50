/*
# LeetCode 1321 - Restaurant Growth
# Link: https://leetcode.com/problems/restaurant-growth/

# Approach:
1. We need to calculate the total amount spent over the last 7 days (current day + previous 6 days).
2. For every `visited_on` date:
   - Use a correlated subquery to calculate the sum of `amount`
     from `visited_on - 6 days` to the current `visited_on`.
3. Divide that 7-day sum by 7 to get the average amount.
4. Ignore the first six dates because a complete 7-day window
   is not available for them.
5. Since multiple customers may visit on the same date, use
   `GROUP BY visited_on` so that only one row is returned per date.
6. Return the results ordered by `visited_on`.

# Time Complexity:
O(n²)
- For each date, the correlated subquery scans the table again.

# Space Complexity:
O(1)

# SQL Query:
*/

SELECT visited_on,
(
    SELECT SUM(amount)
    FROM Customer
    WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY)
                         AND c.visited_on
) AS amount,

ROUND(
(
    SELECT SUM(amount) / 7
    FROM Customer
    WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY)
                         AND c.visited_on
), 2) AS average_amount

FROM Customer c

WHERE visited_on >= (
    SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY)
    FROM Customer
)

GROUP BY visited_on

ORDER BY visited_on;
