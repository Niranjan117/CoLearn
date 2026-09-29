$files = @(
    'academy/courses/index.html',
    'academy/simulations/index.html',
    'academy/lectures/index.html',
    'academy/learner/index.html',
    'wp-content/themes/dka/public/colearn-branding.css',
    'wp-content/themes/dka/public/colearn-branding.js'
)

foreach ($f in $files) {
    $content = [System.IO.File]::ReadAllText("$pwd/$f", [System.Text.Encoding]::UTF8)
    $hasArtifacts = $content.Contains("Â")
    Write-Output "File: $f | Length: $($content.Length) | Has Â encoding artifact: $hasArtifacts"
}
