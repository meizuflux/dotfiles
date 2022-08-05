#! /usr/bin/python

import subprocess

def run(command: str) -> str:
    return subprocess.run(command, capture_output=True, shell=True).stdout.decode("utf-8").rstrip("\n")

options = {
    "Shutdown": "shutdown -h now",
    "Restart": "shutdown -r now",
    "Logout": "pkill -KILL -u \"$USER\"",
    "Exit": "swaymsg exit",
    "Lock": "swaylock"
}

option = run("echo '" + "\n".join(options.keys()) + "' | rofi -theme '~/.config/rofi/power.rasi' -dmenu -i -p 'Power Menu'")
if option:
    if run("echo '" + "\n".join(["Yes", "No"]) + "' | rofi -theme '~/.config/rofi/power.rasi' -dmenu -selected-row 1 -i") == "Yes":
        subprocess.run(f"{options[option]}", shell=True)

