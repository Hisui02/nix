{ config, ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime.offload.enable = false; # Disabling NVIDIA Prime, to prevent it asking to configure busIds for integrated GPU
  };
}
