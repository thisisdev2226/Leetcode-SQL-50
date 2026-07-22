/*
Problem: 610. Triangle Judgement
Link: https://leetcode.com/problems/triangle-judgement/

Approach:
- A triangle is valid if the sum of any two sides is greater than the third side.
- Check all three triangle inequalities using the IF() function.
- Return 'Yes' if all conditions are true, otherwise return 'No'.

Time Complexity: O(n)
Space Complexity: O(1)
*/

SELECT
    x,
    y,
    z,
    IF(
        x + y > z
        AND y + z > x
        AND z + x > y,
        'Yes',
        'No'
    ) AS triangle
FROM Triangle;
