-- # LeetCode 1251. Average Selling Price

-- ## Approach

-- - Use a **LEFT JOIN** to combine `Prices` and `UnitsSold` on `product_id`.
-- - Match only those sales where the `purchase_date` lies between the product's `start_date` and `end_date`.
-- - Calculate the **weighted average price** using:
--   - Total Revenue = `SUM(price * units)`
--   - Total Units = `SUM(units)`
-- - Use `ROUND(..., 2)` to round the result to 2 decimal places.
-- - Use `IFNULL(..., 0)` to return `0` for products with no sales.

-- ---

-- ## Complexity

-- - **Time Complexity:** `O(n + m)`
--   - `n` = Number of rows in `Prices`
--   - `m` = Number of rows in `UnitsSold`

-- - **Space Complexity:** `O(1)`

-- ---

-- ## Query

sql
SELECT
    p.product_id,
    IFNULL(ROUND(SUM(p.price * u.units) / SUM(u.units), 2), 0) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
    ON p.product_id = u.product_id
   AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
