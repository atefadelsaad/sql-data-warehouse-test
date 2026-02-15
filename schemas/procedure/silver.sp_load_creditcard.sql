CREATE OR ALTER PROCEDURE silver.load_creditcard
AS 
BEGIN 
    INSERT INTO silver.erp_CreditCard(
		CreditCardID,
		CardType,
		CardNumber, 
		ExpMonth, 
		ExpYear,
		ModifiedDate
)
   SELECT 
		CreditCardID,
		TRIM(CardType) AS CardType,
		CardNumber,
		ExpMonth,
		ExpYear,
		CAST(ModifiedDate AS DATE) AS ModifiedDate
   FROM bronze.erp_creditcard 
END
EXEC silver.load_creditcard
