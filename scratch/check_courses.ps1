$content = [System.IO.File]::ReadAllText("$pwd/academy/courses/index.html")
Write-Output "Length: $($content.Length)"
Write-Output "Lines: $(($content -split "`n").Count)"
Write-Output "First 200 chars: $($content.Substring(0, [Math]::Min(200, $content.Length)))"
