SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


--  Comments here are associated with the test.
--  For test case examples, see: http://tsqlt.org/user-guide/tsqlt-tutorial/
CREATE PROCEDURE [SQLCop].[test Decimal Size Problem]
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
  
	
    Select @Output = @Output + Schema_Name(Schema_id) + '.' + name + Char(13) + Char(10)
    From   sys.objects
    WHERE  name Not In('GetFullTypeName','test Decimal Size Problem')
           And (REPLACE(Object_Definition(Object_ID), 'decimal]','decimal') COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE '%decimal[^(]%'
           Or REPLACE(Object_Definition(Object_ID), 'numeric]','numeric') COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE '%[^i][^s]numeric[^(]%')
    --Order By Schema_Name(Schema_id), name  

	If @Output > '' 
		Begin
			Set @Output = 'http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/always-include-precision-and-scale-with' + Char(13) + Char(10) + @Output
			EXEC tSQLt.Fail @Output
		End
  
  
END;

GO
