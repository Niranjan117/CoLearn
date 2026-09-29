$files = @(
    'index.html',
    'work/index.html',
    'contact/index.html',
    'academy/index.html',
    'academy/courses/index.html',
    'academy/learner/index.html',
    'academy/simulations/index.html',
    'academy/lectures/index.html',
    'insights/index.html'
)

foreach ($f in $files) {
    if (Test-Path $f) {
        $content = [System.IO.File]::ReadAllText("$pwd/$f", [System.Text.Encoding]::UTF8)
        $updated = [regex]::Replace($content, 'colearn-branding\.css\?v=[a-zA-Z0-9_-]+', 'colearn-branding.css?v=20260930k')
        $updated = [regex]::Replace($updated, 'colearn-branding\.js\?v=[a-zA-Z0-9_-]+', 'colearn-branding.js?v=20260930k')
        $updated = [regex]::Replace($updated, 'portal\.css\?v=[a-zA-Z0-9_-]+', 'portal.css?v=20260930k')
        $updated = [regex]::Replace($updated, 'portal\.js\?v=[a-zA-Z0-9_-]+', 'portal.js?v=20260930k')
        $updated = [regex]::Replace($updated, 'simulations\.css\?v=[a-zA-Z0-9_-]+', 'simulations.css?v=20260930k')
        $updated = [regex]::Replace($updated, 'simulations\.js\?v=[a-zA-Z0-9_-]+', 'simulations.js?v=20260930k')
        [System.IO.File]::WriteAllText("$pwd/$f", $updated, [System.Text.Encoding]::UTF8)
        Write-Output "Updated cache bust version on $f"
    }
}
