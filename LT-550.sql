/*
Problem: 550. Game Play Analysis IV
Link: https://leetcode.com/problems/game-play-analysis-iv/

Approach:
1. Find each player's first login date using the window function
   `MIN(event_date) OVER (PARTITION BY player_id)`.
2. For every login record, check whether it occurred exactly one day after the
   player's first login using `DATEDIFF(event_date, first_login_date) = 1`.
3. This comparison returns 1 if the player logged in on the day immediately
   after their first login, otherwise 0.
4. Sum these values to count players who returned the next day.
5. Divide by the total number of distinct players and round the result to
   two decimal places.

Time Complexity: O(n)

Space Complexity: O(n)

SQL Query:
*/

SELECT
    ROUND(
        SUM(player_login) / COUNT(DISTINCT player_id),
        2
    ) AS fraction
FROM (
    SELECT
        player_id,
        DATEDIFF(
            event_date,
            MIN(event_date) OVER (PARTITION BY player_id)
        ) = 1 AS player_login
    FROM Activity
) AS new_table;
