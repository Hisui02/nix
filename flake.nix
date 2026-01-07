{
  description = "template for hydenix";

  inputs = {
    nixpkgs = {
      # url = "github:nixos/nixpkgs/nixos-unstable"; # uncomment this if you know what you're doing
      follows = "hydenix/nixpkgs"; # then comment this
    };
    hydenix.url = "github:richen604/hydenix";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      # Optional but recommended to limit the size of your system closure.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

 outputs =
    { ... }@inputs:
    let
      hydenixConfig = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          inputs.disko.nixosModules.disko
          inputs.lanzaboote.nixosModules.lanzaboote
          ./configuration.nix
        ];
      };
      vmConfig = inputs.hydenix.lib.vmConfig {
        inherit inputs;
        nixosConfiguration = hydenixConfig;
      };
    in
    {
      nixosConfigurations.hydenix = hydenixConfig;
      nixosConfigurations.default = hydenixConfig;
      packages."x86_64-linux".vm = vmConfig.config.system.build.vm;
    };
}
