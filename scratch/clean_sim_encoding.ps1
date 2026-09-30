$file = 'academy/simulations/index.html'
$content = [System.IO.File]::ReadAllText("$pwd/$file", [System.Text.Encoding]::UTF8)
$clean = $content.Replace("Â·", "·").Replace("Â&middot;", "·")
[System.IO.File]::WriteAllText("$pwd/$file", $clean, [System.Text.Encoding]::UTF8)
Write-Output "Cleaned encoding on simulations page."
