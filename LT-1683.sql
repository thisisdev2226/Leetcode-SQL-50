/*
 * 1683. Invalid Tweets
 * https://leetcode.com/problems/invalid-tweets/
 *
 * Approach:
 * - Find tweets where the content exceeds 15 characters.
 * - Use the LENGTH() function to calculate the number of characters in `content`.
 * - Return only the `tweet_id` of invalid tweets.
 *
 * Time Complexity: O(n)
 * Space Complexity: O(1)
 */

SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;
