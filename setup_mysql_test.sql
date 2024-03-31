-- prepares a MSSQL server for the project

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'hbnb_test_db')
BEGIN
    CREATE DATABASE hbnb_test_db;
END

IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'hbnb_test')
BEGIN
    CREATE LOGIN hbnb_test WITH PASSWORD = 'hbnb_test_pwd';
END

USE hbnb_test_db;
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'hbnb_test')
BEGIN
    CREATE USER hbnb_test FOR LOGIN hbnb_test;
    ALTER ROLE db_owner ADD MEMBER hbnb_test;
END
