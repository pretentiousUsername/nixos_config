
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

# Eventually I'll be using imports to make this a bit nicer to work with.

{ config, pkgs, inputs, pkgs-unstable, pkgs-sc-update, specialArgs, options, modulesPath, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      # ./hardware/framework-13-2025.nix
      # ./hardware-configuration.nix
      ./experimental.nix
      ./fonts.nix
      inputs.musnix.nixosModules.musnix
      ./services/sops.nix
      ./services/sound.nix
      ./packages/ld/ld.nix
    ];

  musnix.enable = true;  # this should make audio work nicely

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
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

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  # services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable/configure Synthing
  # services.syncthing = {
  #   enable = true;
  #   openDefaultPorts = true;
  # };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pines = {
    isNormalUser = true;
    description = "pines";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = (with pkgs; [
        nixpkgs-fmt
        nixpkgs-lint
        nixpkgs-review
        alacritty-graphics
        pandoc
        zotero
        haskellPackages.pandoc-crossref
        texliveFull
        typst
        inter
        stix-two
        julia-mono
        corefonts
        vista-fonts
        anytype
        # logseq  # it uses an insecure electron version?
        zathura
        xfce.thunar
        lazygit
        hyfetch  # yep
        audacity
        audacious
        discord
        lxappearance
        libreoffice
        cheese
        cmus
        mpv
        # (callPackage ./packages/supercollider/wrapper.nix { }) # <-- supercollider-with-plugins
        # (callPackage ./packages/supercollider/default.nix {}) # supercollider
        # (callPackage ./packages/supercollider/sc3-plugins.nix {})
        # supercollider-with-plugins
        # qt6.qtbase
        # qt6.qttools
        # qt6.qtwebsockets
        # supercollider
        # supercolliderPlugins.sc3-plugins
        vimPlugins.nvim-treesitter
        lua
        luajit
        luarocks  # necessary for my neovim config
        # thunderbird
        # python
        # julia
        # pywal16
        # wallust
        imagemagick
        ghostscript
        poppler-utils
        flameshot
        hugo
        fzf
        gcc

        # CAD stuff
        kicad
        freecad
        elmerfem

        gimp
        inkscape
        decker
        deja-dup
        ungoogled-chromium
    ]) ++
        (with pkgs-unstable; [
            themix-gui
        ]) ++
        (with pkgs-sc-update; [
            supercollider-with-plugins

        ])
    ; # be sure to include another `++ (with <thing>; [ <your packages> ])` when you want to add packages from another channel
  };

  # enable dconf (for wpgtk)
  programs.dconf.enable = true;

  # enable flatpak (for Logseq)
  # services.flatpak.enable = true;

  ## enable xbacklight (why wasn't this enabled at the start?)
  # programs.xorg.xbacklight.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    killall
    xrandr
    arandr
    neovim
    ranger
    ueberzug
    fish
    curl
    tmux
    btop
    networkmanagerapplet
    wireguard-tools
    adwaita-icon-theme
    wpgtk
    pywal16
    xss-lock
    atool
    gzip
    zip
    unzip
    qjackctl
    sops
    devenv

    # version control
    git

    # # c/c++
    # gcc
    # gdb

    # i3
    # i3lock
    rofi
    feh
    # i3blocks
    dunst
    # i3status
    # i3status-rust
    # polybar

    # pactl
    pamixer
    pavucontrol

    brightnessctl
    xbacklight

    # evtest
    xev

    # xmodmap

    # required to make i3 get the media keys and stuff---it's quite handy
    xorg.xf86inputevdev

    # i3 uses dex to run in its config file. I should check if that's necessary
    # or not.
    dex
    
    xarchiver
    xclip

    gparted
    
    # printing drivers
    hplip


    # # for notes and stuff---i'm just trying to see if this will work, since it
    # # wasn't working in the user packages
    # anytype
    # python3

    # lsp stuff
    ## python
    # ruff
    # pyright
    ## lua
    # luajitPackages.lua-lsp

    # niv  # manage nix dependencies
  ];
  

  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  programs.direnv.enable = true;
  programs.bash.interactiveShellInit =
    ''
    eval "$(direnv hook bash)"
    '';


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  services.gvfs.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
    # programs.ssh = {
    #     startAgent = true;
    #     enableAskPassword = true;
    # };
  services.gnome.gnome-keyring.enable = true;

  nix.settings.trusted-users = [ "root" "pines" ];
  # systemd.user.sessionVariables.SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";

    # services.picom.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

}
