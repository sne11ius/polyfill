#!/bin/zsh

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    echo "You are running Wayland."
    echo "Currently not supported, sorry"
    exit 1
fi

cat <<EOF
DISCLAIMER: This script could potentially enter important passwords into the wrong windows.
Please ensure that you have selected the correct window and trust this script.
Do you want to proceed? Type 'y', 'yes', or 'j' to continue or any other key to abort.
EOF

printf "Enter your choice: "
read -r CONFIRMATION

if ! echo "$CONFIRMATION" | grep -qEi '^(y|yes|j)$'; then
    echo "Aborted by the user."
    exit 1
fi

if ! command -v xdotool >/dev/null 2>&1; then
    printf "Error: 'xdotool' is not installed or not in the PATH.\n"
    exit 1
fi

if ! command -v wmctrl >/dev/null 2>&1; then
    echo "wmctrl is not installed. Please install it first."
    exit 1
fi

if ! command -v fzf >/dev/null 2>&1; then
    echo "fzf is not installed. Please install it first."
    exit 1
fi

if ! command -v bw >/dev/null 2>&1; then
    echo "'bw' is not in the PATH or not installed."
    exit 1
fi

if ! BW_VERSION=$(bw --version 2>/dev/null); then
    echo "'bw' is found but it doesn't appear to be the Bitwarden CLI."
    exit 1
fi

major_version=$(echo "$BW_VERSION" | awk -F. '{print $1}')

if ! echo "$BW_VERSION" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+$'; then
    echo "'bw' version does not match the expected pattern (e.g., 2024.x.x)."
    exit 1
fi

if [ "$major_version" -lt 2024 ]; then
    echo "'bw' is the Bitwarden CLI, but its major version is less than 2024."
    exit 1
fi

WINDOW_INFO=$(wmctrl -l | awk '{id=$1; for (i=4; i<=NF; i++) printf $i " "; print "\t" id}' | fzf --border --header="Select window")

if [ -z "$WINDOW_INFO" ]; then
    echo "No window selected."
    exit 1
fi

WINDOW_ID=$(echo "$WINDOW_INFO" | awk '{print $NF}')

printf "Unlock bitwarden\n"
if ! BW_SESSION=$(bw unlock --raw); then
    printf "\nNo session. Abort.\n"
    exit 1
fi
export BW_SESSION

if ! SELECTED_ENTRY_ID=$(bw list items | jq -r '.[] | "\(.name) \(.id)"' | fzf --border --prompt="Select an entry: " | awk '{print $NF}'); then
    printf "\nNo entry selected. Abort.\n"
    exit 1
fi

PASSWORD=$(bw get password "$SELECTED_ENTRY_ID")
if [ -z "$PASSWORD" ]; then
    echo "Failed to retrieve password."
    exit 1
fi

message="Please hide the console now"

msg_length=${#message}

border=$(printf '%*s' "$msg_length" '' | tr ' ' '-')

printf "+-%s-+\n" "$border"
printf "| %s |\n" "$message"
printf "+-%s-+\n" "$border"

sleep 4

xdotool windowactivate "$WINDOW_ID" 2>/dev/null

xdotool type "$PASSWORD"
xdotool key Return

echo Done
