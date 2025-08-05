{ pkgs, config, ... }:
{

  ## HOMEBREW STUFF
  homebrew = {
      enable = true;
      brews = [
        "mas"
      ];

      casks = [
        "hammerspoon"
      ];

      masApps = {
        # "Yoink" = 45762243;
      };
      onActivation.autoUpdate = true;
      onActivation.upgrade = true;
      # onActivation.cleanup = "zap";
  };

  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = vars.host;
    autoMigrate = true;
  };
}
