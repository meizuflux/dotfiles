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

option = run("echo '" + "\n".join(options.keys()) + "' | rofi -dmenu")
if option:
    if run("echo '" + "\n".join(["Yes", "No"]) + "' | rofi -dmenu -selected-row 1") == "Yes":
        subprocess.run(f"{options[option]}", shell=True)

