{ pkgs, inputs, ... }:
{
	# import the home manager module
	imports = [
		inputs.noctalia.homeModules.default
	];
	xdg.configFile."noctalia/settings.json".source = ./settings.json;
	# configure options
	programs.noctalia-shell = {
			enable = true;
		# settings = "~/.config/noctalia/settings.json";
	};
}
