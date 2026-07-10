{
  description = "A *really* basic flake";

  inputs = {
    nixpkgs = {
        url = "github:nixos/nixpkgs?ref=nixos-26.05";
    };

    nixpkgs-unstable = {
        url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    nixpkgs-sc-update = {
        url = "github:pretentiousUsername/nixpkgs?ref=supercollider-3.14.1";
    };

    sops-nix = {
        url = "github:Mic92/sops-nix";
        # inputs.nixpkgs.follows = "nixpkgs"; # doesn't play well for some reason
    };
    
    nixos-hardware = {
        url = "github:NixOS/nixos-hardware";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    musnix = {
        url = "github:musnix/musnix";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nixpkgs-sc-update, ... } @ inputs:
    let
        system = "x86_64-linux";
        # system = "${pkgs.stdenv.hostPlatform.system}";
        pkgs = nixpkgs.legacyPackages.${system};
        pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
        pkgs-sc-update = nixpkgs-sc-update.legacyPackages.${system};
    in
    {
        nixosConfigurations = {
            superfluid = nixpkgs.lib.nixosSystem {
                specialArgs = {
                    inherit inputs;
                    inherit pkgs-unstable;
                    inherit pkgs-sc-update;
                };
                modules = [
                    inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
                    inputs.musnix.nixosModules.musnix
                    ./configuration.nix
                    ./hosts/superfluid/configuration.nix
                    ./modules
                ];
            };

            kapitsa = nixpkgs.lib.nixosSystem {
                specialArgs = {
                    inherit inputs;
                    inherit pkgs-unstable;
                    inherit pkgs-sc-update;
                };

                modules = [
                    inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
                    inputs.musnix.nixosModules.musnix
                    ./configuration.nix
                    ./hosts/kapitsa/configuration.nix
                    ./modules
                ];
            };
        };
        # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

        # packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
    };
}
