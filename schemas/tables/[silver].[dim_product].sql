 DROP TABLE IF EXISTS silver.dim_product
CREATE TABLE silver.dim_product(
    [ProductID] [int] PRIMARY KEY NOT NULL,
	[Name]nvarchar(50) NOT NULL,
	[ProductNumber] [nvarchar](25) NOT NULL,
	[Color] [nvarchar](15) NULL,
	[SafetyStockLevel] [smallint] NOT NULL,
	[ReorderPoint] [smallint] NOT NULL,
	[Class] [nchar](5) NULL,
	[rowguid] NVARCHAR(50)  NOT NULL,
	[SellStartDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	M_YEAR INT NOT NULL,
)
