{ inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules/bundle.nix
  ];

  disabledModules = [

  ];
  services.openssh.enable = true;

  fileSystems."/home/hisui/nix" = {
    fsType = "vboxsf";
    device = "nix";
    options = [ "rw" "nofail" ];
  };

  nixpkgs.overlays = [ inputs.polymc.overlay ];

  networking.hostName = "nixos"; # Define your hostname.

  time.timeZone = "Europe/Madrid"; # Set your time zone.

  i18n.defaultLocale = "es_ES.UTF-8"; # Select internationalisation properties.
  
  console.keyMap = "es";

  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Enabling flakes

  system.stateVersion = "24.05"; # Don't change it bro
}
