
#!/usr/bin/env bash
#
# setup-hyprland-autologin.sh
# Automates passwordless login + Hyprland auto-start on TTY1
# Works for bash and zsh shells
#

set -e

USER_NAME="${USER}"
SHELL_NAME="$(basename "$SHELL")"

echo ">>> Disabling SDDM (Simple Desktop Display Manager)..."
sudo systemctl disable --now sddm.service || echo "SDDM not found or already disabled."

echo ">>> Creating systemd autologin override for tty1..."
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d

sudo tee /etc/systemd/system/getty@tty1.service.d/autologin.conf > /dev/null <<EOF
[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin ${USER_NAME} --noclear %I \$TERM
Type=idle
EOF

echo ">>> Reloading systemd daemon..."
sudo systemctl daemon-reexec
sudo systemctl daemon-reload

PROFILE_FILE=""
if [[ "$SHELL_NAME" == "bash" ]]; then
    PROFILE_FILE="$HOME/.bash_profile"
elif [[ "$SHELL_NAME" == "zsh" ]]; then
    PROFILE_FILE="$HOME/.zprofile"
else
    echo "Unsupported shell: $SHELL_NAME. Defaulting to ~/.bash_profile."
    PROFILE_FILE="$HOME/.bash_profile"
fi

echo ">>> Ensuring Hyprland autostarts in ${PROFILE_FILE}..."

# Only append if it’s not already there
if ! grep -q "exec Hyprland" "$PROFILE_FILE" 2>/dev/null; then
    cat <<'EOF' >> "$PROFILE_FILE"

# Auto-start Hyprland on tty1
if [ "$(tty)" = "/dev/tty1" ]; then
  exec Hyprland
fi
EOF
    echo "Appended Hyprland autostart snippet to $PROFILE_FILE."
else
    echo "Hyprland autostart snippet already exists in $PROFILE_FILE."
fi

echo ">>> Optional: Adding Hyprlock startup (if hyprland.conf exists)..."
HYPERLAND_CONF="$HOME/.config/hypr/hyprland.conf"
if [ -f "$HYPERLAND_CONF" ]; then
    if ! grep -q "exec-once = hyprlock" "$HYPERLAND_CONF"; then
        echo "exec-once = hyprlock" >> "$HYPERLAND_CONF"
        echo "Added 'exec-once = hyprlock' to hyprland.conf"
    else
        echo "Hyprlock already configured."
    fi
else
    echo "Hyprland config not found at $HYPERLAND_CONF (skipping)."
fi

echo ">>> All done!"
echo "Reboot to test your new passwordless Hyprland startup."
