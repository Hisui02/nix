{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
		nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixvim = {
      url = "github:nix-community/nixvim";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
		noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };
    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { home-manager, nixvim, nixos-hardware, ... }@inputs:
    let
      systemSettings = {
        system = "x86_64-linux";
        hostname = "laptop-hisui";
        username = "hisui";
        timezone = "Europe/Madrid";
        locale = "en_US.UTF-8";
      };

      systemConfig = inputs.nixpkgs.lib.nixosSystem {
        system = systemSettings.system;
        specialArgs = {
          inherit inputs systemSettings;
        };
        modules = [
          home-manager.nixosModules.home-manager
          inputs.disko.nixosModules.disko
					nixos-hardware.nixosModules.lenovo-thinkpad-t490
          ./system.nix
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs systemSettings;
            };
            home-manager.users.${systemSettings.username} = {
              imports = [
                nixvim.homeModules.nixvim
                ./home.nix
              ];
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
