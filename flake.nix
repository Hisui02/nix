{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { home-manager, ... }@inputs:
    let
      systemSettings = {
        hostname = "laptop-hisui";
        username = "hisui";
        timezone = "Europe/Madrid";
        locale = "en_US.UTF-8";
        system = "x86_64-linux";
      };

      systemConfig = inputs.nixpkgs.lib.nixosSystem {
        system = systemSettings.system;
        specialArgs = {
          inherit inputs systemSettings;
        };
        modules = [
          home-manager.nixosModules.home-manager
          inputs.disko.nixosModules.disko
          ./system.nix
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.${systemSettings.username} = import ./home.nix {
              inherit systemSettings;
            };
          }
        ];
      };
    in
    {
      nixosConfigurations.${systemSettings.hostname} = systemConfig;
      nixosConfigurations.default = systemConfig;
    };
}
