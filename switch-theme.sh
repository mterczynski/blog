#!/bin/bash

# Script to easily switch between Hugo themes

THEMES_DIR="themes"
CONFIG_FILE="hugo.yaml"

# Check available themes
echo "Available themes:"
themes=($(ls -d $THEMES_DIR/*/ 2>/dev/null | xargs -n 1 basename))

if [ ${#themes[@]} -eq 0 ]; then
    echo "No themes found in $THEMES_DIR/"
    exit 1
fi

for i in "${!themes[@]}"; do
    echo "  $((i+1)). ${themes[$i]}"
done

# Get current theme
current_theme=$(grep "^theme:" $CONFIG_FILE | sed 's/theme: //' | tr -d ' ')
echo ""
echo "Current theme: $current_theme"
echo ""

# Prompt for theme selection
read -p "Enter theme number or name (or press Enter to cancel): " selection

if [ -z "$selection" ]; then
    echo "Cancelled."
    exit 0
fi

# Determine selected theme
if [[ "$selection" =~ ^[0-9]+$ ]]; then
    # Numeric selection
    idx=$((selection - 1))
    if [ $idx -ge 0 ] && [ $idx -lt ${#themes[@]} ]; then
        new_theme="${themes[$idx]}"
    else
        echo "Invalid selection."
        exit 1
    fi
else
    # Theme name provided
    new_theme="$selection"
fi

# Verify theme exists
if [ ! -d "$THEMES_DIR/$new_theme" ]; then
    echo "Theme '$new_theme' not found in $THEMES_DIR/"
    exit 1
fi

# Update config file
sed -i "s/^theme:.*/theme: $new_theme/" $CONFIG_FILE

echo ""
echo "✓ Theme switched to: $new_theme"
echo ""
echo "Run 'hugo server' to preview the new theme."
