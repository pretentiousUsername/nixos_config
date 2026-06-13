{
  description = "A *really* basic flake";

  inputs = {
    nixpkgs = {
        # url = "github:nixos/nixpkgs?ref=nixos-26.05";
        url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    nixpkgs-unstable = {
        url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    sops-nix = {
        url = "github:Mic92/sops-nix";
    };
    
    nixos-hardware = {
        url = "github:NixOS/nixos-hardware";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    musnix = {
        url = "github:musnix/musnix";
    };
  };

  outputs = { self, nixpkgs, ... } @ inputs:
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in
    {
        nixosConfigurations = {
            superfluid = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                modules = [
                    inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
                    inputs.musnix.nixosModules.musnix
                    ./hardware/superfluid/superfluid.nix
                    ./configuration.nix
                ];
            };
        };
        # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

        # packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
    };
}
