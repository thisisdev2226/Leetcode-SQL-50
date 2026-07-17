/*
Problem: 596. Classes More Than 5 Students
Link: https://leetcode.com/problems/classes-more-than-5-students/

Approach:
- Group all records by `class`.
- Count the number of students in each class.
- Use the HAVING clause to filter only those classes with at least 5 students.

Time Complexity: O(n)
Space Complexity: O(k)
Where:
- n = number of records in the Courses table.
- k = number of distinct classes.
*/

SELECT
    class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
