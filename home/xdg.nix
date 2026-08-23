{
	xdg = {
		enable = true;
		mime.enable = true;
		mimeApps.enable = true;
		# Note, if you installed Home Manager via its NixOS module and
		#'home-manager.useUserPackages' is enabled, make sure to add
		#nix
		#environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];
		#to your NixOS configuration so that the portal definitions and DE
		#provided configurations get linked.
		#		portal.enable = true;
	};
}
