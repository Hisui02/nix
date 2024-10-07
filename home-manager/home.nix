{

  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];

  home = {
    username = "hisui";
    homeDirectory = "/home/hisui";
    stateVersion = "23.11";
  };
}
