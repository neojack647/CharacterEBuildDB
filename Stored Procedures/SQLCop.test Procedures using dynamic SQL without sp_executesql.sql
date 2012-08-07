SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--  Comments here are associated with the test.
--  For test case examples, see: http://tsqlt.org/user-guide/tsqlt-tutorial/
CREATE PROCEDURE [SQLCop].[test Procedures using dynamic SQL without sp_executesql]
AS
BEGIN
  --Assemble
  --  This section is for code that sets up the environment. It often
  --  contains calls to methods such as tSQLt.FakeTable and tSQLt.SpyProcedure
  --  along with INSERTs of relevant data.
  --  For more information, see http://tsqlt.org/user-guide/isolating-dependencies/
  
  --Act
  --  Execute the code under test like a stored procedure, function or view
  --  and capture the results in variables or tables.
  
  --Assert
  --  Compare the expected and actual values, or call tSQLt.Fail in an IF statement.  
  --  Available Asserts: tSQLt.AssertEquals, tSQLt.AssertEqualsString, tSQLt.AssertEqualsTable
  --  For a complete list, see: http://tsqlt.org/user-guide/assertions/

	SET NOCOUNT ON

	Declare @Output VarChar(max)

	Set @Output = ''
  
	SELECT @Output = @Output + SCHEMA_NAME(so.uid) + '.' + so.name + Char(13) + Char(10)
	From   sys.sql_modules sm
		   Inner Join sys.sysobjects so
			 On  sm.object_id = so.id
			 And so.type = 'P'
	Where  Replace(sm.definition, ' ', '') COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI Like '%Exec(%'
		   And Replace(sm.definition, ' ', '') COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI Not Like '%sp_Executesql%'
		   And OBJECTPROPERTY(so.Id, N'IsMSSHIPPED') = 0
		   And so.uid <> SCHEMA_ID('tSQLt')
	Order By SCHEMA_NAME(so.uid) + '.' + so.Name

	If @Output > '' 
		Begin
			Set @Output = 'http://blogs.lessthandot.com/index.php/DataMgmt/DataDesign/avoid-conversions-in-execution-plans-by-' + Char(13) + Char(10) + @Output
			EXEC tSQLt.Fail @Output
		End
 
END;
GO
