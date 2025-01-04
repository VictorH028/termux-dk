#!/data/data/com.termux/files/usr/bin/bash 

set -e 
# Copy config files
configs=($(ls -A $(pwd)/files))
for _config in "${configs[@]}"; do
    spix  -t "Copiyng $_config..." -p "cp -rf $(pwd)/files/$_config $HOME;"
done
if [[ ! -d "$HOME/Desktop" ]]; then
	mkdir $HOME/Desktop
fi



