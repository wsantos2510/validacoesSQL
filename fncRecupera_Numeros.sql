USE [CLR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fncRecupera_Numeros] ( @str VARCHAR(500) )
RETURNS VARCHAR(500)
BEGIN  

    DECLARE @startingIndex INT  
    SET @startingIndex = 0  
    
    WHILE (1 = 1)
    BEGIN  
    
        SET @startingIndex = PATINDEX('%[^0-9]%', @str)  
        IF @startingIndex <> 0
            SET @str = REPLACE(@str, SUBSTRING(@str, @startingIndex, 1), '')  
        ELSE
            BREAK
            
    END  
    
    
    RETURN @str  
    
    
END
GO
