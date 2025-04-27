CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME
	BEGIN TRY
		PRINT 'loading tables from source crm'


		SET @start_time =GETDATE();
		TRUNCATE TABLE bronze.crm_cust_info
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH ( 
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		


		TRUNCATE TABLE bronze.crm_cust_info
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH ( 
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.crm_sales_details
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH ( 
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time =GETDATE();
		PRINT 'DURATION TIME: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'



		PRINT '========================================================================'
		PRINT '========================================================================'




		PRINT 'loading tables from source erp'


		SET @start_time =GETDATE();

		TRUNCATE TABLE bronze.erp_CUST_AZ12
		BULK INSERT bronze.erp_CUST_AZ12
		FROM 'C:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH ( 
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		BULK INSERT bronze.erp_LOC_A101
		FROM 'C:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH ( 
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);



		TRUNCATE TABLE bronze.erp_PX_CAT_G1V2
		BULK INSERT bronze.erp_PX_CAT_G1V2
		FROM 'C:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH ( 
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);



		SET @end_time =GETDATE();
		PRINT 'DURATION TIME: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'

	END TRY
	BEGIN CATCH
	END CATCH

END
