{ lib, pkgs, ... }:
{
  programs = {
    zsh = {
      envExtra = ''
        fastfetch
      '';

      shellAliases = {
        ff = "fastfetch";
        cat = "bat";

        ssh = "kitty +kitten ssh";

        rb = "sudo nixos-rebuild switch --flake ~/hydenix/#hydenix";
        cl = "sudo nix-collect-garbage -d && rb"; # This alias calls rebuild once

        c = "codium";
      };

      initExtra = ''
        if [ -n "''${commands[fzf-share]}" ]; then
          source "$(fzf-share)/key-bindings.zsh"
          source "$(fzf-share)/completion.zsh"
        fi
      '';
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
