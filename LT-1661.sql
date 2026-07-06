/*
Problem: 1661. Average Time of Process per Machine
Link: https://leetcode.com/problems/average-time-of-process-per-machine/

Approach:
- Perform a self join on the Activity table.
- Join rows having the same machine_id and process_id.
- Match the 'start' activity with the corresponding 'end' activity.
- Calculate the processing time as (end.timestamp - start.timestamp).
- Compute the average processing time for each machine and round it to 3 decimal places.

Time Complexity: O(n²) (worst case, depending on database optimization)
Space Complexity: O(1)
*/

SELECT
    a1.machine_id,
    ROUND(AVG(a2.timestamp - a1.timestamp), 3) AS processing_time
FROM Activity a1
JOIN Activity a2
    ON a1.machine_id = a2.machine_id
   AND a1.process_id = a2.process_id
   AND a1.activity_type = 'start'
   AND a2.activity_type = 'end'
GROUP BY a1.machine_id;
