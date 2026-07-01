/*
Problem: Find Customer Referee
LeetCode: 584
Link: https://leetcode.com/problems/find-customer-referee/

Approach:
- Select the names of customers whose referee is not customer with ID = 2.
- Customers with NULL referee_id are also included because they do not have any referee.
- Use OR referee_id IS NULL since comparisons with NULL using != return UNKNOWN, not TRUE.

Time Complexity: O(n)
Space Complexity: O(1)
*/

SELECT name
FROM Customer
WHERE referee_id != 2
   OR referee_id IS NULL;
