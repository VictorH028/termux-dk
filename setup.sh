#!/data/data/com.termux/files/usr/bin/bash

set -e

_pkgs=(bc bmon calcurse curl dbus desktop-file-utils exo feh fontconfig-utils fsmon \
        geany git gtk2 gtk3 htop imagemagick jq  man mpc mpd mutt ncmpcpp \
        ncurses-utils netsurf  openbox openssl-tool polybar pulseaudio ranger rofi \
        startup-notification termux-api termux-x11-nightly thunar tigervnc vim wget \
        xarchiver xbitmaps xcompmgr xfce4-settings xfce4-terminal xmlstarlet \
        xorg-font-util xorg-xrandr xorg-xrdb)

echo -e "\e[1;34m[*] Iniciando configuración del entorno...\e[0m\n"


for pkgs in  ${_pkgs[@]}; do
    spin -t "Instalando [ $pkgs ] ...." \
        --color=82 \
        --cmd="apt install -y $pkgs" \
        -q \
        --result \
        -s "Instalando [$pkgs] "
done


# 3. Refrescar caché de fuentes
echo ""
spin -t "Refrescando caché de fuentes..." \
     --style=dots \
     --color=226 \
     --cmd="fc-cache -f" \
     -q \
     --result \
     -s "Caché de fuentes lista"

# 4. Copiar archivos de configuración
echo ""
configs=($(ls -A $(pwd)/files))
for _config in "${configs[@]}"; do
    spin -t "Copiando $_config..." \
         --style=dots \
         --color=208 \
         --cmd="cp -rf $(pwd)/files/$_config $HOME;" \
         -q \
         --result \
         -s "$_config copiado"
done

if [[ ! -d "$HOME/Desktop" ]]; then
        mkdir -p $HOME/Desktop
fi

echo -e "\n\e[1;32m[*] ¡Instalación y configuración completadas exitosamente!\e[0m"

