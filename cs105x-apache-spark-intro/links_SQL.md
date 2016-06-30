Here are some resources for the Structured Query Language and Spark SQL:

* <a href="https://en.wikipedia.org/wiki/SQL" target="_blank">Wikipedia SQL page</a>
* <a href="http://sqlzoo.net/" target="_blank">SQL Tutorial 1</a>
* <a href="http://www.w3schools.com/sql/" target="_blank">SQL Tutorial 2</a>
* <a href="http://www.sql-tutorial.net/" target="_blank">SQL Tutorial 3</a>
* <a href="https://www.1keydata.com/sql/sql.html" target="_blank">SQL Tutorial 4</a>
* <a href="http://www.sqlcourse.com/intro.html" target="_blank">Short SQL course</a>
* <a href="http://quickbase.intuit.com/articles/ultimate-web-guide-to-sql-database-language" target="_blank">Web guide to SQL</a>
* <a href="https://en.wikipedia.org/wiki/Join_(SQL)" target="_blank">Wikipedia page on SQL Join clauses</a>
* <a href="https://blog.codinghorror.com/a-visual-explanation-of-sql-joins/" target="_blank">Visual explanation of SQL Joins</a>
* <a href="http://www.w3schools.com/sql/sql_join.asp" target="_blank">SQL Join Tutorial</a>
* <a href="http://spark.apache.org/sql/" target="_blank">Spark SQL &amp; DataFrames</a>
* <a href="http://spark.apache.org/docs/latest/sql-programming-guide.html#spark-sql-dataframes-and-datasets-guide" target="_blank">Spark SQL, DataFrames and Datasets Guide</a>
* <a href="http://spark.apache.org/docs/latest/sql-programming-guide.html#compatibility-with-apache-hive" target="_blank">Spark SQL compatibility with Apache Hive</a>

Note that a key difference between SQL and Spark SQL is that Spark SQL does not support `DELETE`. In SQL, `DELETE` allows you to delete rows from a table. Remember that DataFrames are immutable which means they cannot be changed once you create them. Instead of modifying a DataFrame, you must create a new DataFrame from that DataFrame. You might think that this would make DataFrames very expensive and cause them to take up a lot of memory, but Spark very efficiently handles the implementation of creating new DataFrames from existing ones.