{
   #  boot.loader.grub.enable = true;
   #  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
 
   # Use the systemd-boot EFI boot loader.
   boot.loader.systemd-boot.enable = true;
   boot.loader.efi.canTouchEfiVariables = true;
}
