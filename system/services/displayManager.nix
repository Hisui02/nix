{systemSettings,...}:
{
  services.displayManager = {
    autoLogin = {
      enable = true;
      user = systemSettings.username
    };
    sddm = {
      enable = true;
      defaultSession = "niri";
      wayland.enable = true;
    };
  };
}
