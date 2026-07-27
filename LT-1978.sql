/*
Problem: 1978. Employees Whose Manager Left the Company
Link: https://leetcode.com/problems/employees-whose-manager-left-the-company/

Approach:
1. Select employees whose salary is less than 30000.
2. Exclude employees with a NULL manager_id, since they do not have a manager.
3. Use a NOT IN subquery to find employees whose manager_id does not exist in
   the Employees table, meaning their manager has left the company.
4. Sort the result by employee_id in ascending order.

Time Complexity: O(n)
Space Complexity: O(n)
*/

SELECT employee_id
FROM Employees
WHERE salary < 30000
  AND manager_id IS NOT NULL
  AND manager_id NOT IN (
      SELECT employee_id
      FROM Employees
  )
ORDER BY employee_id;

UNION

SELECT 'High Salary' AS category,
       SUM(IF(income > 50000, 1, 0)) AS accounts_count
FROM Accounts;
