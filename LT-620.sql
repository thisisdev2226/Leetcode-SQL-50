-- # LeetCode 620. Not Boring Movies

-- ## Approach

-- We need to return only the movies that satisfy both conditions:

-- 1. The movie ID is **odd**.
-- 2. The description is **not** `"boring"`.

-- After filtering these movies, sort the result by **rating in descending order** so that the highest-rated movies appear first.

-- ---

-- ## Complexity

-- - **Time Complexity:** O(n log n)
--   - Filtering rows: **O(n)**
--   - Sorting by rating: **O(n log n)**

-- - **Space Complexity:** O(1)

-- ---

-- ## Query

sql
SELECT *
FROM Cinema c
WHERE id % 2 != 0
  AND description != 'boring'
ORDER BY rating DESC;
