/*
Problem: 1667. Fix Names in a Table
Link: https://leetcode.com/problems/fix-names-in-a-table/

Approach:
- Extract the first character of each name and convert it to uppercase.
- Convert the remaining characters to lowercase.
- Concatenate both parts using CONCAT().
- Sort the result by user_id.

Time Complexity: O(n)
Space Complexity: O(1)

SQL Query:
*/

SELECT
    user_id,
    CONCAT(
        UPPER(LEFT(name, 1)),
        LOWER(RIGHT(name, LENGTH(name) - 1))
    ) AS name
FROM Users
ORDER BY user_id;
