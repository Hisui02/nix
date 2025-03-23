{ lib, pkgs, ... }:
{
  programs.zsh = {
    oh-my-zsh.plugins = [
      "sudo"
      "git"
    ];

    envExtra = ''
      fastfetch
    '';

    shellAliases = {
      ff="fastfetch";
      cat="bat";

      kssh="kitty +kitten ssh";

      rb="sudo nixos-rebuild switch --flake ~/hydenix/#hydenix";
      cl="sudo nix-collect-garbage -d && rb"; # This alias calls rebuild once
    };
  };
}
