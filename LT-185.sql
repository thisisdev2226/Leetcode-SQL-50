/*
Problem: 185. Department Top Three Salaries
Link: https://leetcode.com/problems/department-top-three-salaries/

Approach:
- Join the Employee and Department tables to get the department name.
- Use DENSE_RANK() partitioned by department and ordered by salary in descending order.
- DENSE_RANK() assigns the same rank to employees with the same salary.
- Select employees whose rank is less than or equal to 3 to return the top three distinct salaries in each department.

Time Complexity: O(n log n)
Space Complexity: O(n)

SQL Query:
*/

SELECT department, employee, salary
FROM (
    SELECT
        d.name AS department,
        e.name AS employee,
        e.salary AS salary,
        DENSE_RANK() OVER (
            PARTITION BY d.name
            ORDER BY e.salary DESC
        ) AS ranks
    FROM Employee e
    LEFT JOIN Department d
        ON d.id = e.departmentId
) AS temp
WHERE ranks <= 3;
