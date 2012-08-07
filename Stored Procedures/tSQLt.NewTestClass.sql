SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE tSQLt.NewTestClass
    @ClassName NVARCHAR(MAX)
AS
BEGIN
  EXEC tSQLt.Private_DisallowOverwritingNonTestSchema @ClassName;

  EXEC tSQLt.DropClass @ClassName = @ClassName;

  DECLARE @QuotedClassName NVARCHAR(MAX);
  SELECT @QuotedClassName = tSQLt.Private_QuoteClassNameForNewTestClass(@ClassName);

  EXEC ('CREATE SCHEMA ' + @QuotedClassName);  
  EXEC tSQLt.Private_MarkSchemaAsTestClass @QuotedClassName;
END;
GO
