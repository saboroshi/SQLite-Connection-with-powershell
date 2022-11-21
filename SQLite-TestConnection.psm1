<#	
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2021 v5.8.196
	 Created on:   	2022. 10. 03. 22:10
	 Created by:   	Cservenyi Szabolcs
	 Organization: 	
	 Filename:     	SQLite-TestConnection.psm1
	-------------------------------------------------------------------------
	 Module Name: 	SQLite-TestConnection
	===========================================================================
#>

function SQLite-TestConnection
{
	param (
		$DLLPath = "",
		$DBfile = "",
		$Query = ""
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

Export-ModuleMember SQLite-TestConnection





