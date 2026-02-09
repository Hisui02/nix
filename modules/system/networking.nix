{ pkgs, ... }:
{
  networking = {
    networkmanager.plugins = with pkgs; [
      networkmanager-openvpn
    ];

    firewall = {
      enable = true;
      allowedTCPPorts = [
        11434
      ];
      allowedUDPPorts = [
        11434
      ];
    };
  };

  services.cloudflare-warp.enable = true;
}
