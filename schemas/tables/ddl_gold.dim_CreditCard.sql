IF OBJECT_ID('gold.dim_CreditCard ','U') IS NOT NULL
    DROP TABLE gold.dim_CreditCard
CREATE TABLE gold.dim_CreditCard(
	CreditCardID int  PRIMARY KEY NOT NULL ,
	CardType nvarchar(50) NOT NULL,
	CardNumber nvarchar(25) NOT NULL,
	ExpMonth tinyint NOT NULL,
	ExpYear smallint NOT NULL,
	ModifiedDate datetime NOT NULL
) 
