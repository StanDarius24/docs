A window function performs a calculation across a set of table rows that are somehow related to the current row. This is comparable to the type of calculation that can be done with an aggregate function.However, window functions do not cause rows to become grouped into a single output row like non-window aggregate calls would. Instead, the rows retain their separate identities. Behind the scenes, the window function is able to access more than just the current row of the query result.

Here is an example that shows how to compare each employee's salary with the average salary in his or her department:

```SQL
SELECT depname, empno, salary, avg(salary) OVER (PARTITION BY
	depname) FROM empsalary;
```

```SQL
   depname | empno | salary | avg
-----------+-------+--------+-----------------------
   develop |    11 |   5200 | 5020.0000000000000000
   develop |     7 |   4200 | 5020.0000000000000000
   develop |     9 |   4500 | 5020.0000000000000000
   develop |     8 |   6000 | 5020.0000000000000000
   develop |    10 |   5200 | 5020.0000000000000000
 personnel |     5 |   3500 | 3700.0000000000000000
 personnel |     2 |   3900 | 3700.0000000000000000
     sales |     3 |   4800 | 4866.6666666666666667
     sales |     1 |   5000 | 4866.6666666666666667
     sales |     4 |   4800 | 4866.6666666666666667
(10 rows)
```

The first three output columns come directly from the table `empsalary`, and there is one output row for each row in the table. The fourth column represents an average taken across all the table rows that have the same `depname` value as the current row. (This actually is the same function as the non-window `avg` aggregate, but the `OVER` clause causes it to be treated as a window function and computed across the window frame.)

A window function call always contains an `OVER` clause directly following the window function's name and argument(s). This is what syntactically distinguishes it from a normal function or non-window aggregate. The `OVER` clause determines exactly how the rows of the query are split up for processing by the window function. The `PARTITION BY` clause within `OVER` divides the rows into groups, or partitions, that share the same values of the `PARTITION BY` expression(s). For each row, the window function is computed across the rows that fall into the same partition as the current row.

You can also control the order in which rows are processed by window functions using `ORDER BY` within `OVER`. (The window `ORDER BY` does not even have to match the order in which the rows are output.) Here is an example:

```SQL
SELECT depname, empno, salary,
	rank() OVER (PARTITION BY depname ORDER BY salary DESC)
FROM empsalary;
```

```SQL
   depname | empno | salary | rank
-----------+-------+--------+------
   develop |     8 |   6000 | 1
   develop |    10 |   5200 | 2
   develop |    11 |   5200 | 2
   develop |     9 |   4500 | 4
   develop |     7 |   4200 | 5
 personnel |     2 |   3900 | 1
 personnel |     5 |   3500 | 2
     sales |     1 |   5000 | 1
     sales |     4 |   4800 | 2
     sales |     3 |   4800 | 2
(10 rows)
```

#postgresql 