CREATE OR ALTER PROCEDURE silver.erp_load_product
AS
BEGIN
INSERT INTO silver.dim_product(
    ProductID,Name,ProductNumber,Color,SafetyStockLevel,ReorderPoint,Class,
	rowguid,SellStartDate,ModifiedDate,M_YEAR
   )

SELECT  
	ProductID ,
	TRIM(Name) AS Name,
	REPLACE(ProductNumber,'-','_') AS ProductNumber,
	CASE
		WHEN Color IS NULL
		THEN 'N/A'
		ELSE Color
	END Color,
	SafetyStockLevel,
	ReorderPoint,
	CASE
		WHEN Class IS NULL
		THEN 'N/A'
		ELSE Class
	END Class,
	REPLACE(rowguid,'-','_') AS rowguid,
	CAST(SellStartDate AS DATE) AS SellStartDate,
	CAST(ModifiedDate AS DATE) AS ModifiedDate,
	DATEDIFF(YEAR,SellStartDate,ModifiedDate) M_YEAR
FROM bronze.erp_product
END
EXEC silver.erp_load_product
