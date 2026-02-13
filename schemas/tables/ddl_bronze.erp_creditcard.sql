IF OBJECT_ID('bronze.erp_creditcard','U') IS NOT NULL
   DROP TABLE bronze.erp_creditcard
CREATE TABLE bronze.erp_creditcard(
	[CreditCardID] [int]  NOT NULL,
	[CardType] [nvarchar](50) NOT NULL,
	[CardNumber] [nvarchar](25) NOT NULL,
	[ExpMonth] [tinyint] NOT NULL,
	[ExpYear] [smallint] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CreditCard_CreditCardID] PRIMARY KEY CLUSTERED 
( CreditCardID ASC)
)
