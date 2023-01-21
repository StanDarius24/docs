Once you have created a database, you can access it by:

• Running the `PostgreSQL` interactive terminal program, called `psql`, which allows you to interactively `enter`,` edit`, and `execute` *SQL commands*. 
• Using an existing graphical frontend tool like `pgAdmin` or an office suite with `ODBC` or `JDBC` support to create and manipulate a database. These possibilities are not covered in this tutorial. 
• Writing a custom application, using one of the several available language bindings. These possibilities are discussed further in Part IV.

You probably want to start up psql to try the examples in this tutorial. It can be activated for the mydb database by typing the command:

```shell
$ psql mydb
```

Output:
``` shell
mydb=>
```
or
```shell
mydb=#
```

The last line printed out by` psql` is the prompt, and it indicates that psql is listening to you and that you can type `SQL` queries into a work space maintained by `psql`. Try out these commands:


```SQL
mydb=> SELECT version();
```

```SQL
mydb=> SELECT current_date; 
date
------------ 
2016-01-07 
(1 row)
```

The psql program has a number of internal commands that are not SQL commands. They begin with the backslash character, “\”. For example, you can get help on the syntax of various `PostgreSQL SQL` commands by typing:

```shell
mydb=> \h
```

To get out of psql, type:

```shell
 mydb=> \q
```


#postgresql #Database #relationalParadigm