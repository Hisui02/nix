{ pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./secure-boot.nix
    ./nvidia.nix
    ./logind.nix
    #./VPNs.nix
    ./docker.nix
    ./flatpak.nix
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
    ncspot # Spotify CLI

    # Dev
    ollama # AI
    nixfmt-rfc-style # Nix Language formatter

    # Shell
    bat
    btop
    ripgrep

    # Others
    freerdp

    sbctl # For debugging and troubleshooting Secure Boot.
  ];
}
