{ config, lib, ... }:
{
  home.file = {
    ".config/fastfetch/config.jsonc" = {
      source = ./config.jsonc;
      force = true;
      mutable = true;
    };
    ".config/fastfetch/custom-pngs" = {
      source = ./pngs;
      force = true;
      mutable = true;
      recursive = true;
    };
  };
}
