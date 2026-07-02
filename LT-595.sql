/*
Problem: 595. Big Countries
Link: https://leetcode.com/problems/big-countries/

Approach:
- Select the required columns: name, population, and area.
- A country is considered "big" if:
  - Its area is at least 3,000,000 km², OR
  - Its population is at least 25,000,000.
- Use the WHERE clause with the OR operator to filter countries that satisfy either condition.

Time Complexity: O(n)
Space Complexity: O(1)
*/

SELECT name, population, area
FROM World
WHERE area >= 3000000
   OR population >= 25000000;
