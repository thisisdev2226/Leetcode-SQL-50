-- # LeetCode 1934. Confirmation Rate

-- ## Approach
-- - Use **LEFT JOIN** to include all users from `Signups`.
-- - Convert `'confirmed'` to `1` and all other values to `0` using `IF()`.
-- - Use `AVG()` to calculate the confirmation rate for each user.
-- - Round the result to **2 decimal places**.

-- ## Complexity
-- - **Time:** O(n)
-- - **Space:** O(1)

-- # Query

SELECT s.user_id,
       ROUND(AVG(IF(c.action = 'confirmed', 1, 0)), 2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id;
```
