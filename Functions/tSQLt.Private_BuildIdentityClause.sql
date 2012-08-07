SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
---Build+
CREATE FUNCTION tSQLt.Private_BuildIdentityClause(@TypeId INT, @Precision INT, @TableName NVARCHAR(MAX))
RETURNS TABLE
AS
RETURN SELECT IdentityClause = 
              'IDENTITY(' + 
              (SELECT Name+Suffix FROM tSQLt.Private_GetFullTypeName(@TypeId,0,@Precision,0))+ 
               ',' +
               CAST(IDENT_SEED(@TableName) AS NVARCHAR(MAX)) +
               ',' +
               CAST(IDENT_INCR(@TableName) AS NVARCHAR(MAX)) +
               ')'
          FROM sys.types WHERE user_type_id = @TypeId;
---Build-
GO
