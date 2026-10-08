Problem - Non-Correlated Subqueries
Write a query to do the following

Find the dishes which cost more than the average cost of all the dishes at the restaurant
You need to output f_name, f_cost, f_type for such dishes
Hint: You need to use a subquery on the table 'food'
Expected output
┌──────────────────┬────────┬──────────┐
│      f_name      │ f_cost │  f_type  │
├──────────────────┼────────┼──────────┤
│ Sushi            │ 20     │ Japanese │
│ Tandoori Chicken │ 15     │ Indian   │
│ Beef Stroganoff  │ 18     │ Russian  │
│ Paella           │ 25     │ Spanish  │
│ Moussaka         │ 16     │ Greek    │
└──────────────────┴────────┴──────────┘
Table Format
Table 'food' has the following columns:

f_id (int)
f_name (text)
f_cost (int)
f_type (int).
Table 'ratings' has the following columns:

f_id (int)
f_rating (text).



-- solution down there 

/*Write a query to find the dishes which cost more than the average cost of all the dishes at the restaurant. The output should have the columns f_name, f_cost, and f_type.*/
select f_name,f_cost,f_type from food
where f_cost >(select AVG(f_cost) from food);