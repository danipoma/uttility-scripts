function scd {
    # Check if fzf is installed
    if (-not (Get-Command fzf -ErrorAction SilentlyContinue)) {
        Write-Host "Error: 'fzf' is not installed. Please install it to use this function."
        return 1
    }

    # Get the selected path using fzf
    $selected_path = Get-ChildItem -Path . -Recurse -ErrorAction SilentlyContinue | 
                     Select-Object -ExpandProperty FullName | 
                     fzf --prompt "Select a file/directory to change to its directory: "

    # Check if a value was selected
    if (-not $selected_path) {
        return
    }

    # Check if the selected path is a directory
    if (Test-Path -Path $selected_path -PathType Container) {
        # If the selected path is a directory, change to that directory
        Set-Location -Path $selected_path
    } elseif ($selected_path) {
        # If the selected path is a file, change to its directory
        Set-Location -Path (Split-Path -Path $selected_path)
    }
}

function sfe {
    # Check if fzf is installed
    if (-not (Get-Command fzf -ErrorAction SilentlyContinue)) {
        Write-Host "Error: 'fzf' is not installed. Please install it to use this function."
        return 1
    }

    # Get the selected file using fzf
    $file = Get-ChildItem -Path . -Recurse -File -ErrorAction SilentlyContinue | 
            Select-Object -ExpandProperty FullName | 
            fzf --prompt "Select a file to open in default application: "

    # Check if a value was selected
    if (-not $file) {
        return
    }

    # Open the selected file with the default application
    Start-Process -FilePath $file
}

<#
# Check if Go is installed
if (Get-Command go -ErrorAction SilentlyContinue) {
    
    # Create .golang folder if it doesn't exist yet
    if (-not (Test-Path -Path "$HOME\.golang")) {
        $null = New-Item -ItemType Directory -Path "$HOME\.golang\bin"
    }

    # Set GOBIN variable
    $env:GOBIN = "$HOME\.golang\bin"

    # Append GOBIN to PATH variable for package discovery in shell
    $env:PATH = "$env:GOBIN;$env:PATH"
}
#>