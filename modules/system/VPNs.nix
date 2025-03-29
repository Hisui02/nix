{ pkgs, ... }:
let
  vpnPath = "/home/hisui/hydenix/modules/system/.vpn";
in
{
  # Wireguard
  networking = {
    wireguard.enable = true;
    wg-quick.interfaces = {
      server-root = {
        autostart = false;
        configFile = "${vpnPath}/peer_root.conf";
      };
      server-guest = {
        autostart = false;
        configFile = "${vpnPath}/peer_guest.conf";
      };
    };
  };

  # OpenVPN
  programs.openvpn3.enable = true;
  services.openvpn.servers = {
    officeVPN = {
      #NOTE: If cyphers give problems (check with systemctl status before start), add them to the .ovpn file. Ex: data-ciphers AES-256-CBC
      config = ''
        config ${vpnPath}/oficina.ovpn 
        auth-user-pass ${vpnPath}/oficina_auth.txt
      '';
      autoStart = false;
    };
  };
}
