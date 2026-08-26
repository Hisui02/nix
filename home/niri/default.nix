{ pkgs, lib, ... }:
{
  xdg.configFile."niri/config.kdl".source = ./config.kdl;
  home.file =
  lib.mapAttrs'
    (name: _: {
      name = ".local/bin/${name}";
      value = {
        source = ./scripts + "/${name}";
        executable = true;
      };
    })
    (builtins.readDir ./scripts);
}
