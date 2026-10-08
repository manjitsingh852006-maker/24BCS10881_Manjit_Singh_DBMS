Problem - Correlated Subqueries
Let us find out more details about highly rated dishes.

Task
Write a query to do the following. Try and use the concept of sub-queries.

You need to output details of the dish - 'f_name', 'f_cost' and 'f_type' ONLY if the following condition is satisfied
Average rating of the dish is greater than or equal to 4
Expected output
┌─────────────────┬────────┬─────────────┐
│     f_name      │ f_cost │   f_type    │
├─────────────────┼────────┼─────────────┤
│ Pizza           │ 10     │ Continental │
│ Fried Rice      │ 12     │ Chinese     │
│ Pad Thai        │ 14     │ Thai        │
│ Sushi           │ 20     │ Japanese    │
│ Beef Stroganoff │ 18     │ Russian     │
│ Paella          │ 25     │ Spanish     │
└─────────────────┴────────┴─────────────┘
Table Formats
Table 'food' has the following columns:

f_id (int)
f_name (text)
f_cost (int)
f_type (int).
Table 'ratings' has the following columns:

f_id (int)



-- solution is below 


/* Write a query to do the following. Try and use the concept of sub-queries.
- You need to output details of the dish - 'f_name', 'f_cost' and 'f_type' ONLY if the following condition is satisfied
- Average rating of the dish is greater than or equal to 4 */ 
SELECT f_name, f_cost, f_type
FROM food f
WHERE (
    SELECT AVG(r.f_rating)
    FROM ratings r
    WHERE r.f_id = f.f_id
) >= 4;