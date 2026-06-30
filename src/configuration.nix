
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

  # Enable sound with pipewire.
  # services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pines = {
    isNormalUser = true;
    description = "pines";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    sops


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
