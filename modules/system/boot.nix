{
  # System clock might be incorrect after booting Windows and going back to the NixOS.
  # It can be fixed by either setting RTC time standard to UTC on Windows, or setting it to localtime on NixOS.
  time.hardwareClockInLocalTime = true;

  # Adding Windows to systemd-boot #TODO
  boot.loader.systemd-boot.windows = {
    "11-pro" = {
      title = "Windows";
      efiDeviceHandle = "HD1b";
    };
  };
}
