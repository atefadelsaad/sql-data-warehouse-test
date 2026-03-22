  
  CREATE OR ALTER PROCEDURE silver.cleanup_b_s
  AS
  BEGIN
        TRUNCATE TABLE bronze.erp_produc;
		TRUNCATE TABLE silver.erp_product;
  END
