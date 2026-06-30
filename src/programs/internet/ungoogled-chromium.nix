{ config, pkgs, ... }:

{
  users.users.pines.packages = [
    ungoogled-chromium
  ];
}
