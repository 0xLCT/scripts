# Display the menu
Write-Output "Please select an option:"
Write-Output "1. Run the CTT Winutil"
Write-Output "2. Change windows version"

# Read the user's choice
$choice = Read-Host "Enter your choice (1 or 2)"

# Execute the appropriate script based on the user's choice
switch ($choice) {
    1 {
        irm "https://christitus.com/win" | iex
        break
    }
    2 {
        irm "https://get.activated.win" | iex
        break
    }
    default {
        Write-Output "Invalid choice. Please enter either 1 or 2."
    }
}
