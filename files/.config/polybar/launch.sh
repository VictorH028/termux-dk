#!/data/data/com.termux/files/usr/bin/bash

pkill -x polybar 2>/dev/null
while pgrep -u "$UID" -x polybar >/dev/null; do sleep 0.2; done

MONITOR="$(polybar -m 2>/dev/null | head -n1 | cut -d: -f1)"
export MONITOR

mkdir -p "$HOME/.cache"
nohup polybar main -c "$HOME/.config/polybar/config.ini" \
	>>"$HOME/.cache/polybar.log" 2>&1 &
