'''
tmpClean.ps1 v1.0
12/25/2023

PowerShell script that removes temporary files from a given directory.

Author: Mister Riley
GitHub: https://github.com/sorzkode

MIT License
'''

Write-Host "Welcome to the tmpClean script!"
Write-Host "This script will remove temporary files from a given directory."
Write-Host "Please follow the instructions below:"

do {
    try {
        # Prompt the user to enter a directory path
        $dir = Read-Host "Enter the directory path"

        # Validate the directory path
        if (-not (Test-Path -Path $dir -PathType Container)) {
            throw "Invalid directory path: $dir"
        }

        # Set the path to search for files
        $path = Join-Path -Path $dir -ChildPath "*.tmp"

        # Use the Get-ChildItem cmdlet to get all *.tmp files in the specified directory
        $files = Get-ChildItem -Path $path -File

        # Check if there are files
        if ($files.Count -eq 0) {
            Write-Output "No *.tmp files found in $dir."
        }
        else {
            # Sort the files by creation time in ascending order
            $sortedFiles = $files | Sort-Object -Property CreationTime

            # Print the details of the files
            Write-Output "*.tmp files in ${dir}:"
            foreach ($file in $sortedFiles) {
                Write-Output "Name: $($file.Name)"
                Write-Output "Size: $($file.Length) bytes"
                Write-Output "Creation Time: $($file.CreationTime)"
                Write-Output "Last Modified Time: $($file.LastWriteTime)"
                Write-Output ""
            }

            # Prompt the user to confirm the removal of files
            $confirm = Read-Host "Do you want to remove all *.tmp files in ${dir}? (Y/N)"

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
