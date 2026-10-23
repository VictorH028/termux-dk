#!/data/data/com.termux/files/usr/bin/bash

set -e


_pkgs=(bc bmon calcurse curl dbus desktop-file-utils exo feh fontconfig-utils fsmon \
	geany git gtk2 gtk3 htop imagemagick jq leafpad man mpc mpd mutt ncmpcpp \
	ncurses-utils netsurf obconf openbox openssl-tool polybar pulseaudio ranger rofi \
	startup-notification termux-api termux-x11-nightly thunar tigervnc vim wget \
	xarchiver xbitmaps xcompmgr xfce4-settings xfce4-terminal xmlstarlet \
	xorg-font-util xorg-xrandr xorg-xrdb)

echo "[*] Refreshing font cache..."
fc-cache -f >/dev/null 2>&1 || true

# Copy config files
configs=($(ls -A $(pwd)/files))
for _config in "${configs[@]}"; do
    spin  -t "Copiyng $_config..." --cmd "cp -rf $(pwd)/files/$_config $HOME;"
done
if [[ ! -d "$HOME/Desktop" ]]; then
	mkdir $HOME/Desktop
fi

