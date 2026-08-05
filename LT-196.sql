/*
Problem: 196. Delete Duplicate Emails
Link: https://leetcode.com/problems/delete-duplicate-emails/

Approach:
- Perform a self join on the Person table using the email column.
- Rows having the same email are considered duplicates.
- Delete the row with the larger ID (`p1.id > p2.id`) so that only the smallest ID for each email remains.

Time Complexity: O(n²)
Space Complexity: O(1)
*/

DELETE p1
FROM Person p1
INNER JOIN Person p2
    ON p1.email = p2.email
   AND p1.id > p2.id;

