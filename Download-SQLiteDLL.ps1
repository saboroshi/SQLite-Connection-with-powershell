#http://system.data.sqlite.org/index.html/doc/trunk/www/downloads.wiki

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

