param()
Add-Type -AssemblyName System.Drawing

function Recompress-Jpeg([string]$InPath, [int]$Quality = 82) {
    if (-not (Test-Path -LiteralPath $InPath)) {
        Write-Host "SKIP: $InPath (not found)"
        return
    }
    $img = [System.Drawing.Image]::FromFile($InPath)
    try {
        $codec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq 'image/jpeg' }
        $ep = New-Object System.Drawing.Imaging.EncoderParameters(1)
        $ep.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, $Quality)
        $tmp = "$InPath.tmp"
        $img.Save($tmp, $codec, $ep)
        $img.Dispose()
        Remove-Item -LiteralPath $InPath -Force
        Rename-Item -LiteralPath $tmp -NewName ([System.IO.Path]::GetFileName($InPath)) -Force
        Write-Host "OK  : $InPath"
    } catch {
        $img.Dispose()
        throw
    }
}

$base = Split-Path -Parent $PSScriptRoot
$base = Join-Path $base ''

$targets = @(
    Join-Path $base 'assets/images/hero/hero-desktop-2.jpg'),
    (Join-Path $base 'assets/images/hero/hero-mobile.jpg'),
    (Join-Path $base 'assets/images/gallery/tea-2776217_1280.jpg'),
    (Join-Path $base 'assets/images/gallery/exterior-1.JPG'),
    (Join-Path $base 'assets/images/gallery/Interior.JPG')

foreach ($t in $targets) { Recompress-Jpeg -InPath $t -Quality 82 }
