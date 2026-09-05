{ pkgs, inputs, ... }:
{
	# import the home manager module
	imports = [
		inputs.noctalia.homeModules.default
	];
	xdg.configFile."noctalia/config.toml".source = ./config.toml;
	home.file.".avatar.jpg".source = ./avatar.jpg;
	home.file."Pictures/Wallpapers/wallpaper.jpg".source = ./wallpaper.jpg;
}
