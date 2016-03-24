# Quiz 2: Single-Table SQL
11 questions

1. Structured Query Language (SQL) is used to (check all that apply)

* **Create a table**
* **Insert data**
* **Delete data**
* Check Python code for errors

2. Which of these is the right syntax to make a new database?

* MAKE DATASET people;
* CREATE people;
* MAKE people;
* **CREATE DATABASE people;**

3. Which SQL command is used to insert a new row into a table?

* **INSERT INTO**
* INSERT ROW
* ADD ROW
* INSERT AFTER

4. Which command is used to retrieve all records from a table?

* SELECT all FROM Users
* RETRIEVE all FROM User
* RETRIEVE * FROM Users
* **SELECT * FROM Users**

5. Which keyword will cause the results of the query to be displayed in sorted order?

* GROUP BY
* **ORDER BY**
* WHERE
* None of these

6. In database terminology, another word for table is

* row
* **relation**
* field
* attribute

7. In a typical online production environment, who has direct access to the production database?

* Developer
* **Database Administrator**
* UI/UX Designer
* Project Manager

8. Which of the following is the database software used in this class?

* MySQL
* Oracle
* Postgres
* SQL Server
* **SQLite**

9. What happens if a DELETE command is run on a table without a WHERE clause?

* All the rows without a primary key will be deleted
* The first row of the table will be deleted
* **All the rows in the table are deleted**
* It is a syntax error

10. Which of the following commands would update a column named "name" in a table named "Users"?

* UPDATE Users (name) VALUES ('new name') WHERE ...
* Users.name='new name' WHERE ...
* **UPDATE Users SET name='new name' WHERE ...**
* Users->name = 'new name' WHERE ...

11. What does this SQL command do? Hint: This is not from the lecture
`SELECT COUNT(*) FROM Users`

* **It counts the rows in the table Users**
* It adds a COUNT column to the Users table
* It is a syntax errror
* It only retrieves the rows of Users if there are at least two rows