/*
LeetCode 1378. Replace Employee ID With The Unique Identifier
https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/

Approach:
- Use a LEFT JOIN to combine the Employees table with the EmployeeUNI table.
- Match both tables using the employee ID.
- A LEFT JOIN ensures every employee is included, even if they do not have a unique_id.
- Select unique_id from EmployeeUNI and name from Employees.

Time Complexity: O(n)
Space Complexity: O(1)
*/

# Write your MySQL query statement below
SELECT eu.unique_id, e.name
FROM Employees AS e
LEFT JOIN EmployeeUNI AS eu
ON e.id = eu.id;
