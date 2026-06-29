{ pkgs, inputs, ... }:
{
	# import the home manager module
	imports = [
		inputs.noctalia.homeModules.default
	];
	xdg.configFile."noctalia/config.toml".source = ./config.toml;
}
