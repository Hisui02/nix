{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./services.nix
    ./networking.nix
  ];

  environment.systemPackages = with pkgs; [
    # pkgs.vscode - hydenix's vscode version
    # pkgs.userPkgs.vscode - your personal nixpkgs version

    # Apps
    obsidian # Notes
    vlc # Video player

    # Dev
    ollama # AI
    nixfmt-rfc-style # Nix Language formatter

    # Shell
    bat
    btop

    # Others
    iio-hyprland # Both for automatically rotate the screen
  ];
}
