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
  ];

	nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
		"cloudflare-warp"
	];
}
