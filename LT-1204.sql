/*
# 1204. Last Person to Fit in the Bus
# Link: https://leetcode.com/problems/last-person-to-fit-in-the-bus/
#
# Approach:
# - Perform a self join on the Queue table.
# - For each person (q1), join all people (q2) whose turn is less than or equal
#   to the current person's turn.
# - Calculate the cumulative weight using SUM(q2.weight).
# - Keep only those whose cumulative weight is <= 1000.
# - Since we need the last person who can still board the bus, sort by turn in
#   descending order and return the first record.
#
# Time Complexity: O(n²)
# Space Complexity: O(1)
*/

SELECT q1.person_name
FROM Queue q1
INNER JOIN Queue q2
ON q1.turn >= q2.turn
GROUP BY q1.turn, q1.person_name
HAVING SUM(q2.weight) <= 1000
ORDER BY q1.turn DESC
LIMIT 1;
