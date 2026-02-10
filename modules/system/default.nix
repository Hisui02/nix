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

programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    # Apps
    obsidian # Notes
    vlc # Video player
    prismlauncher # Open Source Minecraft Launcher

    # Dev
    nixfmt-rfc-style # Nix Language formatter
    lazygit
    yazi

    # Shell
    bat
    btop
    ripgrep

#    niri
    xwayland-satellite

    # Others
    remmina
    sbctl # For debugging and troubleshooting Secure Boot.

    # cloudflare-warp # Cloudflare free VPN

    # winboat # Windows dockerization
  ];
}
