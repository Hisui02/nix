{
  services = {
    logind = {
      powerKey = "suspend";
      powerKeyLongPress = "poweroff";
      lidSwitchDocked = "suspend";
      extraConfig = ''
        InhibitDelayMaxSec=60
      '';
    };

    teamviewer.enable = true;

  };
}
