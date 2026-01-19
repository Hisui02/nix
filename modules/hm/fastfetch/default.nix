{ config, lib, ... }:
{
  home.file = {
    ".config/fastfetch/pngs" = {
      source = ./pngs;
      force = true;
      mutable = true;
      recursive = true;
    };
  };

  programs.fastfetch.settings = {
    logo = {
      source = "${config.home.homeDirectory}/.config/fastfetch/pngs";
      type = "kitty-direct";
      height = 10;
      width = 25;
    };
    display = {
      separator = ": ";
    };
    modules = [
      {
        type = "title";
        key = "  ";
      }
      {
        type = "custom";
        format = "┌──────────────────────────────────────────┐";
      }
      {
        type = "os";
        key = "    OS";
        format = "{3}";
        keyColor = "red";
      }
      {
        type = "cpu";
        format = "{1}";
        key = "    CPU";
        keyColor = "blue";
      }
      {
        type = "memory";
        key = "    Memory";
        keyColor = "magenta";
      }
      {
        type = "gpu";
        format = "{2}";
        key = "  󰮂  GPU";
        keyColor = "default";
      }
      {
        type = "display";
        key = "  󰍹  Display";
        format = "{1}x{2} @ {3}Hz";
        keyColor = "green";
      }
      {
        type = "wm";
        key = "  󱂬  WM";
        format = "{2} ({3})";
        keyColor = "yellow";
      }
      {
        type = "terminal";
        key = "    Terminal";
        format = "{5}";
        keyColor = "cyan";
      }
      {
        type = "custom";
        format = "└──────────────────────────────────────────┘";
      }
    ];
  };
}
