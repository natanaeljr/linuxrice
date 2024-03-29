# Linux Rice

This is my current Linux Rice: dotfiles, configs, scripts, fonts, docs and more.

## PRIME:

### Install ArchLinux CLI (no graphic environment)

After installed, on first boot:

- Enable DHCP for internet: `sudo systemctl start dhcpcd.service`
- Install NetworkManager: `sudo pacman -S networkmanager; sudo systemctl start NetworkManager; sudo systemctl enable NetworkManager`
- Download dotfiles/configs: `git clone https://github.com/natanaeljr/linuxrice`
- Install Xorg: `sudo pacman -S --needed xorg xorg-xinit`
- Install video driver with mhwd
- Install window manager: `git clone https://github.com/natanaeljr/dwm; sudo make install`
- Install status bar: `git clone https://github.com/natanaeljr/dwmblocks; sudo make install`

- Install pre-requisite packages:
  ```
  sudo pacman -S --needed alacritty gvim yay ranger rofi dmenu picom sxhkd gnome-keyring xdg-utils wmname unzip xclip
  yay -S --needed google-chrome
  ```

- Install additional packages:
  ```
  sudo pacman -S --needed xfce4-power-manager xfce4-screensaver xfce4-notifyd notification-daemon feh \
   mesa-demos manjaro-settings-manager pamac tree network-manager-applet htop bpytop yad \
   nemo gnome-calculator dbus-python xcursor-breeze xsetroot hsetroot tmux xsel unclutter bat
  yay -S --needed lf redshift-qt kdocker deadd-notification-center-bin tmux-bash-completion-git
  pip install notify-send.py
  ```

- Install font packages:
  ```
  sudo pacman -S --needed noto-fonts ttf-jetbrains-mono nerd-fonts-noto-sans-mono ttf-fira-code
  yay -S --needed ttf-google-sans
  ```

- Automatic start of the X server on tty1: add the following to ~/.zprofile: (# already setup in the dotfiles)
  ```
  if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
  fi
  ```

- Automatic login to virtual console: https://wiki.archlinux.org/index.php/getty
  `sudo systemctl edit getty@tty1`
  Add the following:
  ```
  [Service]
  ExecStart=
  ExecStart=-/usr/bin/agetty --autologin <username> --noclear %I $TERM
  Type=simple
  ```

- Change GRUB Timeout: `sudo vim /etc/default/grub; edit GRUB_TIMEOUT=1; sudo update-grub`

- Install audio packages:
  Pulseaudio:
    `sudo pacman -S --needed pulseaudio pulseaudio-alsa`
    And start/enable with: `systemctl --user enable pulseaudio`
  Pipewire:
    `sudo pacman -S --needed manjaro-pipewire`
    And start/enable with: `systemctl --user enable pipewire`
  Additional packages:
    `sudo pacman -S --needed pavucontrol pasystray playerctl`

- Install bluetooth packages:
  `sudo pacman -S --needed bluez bluez-utils blueman`
  And start/enable with: `systemctl enable bluetooth.service`
  If using pulseaudio install:
    `sudo pacman -S --needed pulseaudio-bluetooth`
  If using pipewire, no additional package is needed.
  Enable battery level reporting with pipewire:
  ```
    sudo systemctl edit bluetooth.service
    [Service]
    ExecStart=
    ExecStart=/usr/lib/bluetooth/bluetoothd --experimental
  ```
  See battery level with `upower --dump`.

- Install more customization packages:
  ```
  sudo pacman -S --needed oh-my-zsh zsh-theme-powerlevel10k zsh-autosuggestions fzf
  yay -S --needed zsh-fast-syntax-highlighting zsh-vi-mode
  sudo git clone https://github.com/urbainvaes/fzf-marks.git /opt/fzf-marks
  ```

- Update tuxedo-control-center due to max cpu [issue](https://github.com/tuxedocomputers/tuxedo-control-center/issues/109)
  `yay -S --needed aur/tuxedo-control-center-bin`

#### For Development

- Install DEV packages:
  ```
  sudo pacman -S --needed gcc gdb clang rustup ccls neovim python-neovim npm nodejs
  yay -S --needed visual-studio-code-bin clion
  ```

- For clion we need to download JDK 11 (new versions did not work because of Java AWT support)
  ```
  sudo pacman -S --needed jdk11-openjdk
  sudo archlinux-java set java-11-openjdk
  ```

- For rust we need to setup toolchain: (and download std lib for clion)
  ```
  rustup toolchain install stable 
  rustup component add rust-src
  ```

#### For Logitech MX Keys keyboard
  `sudo pacman -S --needed solaar`

#### For using VPNs (openvpn) 
  - Add openvpn config (TODO document/record)
  - resolve the VPN DNS correctly run: $ sudo systemctl enable systemd-resolve 
  - add certificate: https://wiki.archlinux.org/index.php/User:Grawity/Adding_a_trusted_CA_certificate

#### External monitor backlight control
  ref: https://wiki.archlinux.org/title/backlight section "External monitors"
  - `sudo pacman -S ddcutil`
  - `yay -S ddcci-driver-linux-dkms`
  Enable kernel i2c module
  - `sudo modprobe i2c-dev`   #(load once)
  Auto load kernel module on bootup:
  - `sudo echo 'i2c-dev' >> /etc/modules-load.d/backlight.conf`
  For enabling non-superuser access to the relevant I2C device
  - `groupadd i2c`
  - `usermod -aG i2c $USER`
  - `echo 'KERNEL=="i2c-[0-9]*", GROUP="i2c"' >> /etc/udev/rules.d/10-local_i2c_group.rules`
  Control:
  - `ddcutil setvcp 10 + 5 && ddcutil getvcp 10`
  
#### Aditional software list:
  * spotifyd (enable user service)
  * spotify-tui (spotify in terminal)
  * playerctl (for spotify cli control)

## TODO:
- add a default wallpaper to this repo, for auto setup on new installations
- map all tools used in the linux-rice configs, list them on README
- status bar weather info
- dwm fix child window selection
- dwm allow to apply gaps to all layout types
