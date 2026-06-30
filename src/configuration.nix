
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

# Eventually I'll be using imports to make this a bit nicer to work with.

{ config, pkgs, inputs, pkgs-unstable, pkgs-sc-update, specialArgs, options, modulesPath, ... }:

{
  imports =
    [
      ./experimental.nix
      ./fonts.nix
      inputs.musnix.nixosModules.musnix
      ./services/sops.nix
      ./services/sound.nix
      ./packages/ld/ld.nix
    ];


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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pines = {
    isNormalUser = true;
    description = "pines";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List services that you want to enable:
  services.gvfs.enable = true;

  nix.settings.trusted-users = [ "root" "pines" ];
}
