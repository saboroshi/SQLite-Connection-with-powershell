<#	
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2021 v5.8.196
	 Created on:   	2022. 10. 03. 22:02
	 Created by:   	Cservenyi Szabolcs
	 Organization: 	
	 Filename:     	SQLite-Connection.psm1
	-------------------------------------------------------------------------
	 Module Name: SQLite-Connection
	===========================================================================
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

Export-ModuleMember SQLite-Connection





