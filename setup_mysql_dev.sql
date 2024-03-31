IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'hbnb_dev_db')
BEGIN
    CREATE DATABASE hbnb_dev_db;
END

IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'hbnb_dev')
BEGIN
    CREATE LOGIN hbnb_dev WITH PASSWORD = 'hbnb_dev_pwd';
END

USE hbnb_dev_db;
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'hbnb_dev')
BEGIN
    CREATE USER hbnb_dev FOR LOGIN hbnb_dev;
    ALTER ROLE db_owner ADD MEMBER hbnb_dev;
END
