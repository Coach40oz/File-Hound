<#
  FileHound - The Ghost File Finder
  Find files across drives with customizable search options
#>

function Find-File {
    Clear-Host
    Write-Host @'
                               ('-.                       
                             _(  OO)                      
   ,------.,-.-')  ,--.     (,------.                     
('-| _.---'|  |OO) |  |.-')  |  .---'                     
(OO|(_\    |  |  \ |  | OO ) |  |                         
/  |  '--. |  |(_/ |  |`-' |(|  '--.                      
\_)|  .--',|  |_.'(|  '---.' |  .--'                      
  \|  |_)(_|  |    |      |  |  `---.                     
   `--'    `--'    `------'  `------'                     
 ('-. .-.                               .-') _  _ .-') _  
( OO )  /                              ( OO ) )( (  OO) ) 
,--. ,--. .-'),-----.  ,--. ,--.   ,--./ ,--,'  \     .'_ 
|  | |  |( OO'  .-.  ' |  | |  |   |   \ |  |\  ,`'--..._)
|   .|  |/   |  | |  | |  | | .-') |    \|  | ) |  |  \  '
|       |\_) |  |\|  | |  |_|( OO )|  .     |/  |  |   ' |
|  .-.  |  \ |  | |  | |  | | `-' /|  |\    |   |  |   / :
|  | |  |   `'  '-'  '('  '-'(_.-' |  | \   |   |  '--'  /
`--' `--'     `-----'   `-----'    `--'  `--'   `-------' 
'@ -ForegroundColor Cyan
    
    Write-Host " The Ghost File Finder" -ForegroundColor Yellow
    Write-Host "----------------------------------------------------------" -ForegroundColor DarkGray
    
    # Ask for filename
    Write-Host "Do you know the name of the file?" -ForegroundColor Green
    $fileName = Read-Host "Enter file name (or part of name, use * for wildcards)"
    
    # Ask for extension
    Write-Host "What extension are you looking for?" -ForegroundColor Green
    Write-Host "Examples: .exe, .txt, .log, etc. (leave blank for all)" -ForegroundColor DarkGray
    $extension = Read-Host "Enter extension"
    
    # Format search pattern
    if ([string]::IsNullOrWhiteSpace($extension)) {
        $searchPattern = $fileName
    }
    elseif ($extension.StartsWith(".")) {
        $searchPattern = "$fileName$extension"
    }
    else {
        $searchPattern = "$fileName.$extension"
    }
    
    # Get all drives
    $drives = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Used -ne $null }
    
    # Let user select drives to search
    Write-Host "----------------------------------------------------------" -ForegroundColor DarkGray
    Write-Host "Available drives: $($drives.Name -join ', ')" -ForegroundColor Cyan
    Write-Host "Type 'a' for all drives or select specific drives (e.g., 'c,d' or just 'c')" -ForegroundColor Green
    $driveSelection = Read-Host "Enter drive selection"
    
    $selectedDrives = @()
    if ($driveSelection.ToLower() -eq "a") {
        $selectedDrives = $drives
        Write-Host "Searching all drives: $($drives.Name -join ', ')" -ForegroundColor Cyan
    }
    else {
        $driveLetters = $driveSelection.ToLower().Split(",").Trim()
        foreach ($letter in $driveLetters) {
            $drive = $drives | Where-Object { $_.Name -eq $letter }
            if ($drive) {
                $selectedDrives += $drive
            }
            else {
                Write-Host "Drive $letter not found or not accessible" -ForegroundColor Red
            }
        }
        Write-Host "Searching selected drives: $($selectedDrives.Name -join ', ')" -ForegroundColor Cyan
    }
    
    # Ask if deep search is desired
    Write-Host "----------------------------------------------------------" -ForegroundColor DarkGray
    Write-Host "Would you like to perform a deep search? (This may take longer)" -ForegroundColor Green
    $deepSearch = Read-Host "Deep search? (y/n)"
    $isDeepSearch = $deepSearch.ToLower() -eq "y"
    
    Write-Host "Searching for: $searchPattern" -ForegroundColor Cyan
    Write-Host "----------------------------------------------------------" -ForegroundColor DarkGray
    
    $foundFiles = @()
    $fileCount = 0
    
    # Progress bar variables
    $totalDrives = $selectedDrives.Count
    $currentDrive = 0
    
    # Search selected drives
    foreach ($drive in $selectedDrives) {
        $currentDrive++
        $drivePath = "$($drive.Name):\"
        $percentComplete = ($currentDrive / $totalDrives) * 100
        
        Write-Progress -Activity "Searching drives" -Status "Checking $drivePath" -PercentComplete $percentComplete
        Write-Host "Searching drive $($drive.Name)" -ForegroundColor Magenta
        
        try {
            $searchParams = @{
                Path = $drivePath
                Include = $searchPattern
                ErrorAction = "SilentlyContinue"
            }
            
            if ($isDeepSearch) {
                $searchParams.Add("Recurse", $true)
            }
            
            $files = Get-ChildItem @searchParams
            
            foreach ($file in $files) {
                $fileCount++
                Write-Host "  Found: $($file.FullName)" -ForegroundColor Green
                $foundFiles += [PSCustomObject]@{
                    Location = $file.FullName
                    Size = "$([math]::Round($file.Length / 1KB, 2)) KB"
                    Modified = $file.LastWriteTime
                    Created = $file.CreationTime
                }
            }
        }
        catch {
            Write-Host "  Error accessing $drivePath : $_" -ForegroundColor Red
        }
    }
    
    Write-Progress -Activity "Searching drives" -Completed
    Write-Host "----------------------------------------------------------" -ForegroundColor DarkGray
    
    if ($fileCount -gt 0) {
        Write-Host "Search complete! Found $fileCount file(s)" -ForegroundColor Yellow
        Write-Host ""
        
        # Display results table focusing on location
        $foundFiles | Format-Table -Property Location, Size, Modified -AutoSize
        
        # Option to export results
        $export = Read-Host "Export results to CSV? (y/n)"
        if ($export.ToLower() -eq "y") {
            $exportPath = "$env:USERPROFILE\Desktop\FileHound_Results.csv"
            $foundFiles | Export-Csv -Path $exportPath -NoTypeInformation
            Write-Host "Results exported to: $exportPath" -ForegroundColor Green
        }
        
        # Option to open file location
        if ($fileCount -gt 0 -and $fileCount -le 10) {
            $openLocation = Read-Host "Open file location for a specific result? (Enter number 1-$fileCount or n)"
            if ($openLocation -match '^\d+$' -and [int]$openLocation -ge 1 -and [int]$openLocation -le $fileCount) {
                $selectedFile = $foundFiles[[int]$openLocation - 1]
                $folderPath = Split-Path -Parent $selectedFile.Location
                Start-Process "explorer.exe" -ArgumentList "/select,`"$($selectedFile.Location)`""
                Write-Host "Opening folder containing: $($selectedFile.Location)" -ForegroundColor Green
            }
        }
    }
    else {
        Write-Host "No files matching '$searchPattern' were found!" -ForegroundColor Red
    }
    
    # Ask if user wants to search again
    $searchAgain = Read-Host "Would you like to search again? (y/n)"
    if ($searchAgain.ToLower() -eq "y") {
        Find-File
    }
    else {
        Write-Host @"
   
      Thanks for using FileHound!
       
"@ -ForegroundColor Yellow
    }
}

# Run the function
Find-File
