CREATE OR ALTER PROCEDURE bronze.load_creditcard
AS 
 BEGIN
	INSERT INTO test.bronze.erp_creditcard(
		CreditCardID,
		CardType,
		CardNumber, 
		ExpMonth, 
		ExpYear,
		ModifiedDate 
	   )
     SELECT 
		CreditCardID,
		CardType,
		CardNumber, 
		ExpMonth, 
		ExpYear,
		ModifiedDate 
	 FROM AdventureWorks2022.Sales.CreditCard
 END
 EXEC bronze.load_creditcard
