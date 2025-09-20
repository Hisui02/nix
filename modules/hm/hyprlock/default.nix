{ lib, ... }:
{
    home.file = {
    ".config/hypr/hyprlock/theme.conf" = lib.mkForce {
      source = ./theme.conf;
      force = true;
      mutable = true;
    };
  };
}
