/* header comment what is the purpose */










Use master
GO






--Drop and recreate 'DataWarehouse' 
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN 
	ALTER DATABASE DataWarehouse SET SINGLE USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO


---CREATE THE DATAWAREHOUSE DATABASE
CREATE DATABASE DataWarehouse;
GO
USE DataWarehouse;




----CRETAE SCHEMAS
CREATE SCHEMA bronze;

GO
CREATE SCHEMA silver;


GO 
CREATE SCHEMA gold;
