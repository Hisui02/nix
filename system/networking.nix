{ systemSettings, ... }:
{
  networking = {
    hostName = systemSettings.hostname;
    networkmanager.enable = true;
    # firewall = {
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
      # firewall.enable = false;
    # };
  };
}
