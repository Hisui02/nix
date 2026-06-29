{ ... }:
{
  # replace `vmVariant` with `vmVariantWithBootLoader` if you are going to use `build-vm-with-bootloder`.
  virtualisation.vmVariant = {
    # the following configuration is added only when building VM with `build-vm`
    virtualisation = {
      memorySize = 4096;
      cores = 2;
      graphics = true;
    };
  };
}
