{ vars, inputs, ... }:
{

  ## HOMEBREW STUFF
  homebrew = {

      enable = true;

      brews = [
        "mas"
        "mysql"
        "socket_vmnet"
      ];

      casks = [
        "hammerspoon"
        "selfcontrol"                               # Block domains
        "gcloud-cli"
        "pycharm"
        "vlc"                                       # VLC Player
        "proton-pass"
      ];

      masApps = {};

      onActivation = {
        autoUpdate = true;
        upgrade = false;
        # cleanup = "zap";
      };
  };

  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = vars.user;
    autoMigrate = true;

    # Declarative tap management
    taps = {
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
      "homebrew/homebrew-core" = inputs.homebrew-core;
    };

    # taps can no longer be added imperatively with `brew tap`.
    # mutableTaps = false;
  };
}

