```SQL
CREATE VIEW myview AS
	SELECT name, temp_lo, temp_hi, prcp, date, location
		FROM weather, cities
		WHERE city = name;
SELECT * FROM myview;
```

Making liberal use of views is a key aspect of good SQL database design. Views allow you to encapsulate the details of the structure of your tables, which might change as your application evolves, behind consistent interfaces.
Views can be used in almost any place a real table can be used. Building views upon other views is not uncommon.

#postgresql #Database 