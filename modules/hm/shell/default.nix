{ lib, pkgs, ... }:
{
  home.file = {
    ".rgignore" = lib.mkForce {
      source = ./.rgignore;
      force = true;
      mutable = true;
    };
  };

  programs = {
    zsh = {
      envExtra = '''';

      shellAliases = {
        ff = "fastfetch";
        cat = "bat";

        ssh = "kitty +kitten ssh";

        rb = "sudo nixos-rebuild switch --flake ~/hydenix/#hydenix";
        cl = "sudo nix-collect-garbage -d && rb";

        l = "ls -lah --hyperlink=auto";
        la = "ls -lAh --hyperlink=auto";
        ld = "eza -lhD --icons=auto --hyperlink";
        ll = "ls -lh --hyperlink=auto";
        ls = "ls --color=tty --hyperlink=auto";
        lsa = "ls -lah --hyperlink=auto";
        lt = "eza --icons=auto --tree --hyperlink";

        diff = "kitten diff";

        rdpOficina = "xfreerdp /u:alvaro /v:192.168.1.185 /dynamic-resolution /microphone:sys:pulse /sound:sys:pulse /gfx:AVC444:on";
      };

      initExtra = ''
        fastfetch
        if [ -n "''${commands[fzf-share]}" ]; then
          source "$(fzf-share)/key-bindings.zsh"
          source "$(fzf-share)/completion.zsh"
        fi

        export FZF_DEFAULT_COMMAND="rg --files --hidden --ignore-file ~/.rgignore"

        export FZF_DEFAULT_OPTS="\
          --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
          --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
          --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
          --color=selected-bg:#45475a \
          --color=border:#313244,label:#cdd6f4 \
          --preview='bat --style=numbers --color=always {}'"

        export FZF_CTRL_R_OPTS="--no-preview"
      '';
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "rg --files --hidden";
    };
  };
}
