{ lib, ... }:
{
  home = {
    file = {
      ".config/waybar/config.ctl" = {
        source = ./config.ctl;
        force = true;
        mutable = true;
      };
    };

    #TODO: Propagate only modified modules
    file = {
      ".config/waybar/modules" = {
        source = ./modules;
        force = true;
        mutable = true;
        recursive = true;
      };
    };
  };
}
