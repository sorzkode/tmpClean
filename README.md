# tmpClean.ps1

## Overview

Welcome to the `tmpClean.ps1` script! This PowerShell script is designed to assist in the removal of temporary files (`*.tmp`) from a specified directory. Use this tool to identify, review, and optionally remove temporary files based on your requirements.

## Instructions

Follow the steps below to run the script:

1. **Download the Script:**
   - Download the script file (`tmpClean.ps1`) to your local machine.

2. **Run the Script:**
   - Open PowerShell on your machine.
   - Navigate to the directory where you saved the script using the `cd` command.
   - Execute the script by entering `.\tmpClean.ps1` and pressing Enter.

3. **Input Directory Path:**
   - The script will prompt you to enter the directory path where you want to remove temporary files.

4. **Review Temporary Files:**
   - The script will display details of the temporary files (`*.tmp`) in the specified directory, including their names, sizes, creation times, and last modified times.

5. **Confirmation Prompt:**
   - You will be prompted to confirm whether you want to remove all identified temporary files. Respond with "Yes" to proceed with the removal or "No" to keep the files.

6. **Repeat or Exit:**
   - After completing the operation, you can choose to search for temporary files in another directory by entering 'Yes' when prompted.
   - To exit the script, enter 'No' when prompted.

## Important Notes

- Ensure that you have the necessary permissions to remove files from the specified directory.
- The script uses the `.tmp` file extension as a filter for temporary files.

## Example Usage

```powershell
Welcome to the tmpClean.ps1 script!
This script will remove temporary files from a given directory.
Please follow the instructions below:

Enter the directory path: C:\Your\Directory\Path
*.tmp files in C:\Your\Directory\Path:
Name: TempFile1.tmp
Size: 1024 bytes
Creation Time: 2022-01-01 08:00:00
Last Modified Time: 2022-01-02 10:30:15

Do you want to remove all *.tmp files in C:\Your\Directory\Path? (Yes/No): Yes
*.tmp files removed successfully.

Do you want to search for files in a different directory? (Yes/No): No