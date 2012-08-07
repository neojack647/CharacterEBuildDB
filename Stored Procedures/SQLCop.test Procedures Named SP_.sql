SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



--  Comments here are associated with the test.
--  For test case examples, see: http://tsqlt.org/user-guide/tsqlt-tutorial/
CREATE PROCEDURE [SQLCop].[test Procedures Named SP_]
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
  
	SELECT	@Output = @Output + SPECIFIC_SCHEMA + '.' + SPECIFIC_NAME + Char(13) + Char(10)
	From	INFORMATION_SCHEMA.ROUTINES
	Where	SPECIFIC_NAME COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE 'sp[_]%'
			And SPECIFIC_NAME COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI NOT LIKE '%diagram%'
	Order By SPECIFIC_SCHEMA,SPECIFIC_NAME

	If @Output > '' 
		Begin
			Set @Output = 'http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/MSSQLServer/don-t-start-your-procedures-with-sp_' + Char(13) + Char(10) + @Output
			EXEC tSQLt.Fail @Output
		End  
END;

GO
