{
  virtualisation.docker = {
    enable = true;
    daemon.settings.features.cdi = true; # For NVIDIA Containers to work properly
  };
  hardware.nvidia-container-toolkit.enable = true;  # For NVIDIA Containers to work properly
  users.extraGroups.docker.members = [ "hisui" ];
}
