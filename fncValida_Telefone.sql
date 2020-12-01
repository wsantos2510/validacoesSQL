USE [CLR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fncValida_Telefone] (@Nr_Telefone VARCHAR(15))
RETURNS BIT
AS
BEGIN
	
	DECLARE 
		@Retorno BIT = 1,
		@Nr_Telefone_Valida VARCHAR(15)


	-- Verifica se possui caracteres não numéricos
	SET @Nr_Telefone_Valida = CLR.dbo.fncRecupera_Numeros(@Nr_Telefone)

	IF (@Nr_Telefone != @Nr_Telefone_Valida)
		SET @Retorno = 0
	

	-- Verifica a quantidade de digitos
	SET @Nr_Telefone_Valida = (CASE 
									WHEN LEN(@Nr_Telefone) = 8 THEN @Nr_Telefone
									WHEN LEN(@Nr_Telefone) = 9 THEN @Nr_Telefone
									WHEN LEN(@Nr_Telefone) = 10 THEN RIGHT(@Nr_Telefone,8)
									WHEN LEN(@Nr_Telefone) = 11 THEN RIGHT(@Nr_Telefone,9) 
									ELSE NULL
							   END)
	
	
	-- Verifica se possui apenas números repetidos
	IF(RIGHT(@Nr_Telefone_Valida, 8) IN ('99999999','88888888','77777777','66666666','55555555','44444444','33333333','22222222','11111111','00000000'))
		SET @Retorno = 0 
		
		
	-- Verifica se é string vazia
	IF (@Nr_Telefone_Valida IS NULL)
		SET @Retorno = 0							
	
	
	RETURN @Retorno

	
END
