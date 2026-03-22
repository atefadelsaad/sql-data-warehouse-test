CREATE OR ALTER PROCEDURE bronze.erp_load_product
AS
BEGIN 
      INSERT INTO bronze.erp_product
	  SELECT * FROM AdventureWorks2022.Production.Product
END
EXEC bronze.erp_load_product
  
