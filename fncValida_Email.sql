USE [CLR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.fncValidarEmail(@Ds_Email varchar(max))
RETURNS BIT
AS BEGIN

	DECLARE @Retorno BIT = 0

	SELECT @Retorno = 1
	WHERE @Ds_Email NOT LIKE '%[^a-z,0-9,@,.]%'
	AND @Ds_Email LIKE '%_@_%_.__%'

	RETURN @Retorno

END