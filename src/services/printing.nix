{ config, pkgs }:

{
  environment.systemVariables = with pkgs; [
    hplip  # printing drivers
  ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

}
