CREATE OR ALTER PROCEDURE silver.load_silver AS
BEGIN
	DECLARE  @start_time datetime, @end_time datetime, @batch_start_time datetime, @batch_end_time datetime;
	BEGIN try
		set @batch_start_time = GETDATE();
		print '======================================================================================';
		print '          ======================= Loading Silver Layer ==================';
		print '======================================================================================';
		print '-';
		print '-';
		print '-';
		print '---------------------------------------------------- LOADING "CRM" TABLES after TRUNCATING TABLES';
		print '-';

		set @start_time = GETDATE();
		print'>> Truncating the table : silver.crm_cust_info';
		print'.';
		print'.';
		truncate table silver.crm_cust_info;
		print '>> Truncating Done..! Data Insert Start....'

		insert into  silver.crm_cust_info (
		cst_id,
		cst_key,
		cst_firstname,
		cst_lastname,
		cst_marital_status,
		cst_gndr,
		cst_create_date)

		select
		cst_id,
		cst_key,
		trim(cst_firstname) as cst_firstname,
		trim(cst_lastname) as cst_lastname,
		case  when upper(trim(cst_marital_status)) = 'S' then 'Single'
			  when upper(trim(cst_marital_status)) = 'M' then 'Married' 
			  else 'N/A'  
		end cst_marital_status,
		case  when upper(trim(cst_gndr)) = 'M' then 'Male'
			  when upper(trim(cst_gndr)) = 'F' then 'Female' 
			  else 'N/A'  
		end cst_gndr,
		cst_create_date
		from
		(select 
		*, ROW_NUMBER() over (partition by cst_id order by cst_create_date desc) as flag_last  
		from bronze.crm_cust_info
		where cst_id is not null) as t
		where flag_last = 1;

		print'.';
		print'.';
		print 'Data Insert Complete....'
		set @end_time = GETDATE();
		print 'Load Duration : ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' Seconds'
		print '|';
		print '|';
		-- ---------------------------------------------------------------------------------------------------------------------
		set @start_time = GETDATE();
		print'>> Truncating the table : silver.crm_prd_info';
		print'.';
		print'.';
		truncate table silver.crm_prd_info;
		print '>> Truncating Done..! Now Data Insert Started'

		insert into silver.crm_prd_info (
			prd_id,
			cat_id,
			prd_key,
			prd_nm,
			prd_cost,
			prd_line,
			prd_start_dt,
			prd_end_dt
		)
		select 
		prd_id,
		REPLACE(SUBSTRING(prd_key,1,5), '-','_') as cat_id, -- To join with "bronze.erp_px_cat_g1v2" Table
		SUBSTRING(prd_key,7, len(prd_key)) as prd_key,  -- To join with "bronze.crm_sales_details" Table
		prd_nm,
		ISNULL(prd_cost, 0) as prd_cost,
		case upper(trim(prd_line))
			 when 'M' then 'Mountain'
			 when 'R' then 'Road'
			 when 'S' then 'Other Sales'
			 when 'T' then 'Touring'
			 else 'N/A'
		end as prd_line,
		cast (prd_start_dt as date) as prd_start_dt ,
		cast (lead(prd_start_dt) over (partition by prd_key order by prd_start_dt)-1 as date) as prd_end_dt
		from bronze.crm_prd_info;

		print'.';
		print'.';
		print 'Data Insert Complete....'
		set @end_time = GETDATE();
		print 'Load Duration : ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' Seconds'
		print '|';
		print '|';
		----------------------------------------------------------------------------------------------------------------------------
		set @start_time = GETDATE();
		print'>> Truncating the table : silver.crm_sales_details';
		print'.';
		print'.';
		truncate table silver.crm_sales_details;
		print '>> Truncating Done..! Now Data Insert Started'
		INSERT INTO silver.crm_sales_details (
		sls_ord_num,
		sls_prd_key,
		sls_cust_id,
		sls_order_dt,
		sls_ship_dt,
		sls_due_dt,
		sls_sales,
		sls_quantity,
		sls_price )

		SELECT 
		sls_ord_num,
		sls_prd_key,
		sls_cust_id,
		case when sls_order_dt = 0 or len(sls_order_dt) != 8 then null
		else cast(cast(sls_order_dt as varchar) as date)
		end as sls_order_dt,
		case when sls_ship_dt = 0 or len(sls_ship_dt) != 8 then null
		else cast(cast(sls_ship_dt as varchar) as date)
		end as sls_ship_dt,
		case when sls_due_dt = 0 or len(sls_due_dt) != 8 then null
		else cast(cast(sls_due_dt as varchar) as date)
		end as sls_due_dt,
		case when sls_sales is null  or sls_sales <= 0 or sls_sales != sls_quantity * abs(sls_price) then sls_quantity * abs(sls_price)
			else sls_sales
		end as sls_sales,
		sls_quantity,
		case when sls_price is null or sls_price <= 0 then sls_sales/ nullif(sls_quantity, 0)
			 else sls_price
		end as sls_price
		FROM bronze.crm_sales_details;

		print'.';
		print'.';
		print 'Data Insert Complete....'
		set @end_time = GETDATE();
		print 'Load Duration : ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' Seconds'
		print '|';
		print '|';
		----------------------------------------------------------------------------------------------------------------------------
		print '---------------------------------------------------- LOADING "ERP" TABLES after TRUNCATING TABLES';
		set @start_time = GETDATE();
		print'>> Truncating the table : silver.erp_cust_az12';
		print'.';
		print'.';
		truncate table silver.erp_cust_az12;
		print '>> Truncating Done..! Now Data Insert Started'
		insert into silver.erp_cust_az12 (cid, bdate, gen)

		select
		case when cid like 'NAS%' then SUBSTRING (cid, 4, len(cid))
		else cid end as cid,

		case when bdate > GETDATE() then null
		else bdate end as bdate,

		case when upper(trim(gen)) in ('MALE', 'M') then 'Male'
			 when upper(trim(gen)) in ('FEMALE','F') then 'Female'
			 else 'N/A' end as gen
     
		from bronze.erp_cust_az12;

		print'.';
		print'.';
		print 'Data Insert Complete....'
		set @end_time = GETDATE();
		print 'Load Duration : ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' Seconds'
		print '|';
		print '|';
		----------------------------------------------------------------------------------------------------------------------------
		set @start_time = GETDATE();
		print'>> Truncating the table : silver.erp_loc_a101';
		print'.';
		print'.';
		truncate table silver.erp_loc_a101;
		print '>> Truncating Done..! Now Data Insert Started'
		insert into silver.erp_loc_a101 (cid, cntry)

		select 
		replace(cid, '-', '') as cid,
		case when trim(cntry) = 'DE' then 'Germany'
			 when trim(cntry) in  ('USA', 'US')  then 'United States'
			 when trim(cntry) = '' or cntry is null then 'N/A'
			 else trim(cntry) end as cntry
		from bronze.erp_loc_a101;
		print'.';
		print'.';
		print 'Data Insert Complete....'
		set @end_time = GETDATE();
		print 'Load Duration : ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' Seconds'
		print '|';
		print '|';
		----------------------------------------------------------------------------------------------------------------------------
		set @start_time = GETDATE();
		print'>> Truncating the table : silver.erp_px_cat_g1v2';
		print'.';
		print'.';
		truncate table silver.erp_px_cat_g1v2;
		print '>> Truncating Done..! Now Data Insert Started'
		insert into silver.erp_px_cat_g1v2 (id,cat,subcat,maintenance)

		select 
		id,
		cat,
		subcat,
		maintenance
		from bronze.erp_px_cat_g1v2;
		print'.';
		print'.';
		print 'Data Insert Complete....'
		set @end_time = GETDATE();
		print 'Load Duration : ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' Seconds'
		print '|';
		print '|';
		----------------------------------------------------------------------------------------------------------------------------
	print '.';
	set @batch_end_time = GETDATE();
		print '======================================================================================';
		print '      ======================= Loading Silver Layer Completed ==================';
	    print '                                              - ';
		print '                                              - ';
		print '===================== Load Duration Of Silver Layer Is: ' + cast(datediff(second, @batch_start_time, @batch_end_time) as nvarchar) + ' Seconds ====================';
		print '======================================================================================';	
	END TRY
	BEGIN CATCH
		print '======================================================================'
		print 'ERROR OCCURED DURING LOADING SILVER LAYER'
		print 'Error Message'+ error_message();
		print 'Error Message'+ cast (error_number() as nvarchar);
		print 'Error Message'+ cast (error_state() as nvarchar);
		print '======================================================================'
	END CATCH

END
