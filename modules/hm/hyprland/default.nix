{ lib, ... }:
{
  home.file = {
    ".config/hypr/userprefs.conf" = lib.mkForce {
      source = ./userprefs.conf;
      force = true;
      mutable = true;
    };
  };

  # TODO: Refactor Hyprland config
}
