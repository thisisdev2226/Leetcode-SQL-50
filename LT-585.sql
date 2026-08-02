/*
Problem: 585. Investments in 2016
Link: https://leetcode.com/problems/investments-in-2016/

Approach:
1. Find all policies whose `tiv_2015` value appears more than once.
2. Keep only policies whose `(lat, lon)` location is unique.
3. Sum the corresponding `tiv_2016` values.
4. Round the final result to 2 decimal places.

Time Complexity: O(n log n)
Space Complexity: O(n)
*/

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);
