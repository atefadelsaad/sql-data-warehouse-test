
CREATE OR ALTER PROCEDURE gold.load_product
AS
BEGIN
      MERGE gold.fac_product AS target
	  USING silver.dim_product AS source
	  ON target.ProductID = source.ProductID
	  WHEN MATCHED AND 
	       target.Name <> source.Name
        OR target.ProductNumber <> source.ProductNumber
		OR target.Color <> source.Color
		OR target.SafetyStockLevel <> source.SafetyStockLevel
		OR target.ReorderPoint <> source.ReorderPoint
		OR target.Class <> source.Class
		OR target.rowguid <> source.rowguid
		OR target.SellStartDate <> source.SellStartDate
		OR target.ModifiedDate <> source.ModifiedDate
		OR target.M_YEAR <> source.M_YEAR
     THEN   UPDATE SET
	 	   target.Name = source.Name,
           target.ProductNumber = source.ProductNumber,
		   target.Color = source.Color,
		   target.SafetyStockLevel = source.SafetyStockLevel,
		   target.ReorderPoint = source.ReorderPoint,
		   target.Class = source.Class,
		   target.rowguid = source.rowguid,
		   target.SellStartDate = source.SellStartDate,
	       target.ModifiedDate = source.ModifiedDate,
		   target.M_YEAR = source.M_YEAR
	WHEN NOT MATCHED BY target
	THEN
	     INSERT(ProductID,Name,ProductNumber,Color,SafetyStockLevel,ReorderPoint,Class,
		        rowguid, SellStartDate,ModifiedDate,M_YEAR,last_update)
         VALUES(source.ProductID,source.Name,source.ProductNumber,source.Color,source.SafetyStockLevel,source.ReorderPoint,source.Class,
		        source.rowguid, source.SellStartDate,source.ModifiedDate,source.M_YEAR,getdate())
    WHEN NOT MATCHED BY source
	THEN DELETE;

END

exec gold.load_product
