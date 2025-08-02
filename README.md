# hyprland-dotfiles

# Hyprland Starter Setup (Arch Linux + AMD CPU + NVIDIA GPU)

Este é um repositório base para configurar o ambiente gráfico Hyprland do zero em um Arch Linux minimalista, ideal para usuários que desejam performance, estética minimalista e controle total sobre seu sistema.

## 🖥️ Requisitos
- Arch Linux instalado (base mínima, sem ambiente gráfico)
- CPU AMD
- GPU NVIDIA (com drivers proprietários)
- Conexão com a internet (via cabo ou Wi-Fi)

---

## 📦 Pacotes necessários

### Hyprland e complementos
```bash
hyprland-git
hyprpaper
hyprpicker
waybar-hyprland-git
rofi-lbonn-wayland
xdg-desktop-portal-hyprland
```

### Ferramentas de desktop
```bash
swaybg
swaylock-effects
swayidle
dunst
mako
rofi-lbonn-wayland
waybar-hyprland-git
```

### Áudio, brilho, rede
```bash
pipewire
pipewire-pulse
wireplumber
pamixer
pavucontrol
pulseaudio
pulseaudio-bluetooth
playerctl
brightnessctl
```

### Utilitários do sistema
```bash
wl-clipboard
cliphist
grim
slurp
kitty
feh
qt6-wayland
polkit-kde-agent
ffmpegthumbnailer
fwupd
```

### Gerenciadores
```bash
ly (login manager)
networkmanager
network-manager-applet
blueman
```

---

## ⚙️ Instalação passo a passo

### 1. Atualize seu sistema e instale base-devel + AUR helper
```bash
sudo pacman -Syu
sudo pacman -S base-devel git
# Exemplo com paru
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

### 2. Instale drivers AMD + NVIDIA
```bash
# Para AMD (mesa já cobre)
sudo pacman -S mesa vulkan-radeon libva-mesa-driver libvdpau-va-gl

# Para NVIDIA (driver proprietário)
sudo pacman -S nvidia nvidia-utils nvidia-settings libva libva-nvidia-driver
```

### 3. Instale pacotes essenciais
```bash
paru -S \
  hyprland-git hyprpaper hyprpicker waybar-hyprland-git rofi-lbonn-wayland \
  swaybg swaylock-effects swayidle dunst mako \
  pipewire pipewire-pulse wireplumber pamixer pavucontrol pulseaudio pulseaudio-bluetooth playerctl brightnessctl \
  wl-clipboard cliphist grim slurp kitty feh qt6-wayland polkit-kde-agent ffmpegthumbnailer fwupd \
  ly networkmanager network-manager-applet blueman \
  xdg-desktop-portal-hyprland
```

### 4. Habilite serviços
```bash
sudo systemctl enable ly
sudo systemctl enable NetworkManager
```

---

## 📂 Estrutura deste repositório
```
hyprland-starter-setup/
├── .config/
│   ├── hypr/
│   │   ├── hyprland.conf
│   │   └── autostart.sh
│   ├── waybar/
│   │   ├── config
│   │   └── style.css
│   ├── rofi/
│   │   └── config.rasi
│   └── mako/
│       └── config
├── wallpapers/
│   └── default.jpg
├── scripts/
│   └── start-hypr.sh
├── tools.txt
├── README.md
└── INSTALL.md
```

---

## 🚀 Primeira execução
Após configurar os arquivos em `.config`, execute:
```bash
start-hypr.sh
```
Ou apenas reinicie o sistema para ser direcionado ao `ly`, que carregará o Hyprland automaticamente via configuração do usuário.

---

## ✅ A fazer
- [ ] Criar temas customizados para Waybar e Rofi
- [ ] Adicionar screenshots ao README
- [ ] Incluir um script de instalação automatizada

---

## 🤝 Contribuição
Pull requests são bem-vindos! Este projeto é feito para quem quer dominar o Hyprland do zero e montar setups elegantes e performáticos.
