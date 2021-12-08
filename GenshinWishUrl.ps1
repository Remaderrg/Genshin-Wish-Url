$OutputLogTxtFilePath = $env:USERPROFILE + "\AppData\LocalLow\miHoYo\Genshin Impact\output_log.txt"
$script:OutputLogTxtFileExists = Test-Path $OutputLogTxtFilePath
$OutputLogTxt = Get-Content $OutputLogTxtFilePath
$WishUrl = $OutputLogTxt -match "^OnGetWebViewPageFinish.*/log" -replace "OnGetWebViewPageFinish:" 
Set-Clipboard $WishUrl