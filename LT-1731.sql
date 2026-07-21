/*
Problem: 1731. The Number of Employees Which Report to Each Employee
Link: https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/

Approach:
1. Self-join the Employees table.
2. Treat the first table (e) as managers and the second table (e2) as employees.
3. Match employees with their managers using:
      e.employee_id = e2.reports_to
4. Count the number of employees reporting to each manager.
5. Calculate the average age of the reporting employees and round it.
6. GROUP BY manager's employee_id and name.
7. Sort the result by employee_id.

Time Complexity: O(n)
Space Complexity: O(1)   // Ignoring the output table

SQL Query:
*/

SELECT
    e.employee_id,
    e.name,
    COUNT(e2.employee_id) AS reports_count,
    ROUND(AVG(e2.age)) AS average_age
FROM Employees e
JOIN Employees e2
ON e.employee_id = e2.reports_to
GROUP BY e.employee_id, e.name
ORDER BY e.employee_id;
