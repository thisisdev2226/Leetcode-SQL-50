/*
Problem: 176. Second Highest Salary
Link: https://leetcode.com/problems/second-highest-salary/

Approach:
- Find the maximum salary in the Employee table.
- Exclude that maximum salary using a subquery.
- Apply MAX() again on the remaining salaries to get the second highest salary.
- If a second highest salary does not exist, MAX() automatically returns NULL.

Time Complexity: O(n)
Space Complexity: O(1)
*/

SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary NOT IN (
    SELECT MAX(salary)
    FROM Employee
);
