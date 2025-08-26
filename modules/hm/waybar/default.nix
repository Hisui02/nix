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
      ".config/waybar/modules/clock.jsonc" = lib.mkForce {
        source = ./modules/clock.jsonc;
        force = true;
        mutable = true;
      };
    };

    file = {
      ".config/waybar/modules/window.jsonc" = lib.mkForce {
        source = ./modules/window.jsonc;
        force = true;
        mutable = true;
      };
    };
  };
}
