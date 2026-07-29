/*
Problem: 626. Exchange Seats
Link: https://leetcode.com/problems/exchange-seats/

Approach:
1. We need to swap every pair of adjacent students.
2. If the current row has an odd ID:
   - Swap it with the next seat (id + 1).
3. If the current row has an even ID:
   - Swap it with the previous seat (id - 1).
4. Special Case:
   - If the last seat has an odd ID (meaning there is no next seat),
     leave it unchanged.
5. Finally, sort the result by the new seat IDs.

Time Complexity: O(n)
Space Complexity: O(1)

Query:
*/

SELECT
    CASE
        -- If the last seat is odd, leave it unchanged
        WHEN id = (SELECT MAX(id) FROM Seat) AND id % 2 = 1
            THEN id

        -- Odd seat: swap with the next seat
        WHEN id % 2 = 1
            THEN id + 1

        -- Even seat: swap with the previous seat
        ELSE id - 1
    END AS id,
    student
FROM Seat
ORDER BY id;
