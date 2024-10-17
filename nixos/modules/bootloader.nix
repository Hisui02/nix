{
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "nodev"; # or "nodev" for efi only
    boot.loader.grub.efiSupport = true;   

   # Use the systemd-boot EFI boot loader.
   # boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
}
