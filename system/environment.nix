{
  environment = {
    loginShellInit = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        echo "HOLA"
      fi
    '';
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
