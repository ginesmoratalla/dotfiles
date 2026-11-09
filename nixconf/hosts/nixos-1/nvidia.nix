{ config, pkgs, ... }:
{
    nixpkgs.config.cudaSupport = true;

    # NVIDIA Drivers
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };
      nvidia = {
        modesetting.enable = true;

        # Enable this only if you have graphical corruption issues 
        # or application crashes after waking up from sleep
        powerManagement.enable = false;

        # Turns off GPU when not in use.
        powerManagement.finegrained = false;

        open = false;

        # NVIDIA settings pannel accesible via 'nvidia-settings'
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.production;

        prime = {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:90:0:0";
        };
      };
    };

    services.xserver.videoDrivers = ["nvidia"];
    # systemd.services.nvidia-control-devices = {
    #   wantedBy = [ "multi-user.target" ];
    #   serviceConfig.ExecStart = "${pkgs.linuxPackages.nvidia_x11.bin}/bin/nvidia-smi";
    # };
}
