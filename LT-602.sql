/*
Problem: 602. Friend Requests II: Who Has the Most Friends
Link: https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/

Approach:
1. Combine all users who appear as requester and accepter using UNION ALL.
2. Count the total occurrences of each user ID.
3. Sort by the count in descending order.
4. Return the user with the highest number of friends.

Time Complexity: O(n log n)
Space Complexity: O(n)
*/

SELECT id, COUNT(id) AS num
FROM (
    SELECT requester_id AS id
    FROM RequestAccepted

    UNION ALL

    SELECT accepter_id
    FROM RequestAccepted
) AS temp
GROUP BY id
ORDER BY num DESC
LIMIT 1;
