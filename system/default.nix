{
  pkgs,
  inputs,
  systemSettings,
  ...
}:
{
  imports = [
    ./services
    ./boot.nix
    ./environment.nix
    ./networking.nix
    ./virtualisation.nix
    ./window-manager.nix
    ./zen.nix
  ];

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages.${systemSettings.system}.default
  ];
}
