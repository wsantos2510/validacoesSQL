USE [CLR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fncVerifica_Cep](@Nr_Cep CHAR(8))
RETURNS BIT
AS 
BEGIN

    DECLARE @chr CHAR, @tamanho INT
    
    -- Verifica se possui 8 caracteres
    IF (LEN(@Nr_Cep) < 8)
        RETURN 0
        
    WHILE (LEN(@Nr_Cep) > 0)
    BEGIN
    
        SELECT @tamanho = LEN(@Nr_Cep), @chr = LEFT(@Nr_Cep,1)
        
        -- Verifica se o número informado possui apenas números
        IF CHARINDEX(@chr,'0123456789') = 0
        BEGIN
            RETURN 0
            BREAK
        END
        
        SET @Nr_Cep = STUFF(@Nr_Cep,1,1,'') -- retira o primeiro dígito
        
    END
    
    RETURN 1
    
END
GO
