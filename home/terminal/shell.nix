{config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
		enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
		oh-my-zsh = {
			enable = true;
			plugins = [
  			"git"
  			"sudo"
			];
  	};
		dotDir = "${config.xdg.configHome}/zsh";
		shellAliases = {
			c = "clear";
			fastfetch = "fastfetch --logo-type kitty";
			".." = "cd ..";
			"..." = "cd ../..";
			".3" = "cd ../../..";
			".4" = "cd ../../../..";
			".5" = "cd ../../../../..";
			mkdir = "mkdir -p";
		};
		# Using the new initContent API with proper ordering
		initContent = lib.mkMerge [
			(lib.mkOrder 500 ''
					# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
					# Initialization code that may require console input (password prompts, [y/n]
					# confirmations, etc.) must go above this block; everything else may go below.
					if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
						source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
					fi
					source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

			'')
			# Early initialization (before completion init) - order 550
			(lib.mkOrder 550 ''
				#!/usr/bin/env zsh
				# Some binds won't work on first prompt when deferred
				bindkey '\e[H' beginning-of-line
				bindkey '\e[F' end-of-line
			'')
			# needs to be sourced after 550
			(lib.mkOrder 910 ''
				# Source the rest of the functions
				if [[ -d ~/.config/zsh/functions ]]; then
						for file in ~/.config/zsh/functions/*.zsh; do
								[[ -f "$file" ]] && source "$file"
						done
				fi

				if [[ -d ~/.config/zsh/completions ]]; then
						for file in ~/.config/zsh/completions/*.zsh; do
								[[ -f "$file" ]] && source "$file"
						done
				fi
			'')
			# Regular initialization content
			''
				source "$ZDOTDIR/.p10k.zsh"
				fastfetch --logo-type kitty
			''
		];
	};
	home.file."${config.xdg.configHome}/zsh/.p10k.zsh".source = ./p10k.zsh;
	programs.fastfetch = {
		enable = true;
	};
}
