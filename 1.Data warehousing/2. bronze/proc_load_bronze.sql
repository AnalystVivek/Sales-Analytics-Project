CREATE OR ALTER PROCEDURE bronze.load_bronze AS

BEGIN
	DECLARE @start_time datetime, @end_time datetime;
	BEGIN TRY
		set @start_time = GETDATE();
			print '======================================================================================';
			print '          ======================= Loading Bronze Layer ==================';
			print '======================================================================================';
			print '-';
			print '-';
			print '-';
			print '---------------------------------------------------- LOADING "CRM" TABLES after TRUNCATING TABLES';
			print '-';
			set @start_time = GETDATE();
			print '>> Loading Table : bronze.crm_cust_info ';
			-- Bulk Importing data to bronze.crm_cust_info table.

			truncate table bronze.crm_cust_info;

			bulk insert bronze.crm_cust_info
			from 'D:\Project Dataset\DataWarehouse\datasets\source_crm\cust_info.csv'
			with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
			);
			set @end_time = GETDATE();
			print '----- Load Duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' Seconds';
			print '-';
			print '-';
			print '-';
			set @start_time = GETDATE();
			print '>> Loading Table : bronze.crm_prd_info ';

			-- Bulk Importing data to bronze.crm_prd_info table.

			truncate table bronze.crm_prd_info;

			bulk insert bronze.crm_prd_info
			from 'D:\Project Dataset\DataWarehouse\datasets\source_crm\prd_info.csv'
			with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
			);
			set @end_time = GETDATE();
			print '----- Load Duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' Seconds';
			print '-';
			print '-';
			print '-';
			set @start_time = GETDATE();
			print '>> Loading Table : bronze.crm_sales_details ';

			-- Bulk Importing data to bronze.crm_sales_details table.

			truncate table bronze.crm_sales_details;

			bulk insert bronze.crm_sales_details
			from 'D:\Project Dataset\DataWarehouse\datasets\source_crm\sales_details.csv'
			with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
			);
			set @end_time = GETDATE();
			print '----- Load Duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' Seconds';
			print '-';
			print '-';
			print '-';
			print '---------------------------------------------------- LOADING "ERP" TABLES after TRUNCATING TABLES';
			print '-';
			set @start_time = GETDATE();
			print '>> Loading Table : bronze.erp_cust_az12 ';

			-- Bulk Importing data to bronze.erp_cust_az12  table.

			truncate table bronze.erp_cust_az12;

			bulk insert bronze.erp_cust_az12
			from 'D:\Project Dataset\DataWarehouse\datasets\source_erp\CUST_AZ12.csv'
			with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
			);
			set @end_time = GETDATE();
			print '----- Load Duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' Seconds';
			print '-';
			print '-';
			print '-';
			set @start_time = GETDATE();
			print '>> Loading Table : bronze.erp_loc_a101 ';

			-- Bulk Importing data to bronze.erp_loc_a101  table.

			truncate table bronze.erp_loc_a101;

			bulk insert bronze.erp_loc_a101
			from 'D:\Project Dataset\DataWarehouse\datasets\source_erp\LOC_A101.csv'
			with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
			);
			set @end_time = GETDATE();
			print '----- Load Duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' Seconds';
			print '-';
			print '-';
			print '-';
			set @start_time = GETDATE();
			print '>> Loading Table : bronze.erp_px_cat_g1v2 ';

			-- Bulk Importing data to bronze.erp_px_cat_g1v2  table.

			truncate table bronze.erp_px_cat_g1v2;

			bulk insert bronze.erp_px_cat_g1v2
			from 'D:\Project Dataset\DataWarehouse\datasets\source_erp\PX_CAT_G1V2.csv'
			with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
			);
			set @end_time = GETDATE();
			print '----- Load Duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' Seconds';
			print '.';
		set @end_time = GETDATE();
		 print '======================================================================================';
		 print '      ======================= Loading Bronze Layer Completed ==================';
		 print '                                              - ';
		 print '                                              - ';
		 print '===================== Load Duration Of Bronze Layer Is: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' Seconds ====================';
		 print '======================================================================================';	
	END TRY
	BEGIN CATCH
		print '======================================================================'
		print 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		print 'Error Message'+ error_message();
		print 'Error Message'+ cast (error_number() as nvarchar);
		print 'Error Message'+ cast (error_state() as nvarchar);
		print '======================================================================'
	END CATCH

END


exec bronze.load_bronze
