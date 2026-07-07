/*
# 577. Employee Bonus
# Link: https://leetcode.com/problems/employee-bonus/
#
# Approach:
# - Use LEFT JOIN to include all employees, even those without a bonus record.
# - Filter employees whose bonus is NULL (no bonus assigned) or less than 1000.
#
# Time Complexity: O(n)
# Space Complexity: O(1)
*/

SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empId = b.empId
WHERE b.bonus IS NULL
   OR b.bonus < 1000;
