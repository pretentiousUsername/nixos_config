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

          # Enable the KDE Plasma Desktop Environment.
          displayManager.sddm.enable = false;
          displayManager.lightdm = {
              enable = true;
              greeters.gtk.enable = false;
              greeters.slick = {
                  enable = true;
              };
          };
          desktopManager.plasma6.enable = true;
    };

   services.xserver.windowManager.i3 = {
     enable = true;
     # extraPackages = with pkgs; [
     #   i3lock
     #   rofi
     #   feh
     #   i3blocks
     #   dunst
     #   i3status
     #   # polybar
     # ];
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
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

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
        haskellPackages.pandoc-crossref
        texliveFull
        inter
        stix-two
        julia-mono
        anytype
        zathura
        xfce.thunar
        lazygit
        neofetch  # lol
        audacity
        discord
        lxappearance
        # supercollider
        # supercolliderPlugins.sc3-plugins
        # thunderbird
        # python
        # julia
        # pywal16
        # wallust
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # enable dconf (for wpgtk)
  programs.dconf.enable = true;

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
    adwaita-icon-theme
    picom
    wpgtk
    pywal16
    # xfce.thunar
    xsecurelock
    xss-lock

    # version control
    git

    # # python
    # python3
    # python313Packages.pip
    # python313Packages.virtualenv
    # python313Packages.numpy
    # python313Packages.scipy
    # python313Packages.pandas

    # # c/c++
    # gcc
    # gdb

    i3
    i3lock
    rofi
    feh
    i3blocks
    dunst
    i3status
    # polybar

    # pactl
    pamixer
  ];
  

  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  services.gnome.gnome-keyring.enable = true;

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
