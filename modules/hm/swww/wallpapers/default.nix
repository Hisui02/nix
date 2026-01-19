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
    file = {
      ".config/hyde/themes/Nightbrew/wallpapers/creation-of-adam.jpg" = lib.mkForce {
        source = ./Nightbrew/creation-of-adam.jpg;
        force = true;
        mutable = true;
      };
    };
  };
}
