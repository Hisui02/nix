{
  description = "Hisui-NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:

    let
      system = "x86_64-linux";
    in {
    # nixos - system hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./nixos/configuration.nix
      ];
    };

    homeConfigurations.hisui = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ ./home-manager/home.nix ];
    };
  };
}
