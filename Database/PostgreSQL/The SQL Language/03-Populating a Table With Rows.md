The `INSERT` statement is used to populate a table with rows:

```SQL
INSERT INTO weather VALUES ('San Francisco', 46, 50, 0.25, '1994-11-27');
```

Note that all data types use rather obvious input formats. Constants that are not simple numeric values usually must be surrounded by single quotes ('), as in the example. The `date` type is actually quite flexible in what it accepts

The point type requires a coordinate pair[[02-Creating a new table]] as input, as shown here:

```SQL
INSERT INTO cities VALUES ('San Francisco', '(-194.0, 53.0)');
```

The syntax used so far requires you to remember the order of the columns. An alternative syntax allows you to list the columns `explicitly`:

```SQL
INSERT INTO weather (city, temp_lo, temp_hi, prcp, date)
	VALUES ('San Francisco', 43, 57, 0.0, '1994-11-29');
```

Many developers consider explicitly listing the columns better style than relying on the order implicitly.

You could also have used `COPY` to load large amounts of data from flat-text files. This is usually faster because the `COPY` command is optimized for this application while allowing less flexibility than `INSERT`. An example would be:

```SQL
COPY weather FROM '/home/user/weather.txt';
```

where the file name for the source file must be available on the machine running the backend process, not the client, since the backend process reads the file directly. You can read more about the `COPY` command in `COPY`.

#postgresql 