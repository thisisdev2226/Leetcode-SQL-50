/*
Problem: 1341. Movie Rating
Link: https://leetcode.com/problems/movie-rating/

Approach:
1. First Query:
   - Join Users with MovieRating.
   - Count how many movies each user has rated.
   - Sort by:
       a) Highest number of ratings.
       b) Lexicographically smallest user name (tie-breaker).
   - Return only the top user.

2. Second Query:
   - Join Movies with MovieRating.
   - Filter ratings created in February 2020.
   - Compute the average rating for each movie.
   - Sort by:
       a) Highest average rating.
       b) Lexicographically smallest movie title (tie-breaker).
   - Return only the top movie.

3. Combine both results using UNION ALL.

Time Complexity: O(U + R + M)
    U = Number of users
    R = Number of ratings
    M = Number of movies

Space Complexity: O(U + M)

Query:
*/

(
SELECT
    u.name AS results
FROM Users u
LEFT JOIN MovieRating mr
    ON u.user_id = mr.user_id
GROUP BY u.user_id, u.name
ORDER BY COUNT(mr.user_id) DESC, u.name
LIMIT 1
)

UNION ALL

(
SELECT
    m.title AS results
FROM Movies m
LEFT JOIN MovieRating mr
    ON m.movie_id = mr.movie_id
WHERE EXTRACT(YEAR_MONTH FROM created_at) = 202002
GROUP BY m.movie_id, m.title
ORDER BY AVG(mr.rating) DESC, m.title
LIMIT 1
);
