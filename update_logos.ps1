$root = 'c:\healthonehomecare copy'
$oldAssets = @('assets/images/logo-new.webp','assets/images/logo.webp','assets/images/footer-logo.webp')
$newAsset = 'assets/images/logo-health-one-professional.svg'
$count = 0

Get-ChildItem -Path $root -Filter *.html -Recurse | ForEach-Object {
    $path = $_.FullName
    $content = Get-Content -Path $path -Raw
    $updated = $content
    foreach ($old in $oldAssets) {
        $updated = $updated -replace [regex]::Escape('src="' + $old + '"'), 'src="' + $newAsset + '"'
        $updated = $updated -replace [regex]::Escape("src='" + $old + "'"), "src='" + $newAsset + "'"
    }
    if ($updated -ne $content) {
        Set-Content -Path $path -Value $updated -Encoding utf8
        $count++
    }
}

Write-Host "updated_files=$count"
