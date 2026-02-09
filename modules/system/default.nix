{ pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./secure-boot.nix
    ./docker.nix
    ./flatpak.nix
    ./networking.nix
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
    # Apps
    obsidian # Notes
    vlc # Video player
    prismlauncher # Open Source Minecraft Launcher

    # Dev
    # ollama # AI
    nixfmt-rfc-style # Nix Language formatter

    # Shell
    bat
    btop
    ripgrep

    # Others
    remmina
    sbctl # For debugging and troubleshooting Secure Boot.

    # cloudflare-warp # Cloudflare free VPN

    # winboat # Windows dockerization
  ];
}
