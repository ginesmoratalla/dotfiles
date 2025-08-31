{ vars, ... }:
{

  ## HOMEBREW STUFF
  homebrew = {
      enable = true;
      brews = [
        "mas"
      ];

      casks = [
        "hammerspoon"
        "selfcontrol"
        # "raycast"
      ];

      masApps = {
        # "Yoink" = 45762243;
        # "Davinci Resolve" = 571213070;
      };

      onActivation = {
        autoUpdate = true;
        upgrade = true;
        # cleanup = "zap";
      };
  };

  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = vars.host;
    autoMigrate = true;

    # Declarative tap management
    taps = {
      "homebrew/homebrew-core" = vars.homebrew-core;
      "homebrew/homebrew-cask" = vars.homebrew-cask;
    };

    # taps can no longer be added imperatively with `brew tap`.
    # mutableTaps = false;
  };
}
