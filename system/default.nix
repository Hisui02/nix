{ pkgs, inputs, systemSettings, lib, ... }:
{
  imports = [
		./hardware
		./packages
    ./services
    ./boot.nix
    ./environment.nix
		./garbage-collector.nix
    ./networking.nix
    ./virtualisation.nix
    ./window-manager.nix
  ];

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages.${systemSettings.system}.default
		inputs.noctalia.packages.${systemSettings.system}.default
		inputs.psysonic.packages.${systemSettings.system}.psysonic
  ];

	nix.settings = {
		extra-substituters = [ 
      "https://cache.nixos.org"
	    "https://psysonic.cachix.org"
			"https://noctalia.cachix.org" 
		];
		extra-trusted-public-keys = [       
      "cache.nixos.org-1:6NCHdSuAYQQOxGEKTGXLN9WWRXoSBT8GRiSnR6IdfGW="
			"psysonic.cachix.org-1:M9cQyQ7tgvUWOQ5Pyt8ozlMoPLtOZir6MfRuTH9/VYA="
			"noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" 
		];
	};

	nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
		"cloudflare-warp"
	];
}
