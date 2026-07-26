/*
LeetCode 1907. Count Salary Categories
https://leetcode.com/problems/count-salary-categories/

Approach:
- Divide all accounts into three salary categories:
  1. Low Salary    : income < 20000
  2. Average Salary: income BETWEEN 20000 AND 50000
  3. High Salary   : income > 50000
- Execute three separate SELECT statements.
- Use SUM(IF(condition, 1, 0)) to count rows that satisfy each salary range.
- Combine all three results using UNION.
- Since SUM(IF(...)) returns 0 when no rows match, every category is always included in the output.

Time Complexity: O(n)
Space Complexity: O(1)

SQL Query:
*/

SELECT 'Low Salary' AS category,
       SUM(IF(income < 20000, 1, 0)) AS accounts_count
FROM Accounts

UNION

SELECT 'Average Salary' AS category,
       SUM(IF(income BETWEEN 20000 AND 50000, 1, 0)) AS accounts_count
FROM Accounts

UNION

SELECT 'High Salary' AS category,
       SUM(IF(income > 50000, 1, 0)) AS accounts_count
FROM Accounts;
