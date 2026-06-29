{ pkgs, systemSettings, ... }:

{
  imports = [
    ./disk-config.nix
    ./hardware-configuration.nix
    ./system
  ];

  time.timeZone = systemSettings.timezone;

  i18n.defaultLocale = systemSettings.locale;
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  users.users.${systemSettings.username} = {
    isNormalUser = true;
    initialPassword = systemSettings.username;
    extraGroups = [ "wheel" "video" ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true; # Skip verification, shell already configured in home/shell
    packages = with pkgs; [ ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";
}
