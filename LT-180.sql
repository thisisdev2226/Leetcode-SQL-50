/*
Problem: 180. Consecutive Numbers
Link: https://leetcode.com/problems/consecutive-numbers/

Approach:
- Use three aliases of the Logs table (l1, l2, l3).
- Check that their IDs are consecutive:
    l1.id = l2.id + 1
    l2.id = l3.id + 1
- Ensure all three rows have the same number.
- GROUP BY l1.num removes duplicate results when a number appears in more than one sequence.

Time Complexity: O(n)
Space Complexity: O(1)

SQL Query:
*/

SELECT l1.num AS ConsecutiveNums
FROM Logs l1, Logs l2, Logs l3
WHERE l1.id - l2.id = 1
  AND l2.id - l3.id = 1
  AND l1.num = l2.num
  AND l2.num = l3.num
GROUP BY l1.num;
