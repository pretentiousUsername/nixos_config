
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

# Eventually I'll be using imports to make this a bit nicer to work with.

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware/framework-13-2025.nix
      ./hardware-configuration.nix
      ./experimental.nix
      ./fonts.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "superfluid"; # Define your hostname.
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

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver = {
    enable = true;
    displayManager = {
        defaultSession = "none+i3";
        sddm.enable = false;
        # Lightdm and i3 do not get along for some reason.
        lightdm = {
            enable = true;
            greeters.gtk = {
                enable = true;
                indicators = [
                    "~host"
                    "~spacer"
                    "~clock"
                    "~spacer"
                    "~session"
                    "~a11y"
                    "~power"
                ];
                cursorTheme.size = 32;
                extraConfig = ''
                    font-name = monospace
                    user-background = true
                    background = /home/pines/Pictures/Wallpapers/1678704649268102.png
                '';
            };
            greeters.slick = {
                enable = false;
            };
        };
    };

    windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
            i3status-rust
            i3lock
            i3blocks
            i3status
        ];
    };

    # Enable the KDE Plasma Desktop Environment.
     desktopManager.plasma6.enable = true;
  };

  xdg = {
    autostart.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  # services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
    
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pines = {
    isNormalUser = true;
    description = "pines";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
        alacritty-graphics
        pandoc
        zotero
        haskellPackages.pandoc-crossref
        texliveFull
        typst
        inter
        stix-two
        julia-mono
        anytype
        zathura
        xfce.thunar
        lazygit
        neofetch  # lol
        audacity
        audacious
        discord
        lxappearance
        libreoffice
        cheese
        supercollider
        supercolliderPlugins.sc3-plugins
        # thunderbird
        # python
        # julia
        # pywal16
        # wallust
        flameshot
        hugo
        fzf

        # CAD stuff
        kicad
        freecad
        elmerfem

        gimp
        inkscape
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # enable dconf (for wpgtk)
  programs.dconf.enable = true;

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
    xsecurelock
    xss-lock
    atool
    gzip
    unzip

    devenv

    # version control
    git

    # # python
    # python313
    # python313Packages.pip
    # python313Packages.virtualenv
    # python313Packages.numpy
    # python313Packages.scipy
    # python313Packages.pandas

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
    themix-gui

    gparted
    
    # printing drivers
    hplip


    # # for notes and stuff---i'm just trying to see if this will work, since it
    # # wasn't working in the user packages
    # anytype
    (python3.withPackages(pypkgs: with pypkgs; [
        numpy
        pandas
        matplotlib
        scipy
        pywavelets
    ]))
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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
