$content = [System.IO.File]::ReadAllText("$pwd/academy/courses/index.html")
$fixed = $content.Replace('\r\n', "`r`n").Replace('\n', "`r`n")
[System.IO.File]::WriteAllText("$pwd/academy/courses/index.html", $fixed, [System.Text.Encoding]::UTF8)

$check = [System.IO.File]::ReadAllText("$pwd/academy/courses/index.html")
Write-Output "Fixed length: $($check.Length)"
Write-Output "Fixed lines: $(($check -split "`n").Count)"
