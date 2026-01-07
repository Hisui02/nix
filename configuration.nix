{
  inputs,
  # lib,
  pkgs,
  ...
}:
# let
#   system = "x86_64-linux";
#   pkgs = import inputs.nixpkgs {
#     inherit system;
#     overlays = [
#       inputs.hydenix.overlays.default
#     ];

#     config.allowUnfree = true;

#     # Include your own package set to be used eg. pkgs.userPkgs.bash
#     userPkgs = inputs.nixpkgs {
#       config.allowUnfree = true;
#     };
#   };
# in
{

  # Set pkgs for hydenix globally, any file that imports pkgs will use this
  # nixpkgs.pkgs = pkgs;

  imports = [
    # hydenix inputs - Required modules, don't modify unless you know what you're doing
    inputs.hydenix.inputs.home-manager.nixosModules.home-manager
    inputs.hydenix.nixosModules.default
    ./modules/system
    ./hardware-configuration.nix
    ./disk-config.nix

    # === GPU-specific configurations ===

    /*
      For drivers, we are leveraging nixos-hardware
      Most common drivers are below, but you can see more options here: https://github.com/NixOS/nixos-hardware
    */

    #! EDIT THIS SECTION

    # Run `lshw -short` or `lspci` to identify your hardware

    # GPU Configuration (choose one):
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia # NVIDIA
    # inputs.nixos-hardware.nixosModules.common-gpu-amd # AMD

    # CPU Configuration (choose one):
    # inputs.nixos-hardware.nixosModules.common-cpu-amd # AMD CPUs
    inputs.nixos-hardware.nixosModules.common-cpu-intel # Intel CPUs

    # Additional Hardware Modules - Uncomment based on your system type:
    # inputs.nixos-hardware.nixosModules.common-hidpi # High-DPI displays
    # inputs.nixos-hardware.nixosModules.common-pc-laptop # Laptops
    inputs.nixos-hardware.nixosModules.common-pc-ssd # SSD storage
  ];

  # If enabling NVIDIA, you will be prompted to configure hardware.nvidia
  hardware.nvidia = {
    open = true; # For newer cards, you may want open drivers
    nvidiaSettings = true;
    # package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = { # For hybrid graphics (laptops), configure PRIME:
      # amdBusId = "PCI:0:2:0"; # Run `lspci | grep VGA` to get correct bus IDs
      # intelBusId = "PCI:0:2:0"; # if you have intel graphics
      # nvidiaBusId = "PCI:1:0:0";
      offload.enable = false; # Or disable PRIME offloading if you don't care
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };

    # backupFileExtension = "bak";

    #! EDIT THIS USER (must match users defined below)
    users."hisui" =
      { ... }:
      {
        imports = [
          inputs.hydenix.homeModules.default
          ./modules/hm # Your custom home-manager modules (configure hydenix.hm here!)
        ];
      };
  };

  # User Account Setup - REQUIRED: Change "hydenix" to your desired username (must match above)
  users.users.hisui = {
    isNormalUser = true;
    initialPassword = "hydenix"; # SECURITY: Change this password after first login with `passwd`
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
    ]; # User groups (determines permissions)
    shell = pkgs.zsh; # Default shell (options: pkgs.bash, pkgs.zsh, pkgs.fish)
  };

  # IMPORTANT: Customize the following values to match your preferences
  hydenix = {
    enable = true; # Enable the Hydenix module
    # Basic System Settings (REQUIRED):
    hostname = "hydenix"; # Change to your preferred hostname
    timezone = "Europe/Madrid"; # Change to your timezone
    locale = "en_US.UTF-8"; # Change to your preferred locale
  };

  # System Version - Don't change unless you know what you're doing (helps with system upgrades and compatibility)
  system.stateVersion = "25.05";
}
