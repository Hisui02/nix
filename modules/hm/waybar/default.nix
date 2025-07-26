{ lib, ... }:
{
  home = {
    # file = {
    #   ".config/waybar/config.ctl" = lib.mkForce {
    #     source = ./config.ctl;
    #     force = true;
    #     mutable = true;
    #   };
    # };
    file = {
      ".local/share/waybar/layouts/hyprdots/CUSTOM.jsonc" = lib.mkForce {
        source = ./CUSTOM.jsonc;
        force = true;
        mutable = true;
      };
    };

    file = {
      ".local/share/waybar/modules/clock.jsonc" = lib.mkForce {
        source = ./modules/clock.jsonc;
        force = true;
        mutable = true;
      };
    };

    file = {
      ".local/share/waybar/modules/hyprland-window.jsonc" = lib.mkForce {
        source = ./modules/hyprland-window.jsonc;
        force = true;
        mutable = true;
      };
    };
  };
}
