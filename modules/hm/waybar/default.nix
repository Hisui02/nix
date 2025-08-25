{ lib, ... }:
{
  home = {
    file = {
      ".local/share/waybar/layouts/hyprdots/CUSTOM.jsonc" = lib.mkForce {
        source = ./CUSTOM.jsonc;
        force = true;
        mutable = true;
      };
    };

    file = {
      ".local/share/waybar/modules/pers-clock.jsonc" = lib.mkForce {
        source = ./modules/pers-clock.jsonc;
        force = true;
        mutable = true;
      };
    };

    file = {
      ".local/share/waybar/modules/pers-window.jsonc" = lib.mkForce {
        source = ./modules/pers-window.jsonc;
        force = true;
        mutable = true;
      };
    };
  };
}
