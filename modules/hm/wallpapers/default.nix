{ lib, ... }:
{
  home = {
    file = {
      ".config/hyde/themes/Catppuccin Mocha/wallpapers" = lib.mkForce {
        source = ./Catppuccin-Mocha;
        force = true;
        recursive = true;
        mutable = true;
      };
    };
  };
}
