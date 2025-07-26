{ lib, ... }:
{
  home.file = {
    ".config/hypr/userprefs.conf" = lib.mkForce {
      source = ./userprefs.conf;
      force = true;
      mutable = true;
    };
    # ".local/lib/hyde/custom-monitor.sh" = {
    #   source = ./scripts/custom-monitor.sh;
    #   force = true;
    #   mutable = true;
    # };
  };
}
