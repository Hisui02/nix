{inputs, ...}:{
	home.packages = [
  	inputs.psysonic.packages.${pkgs.stdenv.hostPlatform.system}.psysonic
	];
}
