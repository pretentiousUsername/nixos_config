{
  description = "A very basic flake";

  inputs = {
    nixpkgs = {
        url = "github:nixos/nixpkgs?ref=nixos-26.05";
    };

    sops-nix = {
        url = "github:Mic92/sops-nix";
    };
    
    nixos-hardware = {
        url = "github:NixOS/nixos-hardware";
        inputs.nixpkgs.follows = "nixpkgs";
    }
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    nixosConfigurations = {
        superfluid = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [
                inputs.muxnix.nixosModules.muxnix
                ./configuration.nix
                inputs.nixos-hardware.framework-13-inch-amd-ai-300-series
            ];
        };
    };
    # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    # packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
