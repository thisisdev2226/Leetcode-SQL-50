/*
Problem: 1729. Find Followers Count
Link: https://leetcode.com/problems/find-followers-count/
Approach:
- Group the records by user_id.
- Count the number of follower_id values for each user using COUNT(follower_id).
- Return the results ordered by user_id in ascending order.

Time Complexity: O(n)
Space Complexity: O(1) (excluding the output)
*/

SELECT
    user_id,
    COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id ASC;
