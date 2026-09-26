{ pkgs, inputs, systemSettings, lib, ... }:
{
  imports = [
		./gaming
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
		xwayland-satellite #TODO: Move to display manager configuration
  ];

	nix.settings = {
		extra-substituters = [ 
      "https://cache.nixos.org"
			"https://noctalia.cachix.org" 
		];
		extra-trusted-public-keys = [       
      "cache.nixos.org-1:6NCHdSuAYQQOxGEKTGXLN9WWRXoSBT8GRiSnR6IdfGW="
			"noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" 
		];
	};

	nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
		"cloudflare-warp"
		#TODO: Move to gaming configuration
		"steam"
    "steam-unwrapped"
    "proton-ge-bin"
	];
}
