# Hyprland Starter Setup (Arch Linux + AMD CPU + NVIDIA GPU)

Este é um repositório base para configurar o ambiente gráfico Hyprland do zero em um Arch Linux minimalista, ideal para usuários que desejam performance, estética minimalista e controle total sobre seu sistema.

## 🖥️ Requisitos
- Arch Linux instalado (base mínima, sem ambiente gráfico)
- CPU AMD
- GPU NVIDIA (com drivers proprietários)
- Conexão com a internet (via cabo ou Wi-Fi)

---

## 📦 Pacotes necessários

Abaixo estão os pacotes utilizados neste setup com uma breve explicação de cada um.

### Hyprland e complementos
```bash
hyprland-git              # Versão de desenvolvimento do Hyprland (Wayland compositor)
hyprpaper                 # Gerenciador de wallpaper para Hyprland
hyprpicker                # Ferramenta de seleção de cor para Wayland
waybar-hyprland-git       # Barra de status compatível com Hyprland (versão Git)
rofi-lbonn-wayland        # Launcher de aplicações (fork do Rofi com suporte Wayland)
xdg-desktop-portal-hyprland # Portal para integração de apps com o desktop (screensharing, etc)
```

### Ferramentas de desktop
```bash
swaybg            # Utilitário para definir papel de parede (alternativa leve ao feh)
swaylock-effects  # Lock screen com efeitos visuais (blur, etc)
swayidle          # Gerencia tempo de inatividade e bloqueio de tela
dunst             # Sistema de notificações (X11)
mako              # Sistema de notificações para Wayland
rofi-lbonn-wayland # Repetido aqui por também funcionar como launcher
waybar-hyprland-git # Repetido pois é a barra de tarefas e sistema
```

### Áudio, brilho, rede
```bash
pipewire                # Servidor de áudio moderno substituto do PulseAudio
pipewire-pulse          # Compatibilidade com aplicações PulseAudio
wireplumber             # Gerenciador de sessões Pipewire
pamixer                 # Controle de volume via terminal
pavucontrol             # Interface gráfica para controle de áudio
pulseaudio              # Antigo servidor de áudio (recomendado manter para compatibilidade)
pulseaudio-bluetooth    # Suporte a dispositivos Bluetooth com PulseAudio
playerctl               # Controle de players de mídia via CLI
brightnessctl           # Controle de brilho da tela via terminal
```

### Utilitários do sistema
```bash
wl-clipboard        # Ferramenta de copiar/colar para Wayland
cliphist            # Histórico da área de transferência
grim                # Ferramenta de captura de tela para Wayland
slurp               # Permite selecionar regiões na tela (usado com grim)
kitty               # Emulador de terminal moderno e rápido
feh                 # Visualizador de imagens e papel de parede (mais para fallback ou X)
qt6-wayland         # Suporte Wayland para apps Qt6
polkit-kde-agent    # Autenticação gráfica de permissões (uso sudo gráfico)
ffmpegthumbnailer   # Geração de thumbnails para gerenciadores de arquivos
fwupd               # Atualização de firmware (BIOS, periféricos, etc)
```

### Gerenciadores
```bash
ly                     # Login manager leve em TUI
networkmanager         # Gerenciador de rede principal
network-manager-applet # Applet gráfico para bandeja (tray)
blueman                # Interface gráfica para gerenciar Bluetooth
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
