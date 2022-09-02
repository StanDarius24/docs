The first test to see whether you can access the database server is to try to create a database. A running PostgreSQL server can manage many databases. Typically, a separate database is used for each project or for each user.


To create a new database, in this example named mydb, you use the following command:

```bash
$ createdb mydb
```

You can also create databases with other names. `PostgreSQL` allows you to create any number of databases at a given site. Database names must have an alphabetic first character and are limited to 63 bytes in length. A convenient choice is to create a database with the same name as your current user name. Many tools assume that database name as the default, so it can save you some typing. To create that database, simply type:

```shell
$ createdb
```

If you do not want to use your database anymore you can remove it. For example, if you are the owner (creator) of the database mydb, you can destroy it using the following command:

```shell
$ dropdb mydb
```

(For this command, the database name does not default to the user account name. You always need to specify it.) This action `physically removes` all files associated with the database and cannot be undone, so this should only be done with a great deal of forethought.

More about `createdb` and `dropdb` can be found in `createdb` and `dropdb` respectively.

#postgresql 