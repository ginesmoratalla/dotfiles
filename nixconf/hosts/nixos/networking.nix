{ config, pkgs, ... }:
{
    networking = {
      # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
      firewall = {
        enable=true;
        checkReversePath = false;
      };
      hostName = "nixos"; # Define your hostname.
      networkmanager.enable = true;
      # wireguard.enable = true;
    };

    # Enable networking VPM
    services.resolved.enable = true; 
}
