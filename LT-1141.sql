/*
Problem: 1141. User Activity for the Past 30 Days I
Link: https://leetcode.com/problems/user-activity-for-the-past-30-days-i/

Approach:
- Filter the records to include only the last 30 days ending on '2019-07-27'.
- Use DATE_SUB('2019-07-27', INTERVAL 29 DAY) to get the starting date.
- BETWEEN is inclusive, so subtracting 29 days gives exactly 30 days (including 2019-07-27).
- Group by activity_date to calculate the daily active users.
- COUNT(DISTINCT user_id) ensures each user is counted only once per day.

Time Complexity: O(n)
Space Complexity: O(1) (excluding the output)
*/

SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY)
                        AND '2019-07-27'
GROUP BY activity_date;
