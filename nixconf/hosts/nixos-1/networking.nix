{ config, pkgs, ... }:
{
    networking = {
      firewall = {
        enable=true;
        checkReversePath = false;
      };
      hostName = "nixos";
      networkmanager.enable = true;
      # wireguard.enable = true;
    };

    services.resolved.enable = true; 
}
