-- # LeetCode 1075. Project Employees I

-- ## Approach

-- - Use an **INNER JOIN** to combine the `Project` and `Employee` tables using `employee_id`.
-- - Each project's employees are matched with their corresponding `experience_years`.
-- - Use `AVG(experience_years)` to calculate the average experience for each project.
-- - Use `ROUND(..., 2)` to round the average to two decimal places.
-- - Group the result by `project_id` to get the average experience for each project.

-- ---

-- ## Complexity

-- - **Time Complexity:** `O(n + m)`
--   - `n` = Number of rows in `Project`
--   - `m` = Number of rows in `Employee`

-- - **Space Complexity:** `O(1)`

-- ---

-- ## Query

sql
SELECT
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project p
JOIN Employee e
    ON p.employee_id = e.employee_id
GROUP BY p.project_id;
