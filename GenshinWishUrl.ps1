$OutputLogTxtFilePath = $env:USERPROFILE + "\AppData\LocalLow\miHoYo\Genshin Impact\output_log.txt"
if (-Not (Test-Path $OutputLogTxtFilePath)) {
    return Write-Host "not exist"
}
$OutputLogTxt = Get-Content $OutputLogTxtFilePath
$WishUrls = $OutputLogTxt -match "^OnGetWebViewPageFinish.*/log" -replace "OnGetWebViewPageFinish:"
if (-Not $WishUrls) {
    return Write-Host "not found"
}
foreach ($URL in $WishUrls) {
    Write-Host $URL
}
Set-Clipboard $WishUrls[-1]