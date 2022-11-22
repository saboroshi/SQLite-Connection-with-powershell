<#
    .Description
     This function helps to download all the files belonging to the .NET framework of the System.Data.SQLite add-on, 
     which can be found at http://system.data.sqlite.org/index.html/doc/trunk/www/downloads.wiki.

    .Parameter Version
     Version of the files to be downloaded, e.g. "1.0.116.0"
    
    .Parameter Path
     The location of the folder where we want to download the files
    
    .Example
     Download-SQLiteDLL -Version "1.0.116.0" -Path "C:\SQLiteDATA"
#>

function Download-SQLiteDLL
{
    param(
        $Version = "",
        $Path = ""
    )
    $Links = ((Invoke-WebRequest -Uri "http://system.data.sqlite.org/index.html/doc/trunk/www/downloads.wiki").Links) | 
    Where-Object {$_.innerHTML -notmatch ".bundle" -and $_.innerHTML -match "binary" -and $_.innerHTML -match ".zip" -and ($_.innerHTML -match "win32" -or $_.innerHTML -match "x64")}
    foreach ($Link in $Links)
    {
        $Filename = $Link.innerHTML
        $Filename
        Invoke-WebRequest -Uri "http://system.data.sqlite.org/blobs/$Version/$Filename" -OutFile "$Path\$Filename"
        "------------------------------------------------------------------"
        Start-Sleep -Milliseconds 100
    }
}

