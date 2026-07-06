/*
Problem: 197. Rising Temperature
Link: https://leetcode.com/problems/rising-temperature/

Approach:
- Perform a self join on the Weather table.
- Join each record with the previous day's record using DATEDIFF().
- Filter rows where the current day's temperature is higher than the previous day's.
- Return the id of the current day's record.

Time Complexity: O(n²) (worst case, depending on database optimization)
Space Complexity: O(1)
*/

SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
AND w1.temperature > w2.temperature;
