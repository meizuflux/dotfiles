function confirm {
    printf 'swaynag -t red -m "Confirm" -z "Confirm" "%s"' "$1"
}

swaynag -t red -m "Power Options" \
    -z "Lock" "$(confirm 'swaylock')" -z "Exit" "$(confirm 'swaymsg exit')"  -z "Logout" "$(confirm 'pkill -KILL -u \"$USER\"')" -z "Restart" "$(confirm 'shutdown -r now')" -z "Shutdown" "$(confirm 'shutdown -h now')"