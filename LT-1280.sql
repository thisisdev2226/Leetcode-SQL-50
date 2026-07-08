/*
Problem: 1280. Students and Examinations
Link: https://leetcode.com/problems/students-and-examinations/

Approach:
- Use CROSS JOIN to generate every possible (student, subject) combination.
- LEFT JOIN with Examinations on both student_id and subject_name.
- COUNT(e.subject_name) counts only matching exam records.
- GROUP BY student_id, student_name, and subject_name to get the attendance count for each student-subject pair.
- ORDER BY student_id and subject_name as required.

Time Complexity: O(S × Sub + E)
  S = Number of students
  Sub = Number of subjects
  E = Number of examination records

Space Complexity: O(1) (excluding output)
*/

# Write your MySQL query statement below

SELECT
    st.student_id,
    st.student_name,
    s.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students st
CROSS JOIN Subjects s
LEFT JOIN Examinations e
    ON st.student_id = e.student_id
   AND s.subject_name = e.subject_name
GROUP BY
    st.student_id,
    st.student_name,
    s.subject_name
ORDER BY
    st.student_id,
    s.subject_name;
