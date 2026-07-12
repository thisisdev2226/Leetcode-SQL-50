/*
Problem: 1633. Percentage of Users Attended a Contest
Link: https://leetcode.com/problems/percentage-of-users-attended-a-contest/

Approach:
- Group the Register table by contest_id.
- Count the distinct users registered for each contest.
- Use a subquery to find the total number of users from the Users table.
- Calculate the percentage as (registered users × 100) / total users.
- Round the result to 2 decimal places.
- Sort by percentage in descending order and contest_id in ascending order.

Time Complexity: O(R + U)
- R = number of rows in Register
- U = number of rows in Users

Space Complexity: O(1)
*/

SELECT
    r.contest_id,
    ROUND(
        COUNT(DISTINCT r.user_id) * 100 /
        (SELECT COUNT(*) FROM Users),
        2
    ) AS percentage
FROM Register AS r
GROUP BY r.contest_id
ORDER BY percentage DESC, contest_id ASC;
