/*
# 1527. Patients With a Condition
# Link: https://leetcode.com/problems/patients-with-a-condition/
#
# Approach:
# - We need to find patients whose `conditions` string contains a condition
#   that starts with "DIAB1".
# - Since conditions are separated by spaces:
#     1. Check if the string starts with "DIAB1".
#     2. Check if " DIAB1" appears anywhere else (preceded by a space).
# - This ensures we match complete condition codes like:
#     "DIAB100", "DIAB101"
#   and avoid matching substrings inside other words.
#
# Time Complexity: O(n)
# Space Complexity: O(1)
*/

SELECT *
FROM Patients
WHERE conditions LIKE 'DIAB1%'
   OR conditions LIKE '% DIAB1%';
