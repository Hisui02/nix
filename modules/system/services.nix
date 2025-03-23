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
  };
}
