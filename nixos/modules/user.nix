{ pkgs, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.hisui = {
      isNormalUser = true;
      description = "Alvaro LG";
      extraGroups = [ "networkmanager" "wheel" "input" "libvirtd" "vboxsf" ];
      packages = with pkgs; [];
    };
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "hisui";
}
