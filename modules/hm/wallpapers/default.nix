{ lib, ... }:
{
  home = {
    file = {
      ".config/hyde/themes/Catppuccin Mocha/wallpapers/cats.jpg" = lib.mkForce {
        source = ./Catppuccin-Mocha/cats.jpg;
        force = true;
        mutable = true;
      };
    };
  };
}
