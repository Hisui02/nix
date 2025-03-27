{ lib, ... }:
{
  home = {
    file = {
      ".config/waybar/config.ctl" = lib.mkForce {
        source = ./config.ctl;
        force = true;
        mutable = true;
      };
    };

    #TODO: Propagate only modified modules
    file = {
      ".config/waybar/modules" = lib.mkForce {
        source = ./modules;
        force = true;
        mutable = true;
        recursive = true;
      };
    };
  };
}
