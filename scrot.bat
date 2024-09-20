@echo off
setlocal

:: Check if the user passed the -s argument
if "%2"=="" (
    echo Please provide a file path with the -s option.
    exit /b 1
)

:: Get the file path from the second argument
set "filePath=%~2"

:: Use Snipping Tool to copy screenshot to clipboard
snippingtool /clip

:: Use PowerShell to save clipboard image to the specified file path
powershell -Command "Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; if ([System.Windows.Forms.Clipboard]::ContainsImage()) { $image = [System.Windows.Forms.Clipboard]::GetImage(); $image.Save('%filePath%',[System.Drawing.Imaging.ImageFormat]::Png); $image.Dispose(); Write-Host 'Clipboard content saved as file' } else { Write-Host 'No image found in the clipboard' }"

echo Screenshot saved to %filePath%
