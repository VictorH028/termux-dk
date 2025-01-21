#!/data/data/com.termux/files/usr/bin/bash 

set -e 

## Update, X11-repo, Program Installation
_pkgs=(bc bmon  calcurse curl dbus desktop-file-utils  feh fontconfig-utils fsmon \
		geany git gtk2 gtk3 htop imagemagick jq leafpad man mpc mpd mutt ncmpcpp \
		ncurses-utils netsurf obconf openbox openssl-tool polybar ranger rofi \
		startup-notification termux-api thunar tigervnc vim wget xarchiver xbitmaps xcompmgr \
		xfce4-settings xfce4-terminal xmlstarlet xorg-font-util xorg-xrdb )


# Copy config files
configs=($(ls -A $(pwd)/files))
for _config in "${configs[@]}"; do
    spix  -t "Copiyng $_config..." -p "cp -rf $(pwd)/files/$_config $HOME;"
done
if [[ ! -d "$HOME/Desktop" ]]; then
	mkdir $HOME/Desktop
fi



