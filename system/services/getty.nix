{systemSettings, ...}:
{
  services.getty = {
    autologinOnce = true;
    autologinUser = systemSettings.username;
  };
}
