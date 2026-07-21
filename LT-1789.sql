/*
Problem: 1789. Primary Department for Each Employee
Link: https://leetcode.com/problems/primary-department-for-each-employee/

Approach:
1. Employees with multiple departments have exactly one department marked
   as primary ('Y'). Select those rows directly.
2. Employees assigned to only one department do not necessarily have
   primary_flag = 'Y'. Find such employees using GROUP BY and HAVING COUNT(*) = 1.
3. Combine both result sets using UNION to avoid duplicates.

Time Complexity: O(n)
Space Complexity: O(n)   // Due to UNION

SQL Query:
*/

SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'

UNION

SELECT employee_id, department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(*) = 1;
