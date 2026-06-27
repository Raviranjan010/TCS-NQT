$root = "d:\Temp\TCS-NQT-Complete-Preparation"
$sections = @(
    "01_Quantitative_Ability",
    "02_Reasoning",
    "03_Verbal",
    "04_Coding"
)
foreach ($sec in $sections) {
    Write-Host "`n== $sec ==" -ForegroundColor Cyan
    $topics = Get-ChildItem -Path "$root\$sec" -Directory | Sort-Object Name
    foreach ($t in $topics) {
        $count = (Get-ChildItem -Path $t.FullName -File).Count
        $status = if ($count -eq 18) { "[OK]" } else { "[WARN: $count files]" }
        Write-Host "  $status  $($t.Name)"
    }
}

Write-Host "`n== 00_Getting_Started ==" -ForegroundColor Cyan
$gsFiles = (Get-ChildItem -Path "$root\00_Getting_Started" -File).Name
$gsFiles | ForEach-Object { Write-Host "  [FILE] $_" }

Write-Host "`n== Root files ==" -ForegroundColor Cyan
Get-ChildItem -Path $root -File | Where-Object { $_.Name -ne "build_skeleton.ps1" } |
    ForEach-Object { Write-Host "  [FILE] $($_.Name)" }

Write-Host "`n== assets/ subdirs ==" -ForegroundColor Cyan
Get-ChildItem -Path "$root\assets" -Directory | ForEach-Object { Write-Host "  [DIR] $($_.Name)" }

$totalFiles = (Get-ChildItem -Path $root -Recurse -File | Where-Object { $_.FullName -notmatch "\.git" }).Count
$totalDirs  = (Get-ChildItem -Path $root -Recurse -Directory | Where-Object { $_.FullName -notmatch "\.git" }).Count
Write-Host "`nTOTAL: $totalDirs directories, $totalFiles files (excl. .git + build_skeleton.ps1)" -ForegroundColor Yellow
