-- # LeetCode 1757 - Recyclable and Low Fat Products

-- **Problem Link:** https://leetcode.com/problems/recyclable-and-low-fat-products/

-- ## Approach
-- - Select only the `product_id` column.
-- - Filter the rows where:
--   - `low_fats = 'Y'`
--   - `recyclable = 'Y'`
-- - Use the `AND` operator to ensure both conditions are satisfied.

-- **Time Complexity:** O(n)  
-- **Space Complexity:** O(1)
  

-- ## SQL Solution

```sql
SELECT product_id
FROM Products
WHERE low_fats = 'Y'
  AND recyclable = 'Y';
```
