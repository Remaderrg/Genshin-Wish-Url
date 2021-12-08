#Оригинальный скрипт есть на гит хабе. Я вот просто перевел его для ру людей и феечек. https://github.com/vilibs/GenshinWishUrlExtractor

$OutputLogTxtFilePath = ""
$Region = ""
[bool] $OutputLogTxtFileExists = 0

function SelectRegion {
    Clear-Host
    Write-Host
    Write-Host "########  ######## ##     ##    ###    ########  ######## ########  " 
    Write-Host "##     ## ##       ###   ###   ## ##   ##     ## ##       ##     ## " 
    Write-Host "##     ## ##       #### ####  ##   ##  ##     ## ##       ##     ## " 
    Write-Host "########  ######   ## ### ## ##     ## ##     ## ######   ########  " 
    Write-Host "##   ##   ##       ##     ## ######### ##     ## ##       ##   ##   " 
    Write-Host "##    ##  ##       ##     ## ##     ## ##     ## ##       ##    ##  " 
    Write-Host "##     ## ######## ##     ## ##     ## ########  ######## ##     ## " 
    Write-Host ""
    Write-Host "##      ## ####  ######  ##     ##   " 
    Write-Host "##  ##  ##  ##  ##    ## ##     ##   " 
    Write-Host "##  ##  ##  ##  ##       ##     ##   " 
    Write-Host "##  ##  ##  ##   ######  #########   " 
    Write-Host "##  ##  ##  ##        ## ##     ##   " 
    Write-Host "##  ##  ##  ##  ##    ## ##     ##   " 
    Write-Host " ###  ###  ####  ######  ##     ##   " 
    Write-Host ""
    Write-Host "##     ## ########  ##     "  
    Write-Host "##     ## ##     ## ##     "  
    Write-Host "##     ## ##     ## ##     "  
    Write-Host "##     ## ########  ##     "  
    Write-Host "##     ## ##   ##   ##     "
    Write-Host "##     ## ##    ##  ##     "
    Write-Host "#######  ##     ## ########"
    Write-Host
    $Region = Read-Host -Prompt "Just press Enter"
    switch ($Region) {
        Default {
            $Script:Region = "Global"
            $script:OutputLogTxtFilePath = $env:USERPROFILE + "\AppData\LocalLow\miHoYo\Genshin Impact\output_log.txt"
        }
    }
    $script:OutputLogTxtFileExists = Test-Path $OutputLogTxtFilePath
    Clear-Host
}

$host.UI.RawUI.WindowTitle = "Genshin Wish URL RU"

function prompt { '' }

Function MainMenu {
    if (-Not $Region) {
        SelectRegion
    }
    Write-Host
    Write-Host "################################################################"
    Write-Host "###############         ########################################"
    Write-Host "################          ###          #########        ########"
    Write-Host "###################                                       ######"
    Write-Host "#####################                                     ######"
    Write-Host "###################                                      #######"
    Write-Host "##################            ### #########        #############"
    Write-Host "#################           ##            ###      #############"
    Write-Host "################           ##               #         ##########"
    Write-Host "################          ##                ##         #########"
    Write-Host "###############           ##                #          #########"
    Write-Host "###############            ##              ##          #########"
    Write-Host "###############             ##            ##           #########"
    Write-Host "###############               ###      ###             #########"
    Write-Host "################                 #####                ##########"
    Write-Host "###########################                           ##########"
    Write-Host "###############################                      ###########"
    Write-Host "################################                   #############"
    Write-Host "###############################                   ##############"
    Write-Host "#########################                      #################"
    Write-Host "#######################                   ######################"
    Write-Host "#######################        #################################"
    Write-Host "###########  ###########     ###################################"
    Write-Host "###########   ##############################  ##################"
    Write-Host "################################################################"
    Write-Host "########################## #####################################"
    Write-Host "######################        ##################################"
    Write-Host "#####################          #################################"
    Write-Host "######################         #################################"
    Write-Host "########################     ###################################"
    Write-Host "################################################################"
    Write-Host
    Write-Host 
    Write-Host 
    Write-Host " [1] Show Wish URL" -ForegroundColor White
    Write-Host " [q] Quit"
    Write-Host "_____________________________________"
}



function ShowUrl {
    Write-Host
    Write-Host "##      ## ####  ######  ##     ##   ##     ## ########  ##       " 
    Write-Host "##  ##  ##  ##  ##    ## ##     ##   ##     ## ##     ## ##       " 
    Write-Host "##  ##  ##  ##  ##       ##     ##   ##     ## ##     ## ##       " 
    Write-Host "##  ##  ##  ##   ######  #########   ##     ## ########  ##       " 
    Write-Host "##  ##  ##  ##        ## ##     ##   ##     ## ##   ##   ##       " 
    Write-Host "##  ##  ##  ##  ##    ## ##     ##   ##     ## ##    ##  ##       " 
    Write-Host " ###  ###  ####  ######  ##     ##    #######  ##     ## ######## " 
    Write-Host

    if ($OutputLogTxtFileExists) {
        Write-Output "Wish Url:"
        $OutputLogTxt = Get-Content $OutputLogTxtFilePath
        Write-Host
        $WishUrl = $OutputLogTxt -match "^OnGetWebViewPageFinish.*/log" -replace "OnGetWebViewPageFinish:" 
        if ($WishUrl) {
            Write-Output $WishUrl
            Write-Host
            Set-Clipboard $WishUrl
            Write-Host "[Success] " -ForegroundColor Green -NoNewline
            Write-Host "URL was added to clipboard."
            Write-Host
        }
        else {
            Write-Host " Error: " -ForegroundColor Red -NoNewline
            Write-Host "Could not find URL. Try opening wish history in-game first."
        }
        
    }
    else {
        Write-Host " Error: " -ForegroundColor Red -NoNewline
        Write-Host "File output_log.txt does not exists."
    }
    Write-Host
    Write-Host "_____________________________________"
}


do {
    Clear-Host
    MainMenu
    $Selection = Read-Host "Select an option" 
    Clear-Host
    switch ($Selection.ToLower()) {
        1 { ShowUrl }
        'q' { continue }
        default {
            Write-Host
            Write-Host "Error: " -ForegroundColor Red -NoNewline
            Write-Host "Invalid input" -NoNewline
        }
    }
    Write-Host
    Write-Host
    if ($Selection -ne 'q') {
        Read-Host "Press any key to return to main menu"
    }
    else {
        Read-Host "Application is exiting. Press any key"
    }
} until (($Selection -eq 'q'))


