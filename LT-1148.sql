/*
 * 1148. Article Views I
 * https://leetcode.com/problems/article-views-i/
 *
 * Approach:
 * - Filter the records where the author viewed their own article
 *   (`author_id = viewer_id`).
 * - Use DISTINCT to avoid duplicate author IDs in the result.
 * - Rename the output column to `id` as required.
 * - Sort the result in ascending order by `author_id`.
 *
 * Time Complexity: O(n)
 * Space Complexity: O(k)
 */

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id;
