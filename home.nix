{ systemSettings, ... }:
{
  imports = [
    ./home
  ];

  home.username = systemSettings.username;
  home.homeDirectory = "/home/${systemSettings.username}";
  home.stateVersion = "26.05";
}
