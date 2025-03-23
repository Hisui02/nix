{
  home.file = {
    ".config/hypr/userprefs.conf" = {
      source = ./userprefs.conf;
      force = true;
      mutable = true;
    };
    ".local/share/bin/custom-monitor.sh" = {
      source = ./scripts/custom-monitor.sh;
      force = true;
      mutable = true;
    };
  };
}
