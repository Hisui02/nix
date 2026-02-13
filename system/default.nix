{ pkgs, ... }:
{
  imports = [
    ./services
    ./boot.nix
    ./environment.nix
    ./networking.nix
    ./virtualisation.nix
    ./window-manager.nix
  ];

  environment.systemPackages = with pkgs; [
  ];
}
