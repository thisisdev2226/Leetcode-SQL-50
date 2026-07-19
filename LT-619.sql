/*
Problem: 619. Biggest Single Number
Link: https://leetcode.com/problems/biggest-single-number/

Approach:
1. Group the numbers by `num`.
2. Keep only those numbers that appear exactly once using `HAVING COUNT(num) = 1`.
3. From the remaining unique numbers, return the maximum value using `MAX()`.
4. If no single number exists, `MAX()` automatically returns NULL.

Time Complexity: O(n)
Space Complexity: O(n)

SQL Query:
*/

SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
) AS new_table;
