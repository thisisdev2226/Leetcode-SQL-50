/*
# 1484. Group Sold Products By The Date
# Link: https://leetcode.com/problems/group-sold-products-by-the-date/
#
# Approach:
# - Group records by `sell_date`.
# - Count unique products sold on each date using `COUNT(DISTINCT product)`.
# - Use `GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',')`
#   to concatenate unique product names in alphabetical order.
# - Finally, sort the result by `sell_date`.
#
# Time Complexity: O(n log n)
#   - Grouping takes O(n).
#   - Sorting within GROUP_CONCAT contributes to the log factor.
#
# Space Complexity: O(n)
#   - Required for grouping and concatenated result.
*/

SELECT
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;
