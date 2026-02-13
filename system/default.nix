{ pkgs, ... }:
{
  imports = [
    ./services
    ./disk-config.nix
    ./boot.nix
    ./environment.nix
    ./networking.nix
    ./virtualisation.nix
    ./window-manager.nix
  ];

  environment.systemPackages = with pkgs; [
  ];
}
