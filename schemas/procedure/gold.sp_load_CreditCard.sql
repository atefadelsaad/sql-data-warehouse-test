CREATE OR ALTER PROCEDURE gold.load_CreditCard
AS 
BEGIN 
	 MERGE gold.dim_CreditCard  AS target
	 USING silver.erp_CreditCard AS source
	       ON target.CreditCardID = source.CreditCardID
     WHEN MATCHED 
	       AND target.CardType <> source.CardType 
		   OR  target.CardNumber <> source.CardNumber 
		   OR  target.ExpMonth <> source.ExpMonth 
		   OR  target.ExpYear <> source.ExpYear 
		   OR  target.ModifiedDate <> source.ModifiedDate
	 THEN 
	     UPDATE SET
		    target.CardType = source.CardType ,
		    target.CardNumber = source.CardNumber, 
		    target.ExpMonth = source.ExpMonth ,
		    target.ExpYear = source.ExpYear ,
		    target.ModifiedDate = source.ModifiedDate    
    WHEN NOT MATCHED BY target 
	THEN        
			INSERT (CreditCardID,CardType,CardNumber,ExpMonth,ExpYear,ModifiedDate) 
			VALUES (source.CreditCardID,source.CardType,source.CardNumber,source.ExpMonth,source.ExpYear,source.ModifiedDate)
    WHEN NOT MATCHED BY SOURCE
    THEN
        DELETE
		OUTPUT
               $ACTION AS merge_action,
               inserted.CreditCardID AS CreditCardID ,
			   inserted.CardType AS CardType ,
			   inserted.CardNumber AS CardNumber ,				 
			   inserted.ExpMonth AS ExpMonth ,
			   inserted.ExpYear AS ExpYear ,				 
			   inserted.ModifiedDate AS ModifiedDate ,
               deleted.CreditCardID AS CreditCardID,
			   deleted.CardType AS CardType,
			   deleted.CardNumber AS CardNumber,
			   deleted.ExpMonth AS ExpMonth,
			   deleted.ExpYear AS ExpYear,
			   deleted.ModifiedDate AS ModifiedDate;			   			 
END
EXEC gold.load_CreditCard
