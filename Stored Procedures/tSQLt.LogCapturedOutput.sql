SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE tSQLt.LogCapturedOutput @text NVARCHAR(MAX)
AS
BEGIN
  INSERT INTO tSQLt.CaptureOutputLog (OutputText) VALUES (@text);
END;
GO
