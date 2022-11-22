<#
       .Synopsis
        Connect to SQLite database.
	
       .Description
        The module helps to test connection to SQLite database.
        To use it, you need the file System.Data.SQLite.dll, which contains the .NET objects.
        The necessary files can be downloaded from http://system.data.sqlite.org/index.html/doc/trunk/www/downloads.wiki.
        Make sure you are using the same version as the .NET version that came pre-installed on your computer.
	
       .DLLPath parameter
        The path to the System.Data.SQLite.dll file.
  
        .Parameter DBfile
        The path to the SQLite database file.
	
       .Example
        SQLite-Connection -DLLPath "C:\SQLite\System.Data.SQLite.dll" -DBfile "C:\SQLite\SQLite.db"
#>

function SQLite-TestConnection
{
	param (
		$DLLPath = "",
		$DBfile = "",
	)
	$ErrorActionPreference = 'Stop'
	try
	{
		Add-Type -Path "$DLLPath"
		$Connection = New-Object System.Data.SQLite.SQLiteConnection
		$Connection.ConnectionString = "Data Source=$DBfile"
		$true
	}
	catch
	{
		$false
	}
	finally
	{
		$Connection.Close()
	}
}

# Export-ModuleMember SQLite-TestConnection





