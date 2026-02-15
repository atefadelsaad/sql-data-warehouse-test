 IF OBJECT_ID('silver.erp_CreditCard','U') IS NOT NULL
    DROP TABLE silver.erp_CreditCard
CREATE TABLE silver.erp_CreditCard(
	CreditCardID int  PRIMARY KEY NOT NULL ,
	CardType nvarchar(50) NOT NULL,
	CardNumber nvarchar(25) NOT NULL,
	ExpMonth tinyint NOT NULL,
	ExpYear smallint NOT NULL,
	ModifiedDate datetime NOT NULL
) 
