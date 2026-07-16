/*
Problem: 2356. Number of Unique Subjects Taught by Each Teacher
Link: https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/

Approach:
- Group the records by teacher_id.
- Use COUNT(DISTINCT subject_id) to count only unique subjects taught by each teacher.
- DISTINCT ensures that if a teacher teaches the same subject in multiple departments,
  it is counted only once.

Time Complexity: O(n)
Space Complexity: O(1) (excluding the output)
*/

SELECT
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;
