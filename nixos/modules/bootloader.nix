{
 #  boot.loader.systemd-boot.enable = true;
 # boot.loader.efi.canTouchEfiVariables = true;
 # boot.initrd.kernelModules = [ "amdgpu" ];
 # boot.kernelParams = [ "psmouse.synaptics_intertouch=0" ]; 
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
}
