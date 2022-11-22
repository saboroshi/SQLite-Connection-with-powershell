<#
    .Synopsis
     Connect to SQLite database.

    .Description
     The module helps you connect to a SQLite database and run arbitrary queries.
     To use it, you need the file System.Data.SQLite.dll, which contains the .NET objects. 
     The necessary files can be downloaded from http://system.data.sqlite.org/index.html/doc/trunk/www/downloads.wiki. 
     Make sure to use the same version as the .NET version pre-installed on your computer.

    .Parameter DLLPath
     The path to the System.Data.SQLite.dll file.
  
     .Parameter DBfile
     The path to the SQLite database file.

    .Example
     SQLite-Connection -DLLPath "C:\SQLite\System.Data.SQLite.dll" -DBfile "C:\SQLite\SQLite.db" -Query "SELECT * FROM <Table>"
#>

function SQLite-Connection
{
	param (
		$DLLPath = "",
		$DBfile = "",
		$Query = ""
	)
	Add-Type -Path "$DLLPath"
	$Connection = New-Object System.Data.SQLite.SQLiteConnection
	$Connection.ConnectionString = "Data Source=$DBfile"
	$Cmd = $Connection.CreateCommand()
	$Cmd.CommandText = $Query
	$Cmd.Connection = $Connection
	$Adapter = New-Object System.Data.SQLite.SQLiteDataAdapter
	$Adapter.SelectCommand = $Cmd
	$DataSet = New-Object System.Data.DataSet
	$Adapter.Fill($DataSet)
	$DataSet.Tables[0]
	$Connection.Close()
}

# Export-ModuleMember SQLite-Connection





