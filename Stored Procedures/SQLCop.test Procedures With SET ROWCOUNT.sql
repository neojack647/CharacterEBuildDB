SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--  Comments here are associated with the test.
--  For test case examples, see: http://tsqlt.org/user-guide/tsqlt-tutorial/
CREATE PROCEDURE [SQLCop].[test Procedures With SET ROWCOUNT]
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
  
	SELECT	@Output = @Output + Schema_Name(schema_id) + '.' + name + Char(13) + Char(10)
	From	sys.all_objects
	Where	Type = 'P'
			AND name Not In('sp_helpdiagrams','sp_upgraddiagrams','sp_creatediagram','test Procedures With SET ROWCOUNT')
			And Replace(Object_Definition(Object_id), ' ', '') COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI Like '%SETROWCOUNT%'
			And is_ms_shipped = 0
	ORDER BY Schema_Name(schema_id) + '.' + name

	If @Output > '' 
		Begin
			Set @Output = 'http://sqltips.wordpress.com/2007/08/19/set-rowcount-will-not-be-supported-in-future-version-of-sql-server/' + Char(13) + Char(10) + @Output
			EXEC tSQLt.Fail @Output
		End 
		
END;

GO
