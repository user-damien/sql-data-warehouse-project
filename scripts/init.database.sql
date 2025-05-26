/* create script purpose and warnings such as running this will drop the database and recreate it*/

USE master;
GO

--This will automatically drop and recreate 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;

--Create the 'DataWarehouse' database 
CREATE DATABASE DataWarehouse;

USE DataWarehouse;

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

/*GO serves as a seperator 
(tells the code to first execute 
CREATE SCHEMA bronze then to move onto 
CREATE SCHEMA silver; etc
