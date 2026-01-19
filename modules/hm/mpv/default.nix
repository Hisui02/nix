{
  # MPV is a commandline videoplayer
  # https://github.com/mpv-player/mpv

  programs.mpv = {
    enable = true;
  };

  services.jellyfin-mpv-shim.enable = true; # https://github.com/jellyfin/jellyfin-mpv-shim
}
