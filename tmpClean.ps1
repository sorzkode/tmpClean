'''
tmpClean.ps1 v1.1
07/27/2024

PowerShell script that removes temporary files from a given directory and its subfolders.

Author: Mister Riley
GitHub: https://github.com/sorzkode

MIT License
'''

Write-Host "tmpClean script"
Write-Host "This script will remove temporary files from a given directory and its subfolders."
Write-Host "Please follow the instructions below:"

do {
    try {
        # Prompt the user to enter a directory path
        $dir = Read-Host "Enter the directory path"

        # Validate the directory path
        if (-not (Test-Path -Path $dir -PathType Container)) {
            throw "Invalid directory path: $dir"
        }

        # Use the Get-ChildItem cmdlet to get all *.tmp files in the specified directory and its subfolders
        $files = Get-ChildItem -Path $dir -Filter *.tmp -Recurse -File

        # Check if there are files
        if ($files.Count -eq 0) {
            Write-Output "No *.tmp files found in $dir or its subfolders."
        }
        else {
            # Sort the files by creation time in ascending order
            $sortedFiles = $files | Sort-Object -Property CreationTime

            # Print the details of the files
            Write-Output "*.tmp files in ${dir} and its subfolders:"
            foreach ($file in $sortedFiles) {
                Write-Output "Name: $($file.FullName)"
                Write-Output "Size: $($file.Length) bytes"
                Write-Output "Creation Time: $($file.CreationTime)"
                Write-Output "Last Modified Time: $($file.LastWriteTime)"
                Write-Output ""
            }

            # Prompt the user to confirm the removal of files
            $confirm = Read-Host "Do you want to remove all *.tmp files in ${dir} and its subfolders? (Y/N)"

            if ($confirm -eq "Y") {
                # Remove the files
                foreach ($file in $sortedFiles) {
                    Remove-Item -Path $file.FullName -Force
                }
                Write-Output "*.tmp files removed successfully."
            }
            else {
                Write-Output "No files were removed."
            }
        }
    }
    catch {
        Write-Output "An error occurred: $_"
    }

    # Prompt the user to select Y/N to search for files in another directory or exit the script
    $choice = Read-Host "Do you want to search for files in a different directory? (Y/N)"

    if ($choice -eq "Y") {
        continue
    }
    else {
        break
    }
} while ($true)