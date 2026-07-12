/*
Problem: 1211. Queries Quality and Percentage
Link: https://leetcode.com/problems/queries-quality-and-percentage/

Approach:
- Group the records by `query_name` so each query appears once.
- Calculate the quality using `AVG(rating / position)` and round it to 2 decimal places.
- Use `IF(rating < 3, 1, 0)` to mark poor queries (rating less than 3).
- Take the average of these values and multiply by 100 to get the percentage of poor queries.
- Round the poor query percentage to 2 decimal places.

Time Complexity: O(n)
- n = number of rows in the Queries table

Space Complexity: O(1)
*/

SELECT
    query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(AVG(IF(rating < 3, 1, 0)) * 100, 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;
