

#███╗   ██╗██╗██╗  ██╗     ██████╗ ██████╗ ███╗   ██╗███████╗
#████╗  ██║██║╚██╗██╔╝    ██╔════╝██╔═══██╗████╗  ██║██╔════╝
#██╔██╗ ██║██║ ╚███╔╝     ██║     ██║   ██║██╔██╗ ██║█████╗  
#██║╚██╗██║██║ ██╔██╗     ██║     ██║   ██║██║╚██╗██║██╔══╝  
#██║ ╚████║██║██╔╝ ██╗    ╚██████╗╚██████╔╝██║ ╚████║██║     
#╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     
#≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣≣#

{ config, pkgs, ... }:

{
  imports =
    [ 
    	./hardware-configuration.nix
	./users.nix
    ];


  services.gnome.gnome-keyring = {
    enable = true;
  };


  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

services.desktopManager.plasma6.enable = true;

  services.displayManager.sddm.enable = true; # Enable SDDM
programs.nm-applet.enable = true;

   services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  hardware = {
    graphics.enable = true; # Enable OpenGL
    nvidia.modesetting.enable = true;
    nvidia.powerManagement.enable = true;
    nvidia.powerManagement.finegrained = false;
    nvidia.open = false; # FOSS Kernel Module
    nvidia.nvidiaSettings = true; # Nvidia X-Server Settings App
  };
  services.xserver = {
    enable = true;
    videoDrivers = ["nvidia"];
  };


#⌈ Enables Printing & Scanning & Bluetooth

  services.printing.enable = true;
  hardware.sane.enable = true;
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = false; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true; # provides blueman service which also rpovides a applet and manager 

#⌈ Enable sound with pipewire

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  nixpkgs.config.permittedInsecurePackages = [
    "freeimage-unstable-2021-11-01"
    "electron-33.4.11"
  ];

  services.xserver.libinput.enable = true;

  programs.zsh.enable = true;


#⌈ Virt-manager

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["dylan"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

programs.streamdeck-ui = {
    enable = true;
    autoStart = true; # optional
  };


#⌈ Hyprland

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

#⌈ XDG Portal

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };


#⌈ Auto Mount (ish)

  services.devmon.enable = true;
  services.gvfs.enable = true; 
  services.udisks2.enable = true;

#⌈ Enables Polkit
  security.polkit.enable = true;

  programs.steam.enable = true;
  services.flatpak.enable = true; # Enables flatpak
  nixpkgs.config.allowUnfree = true; # allows unfree software
  nixpkgs.config.allowBroken = true;
  environment.systemPackages = with pkgs; [
    rofimoji
    wget
    mate.caja-with-extensions
    discord   
    hyprsunset
    taskwarrior3
    httrack
    tldr
    duf 
    fd
    bat
    kitty
    bluetui
    obs-studio
    brightnessctl
    libnotify
    swaynotificationcenter
    usbutils 
    jmtpfs
    rofi-wayland
    lsd
    zoxide
    git 
    hyprpaper 
    btop
    grimblast
    fastfetch 
    starship 
    fzf 
    waybar
    flatpak
    obsidian
    xfce.xfce4-appfinder
    nemo
    github-desktop
    vscodium
    filezilla
    keepassxc
    pwvucontrol
    photoqt
    xfce.thunar
    kdePackages.dolphin
    gparted
    gnome-disk-utility
    killall
    networkmanagerapplet
    openrgb
    rnote
    bottles
    wl-clipboard
    ripgrep
    ungoogled-chromium
    lunar-client
    hyprpolkitagent
    mediawriter
    lutris
    heroic
    tor-browser
    onionshare-gui
    wireshark
    gimp
    inkscape
    fontfor
    unzip
    zip
    appimage-run
    localsend
    firefox
    hollywood
    exiftool
    hyprpicker
    sherlock
    whois
    grim
    cmatrix
    yazi 
    tui-journal 
    neovim
    swappy
    slurp
    zsh-autosuggestions 
    zsh-completions
    file
    python3
    nwg-displays
    hyprlock
    nwg-look
    dooit
    wlogout
    ntfs3g
    lazygit
    dysk
    librewolf
    simple-scan
    cmake
    meson
    cpio


  #⌈ Themes
    gruvbox-dark-gtk
  ];

  fonts.packages = with pkgs; [
  	noto-fonts
  	noto-fonts-cjk-sans
  	noto-fonts-emoji
  	liberation_ttf
  	fira-code
  	fira-code-symbols
  	mplus-outline-fonts.githubRelease
  	dina-font
  	proggyfonts
	times-newer-roman
  ];

 

  system.stateVersion = "24.11"; 

}

