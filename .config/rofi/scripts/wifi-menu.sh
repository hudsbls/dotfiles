#!/bin/bash

ROFI_THEME="/home/huds/.rofi/files/wifi/wifi.rasi"

# Seleciona a rede Wi-Fi
ssid=$(nmcli -t -f SSID,SECURITY device wifi list | grep -v '^$' | cut -d: -f1 | rofi -dmenu -i -p "Wi-Fi:" -theme "$ROFI_THEME")
[ -z "$ssid" ] && exit

# Verifica se a rede precisa de senha
security=$(nmcli -t -f SSID,SECURITY device wifi list | grep "^$ssid:" | cut -d: -f2)

if [[ "$security" != "--" ]]; then
  while true; do
    # Solicita a senha
    password=$(echo "" | rofi -dmenu -password -p "Senha para $ssid:" -theme "$ROFI_THEME" -mesg "Pressione ESC para cancelar")

    # Se o usuário cancelar (ESC), sai do script
    if [ -z "$password" ]; then
      exit
    fi

    # Tenta conectar
    if nmcli device wifi connect "$ssid" password "$password"; then
      rofi -e "Conectado com sucesso a $ssid"
      break
    else
      rofi -e "Senha inválida. Tente novamente."
    fi
  done
else
  # Rede aberta, conecta direto
  nmcli device wifi connect "$ssid"
  rofi -e "Conectado com sucesso a $ssid"
fi
