chcp 65001 > $null
Write-Host -ForegroundColor Cyan "
Build 花至荼蘼 · 同人视觉小说
Starry Sea Flowing Horizontally"
$buildDir = "./build"
Write-Host -ForegroundColor Yellow "
[1/2] 清理构建文件...
Cleaning build files..."
if (Test-Path $buildDir) {
    Remove-Item -Recurse -Force $buildDir
} else {
    Write-Host -ForegroundColor Green "
目录不存在. 跳过清理: $buildDir
Dir not found. Skipping cleanup."
}
Write-Host -ForegroundColor Yellow "
[2/2] 构建中...
Building program..."
New-Item -ItemType Directory -Name "build" -Force
Set-Location build
cmake .. -G Ninja
if ($LASTEXITCODE -ne 0) {
    Write-Host "Build failed with exit code $LASTEXITCODE" -ForegroundColor Red
    Set-Location ..
    exit $LASTEXITCODE
}
cmake --build .
if ($LASTEXITCODE -ne 0) {
    Write-Host "Build failed with exit code $LASTEXITCODE" -ForegroundColor Red
    Set-Location ..
    exit $LASTEXITCODE
}
Set-Location ..
exit 0