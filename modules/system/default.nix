{ pkgs,... }:

{
  imports = [
    ./hardware.nix
    ./services.nix
    ./VPNs.nix
    ./virtualisation.nix
  ];

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
  };

  environment.systemPackages = with pkgs; [
    # pkgs.vscode - hydenix's vscode version
    # pkgs.userPkgs.vscode - your personal nixpkgs version
    # Apps
    obsidian # Notes
    vlc # Video player
    prismlauncher # Open Source Minecraft Launcher

    # Dev
    ollama # AI
    nixfmt-rfc-style # Nix Language formatter

    # Shell
    bat
    btop
    ripgrep

    # Work
    teamviewer
    remmina
    freerdp

    # Others
    iio-hyprland # Automatically rotate the screen
    easyeffects # Audio Input/Output effects

    # Windows emulation
    wineWowPackages.stable
    winetricks
    wineWowPackages.waylandFull
  ];
}
