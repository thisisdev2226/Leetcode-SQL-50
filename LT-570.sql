/*
Problem: 570. Managers with at Least 5 Direct Reports
Link: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/

Approach:
- Use a SELF JOIN because both managers and employees are stored in the same Employee table.
- Join the table with itself:
    - e1 represents the manager.
    - e2 represents the employee.
- Match the manager's id with the employee's managerId.
- GROUP BY e2.managerId so all employees reporting to the same manager are grouped together.
- Use HAVING COUNT(e2.managerId) >= 5 to keep only managers with at least 5 direct reports.
- Select the manager's name.

Time Complexity: O(n)

Space Complexity: O(1) (excluding output)
*/

SELECT e1.name
FROM Employee e1
INNER JOIN Employee e2
    ON e1.id = e2.managerId
GROUP BY e2.managerId, e1.name
HAVING COUNT(e2.managerId) >= 5;
