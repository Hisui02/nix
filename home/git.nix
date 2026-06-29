{
  programs = {
    git = {
      enable = true;
      settings = {
        user.name = "hisui";
        user.email = "alvarolgleiva@gmail.com";
        init.defaultBranch = "main";
      };
    };
    lazygit = {
      enableZshIntegration = true;
    };
  };
}
