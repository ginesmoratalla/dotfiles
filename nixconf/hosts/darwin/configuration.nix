{ pkgs
, config
, vars
, self
, ...
}:
let
  _ = import ./homebrew.nix { inherit vars; }; # reads the file and evaluates the result into the variable
in {

  # Import submodules
  imports = [
    ./homebrew.nix
    ./../../modules/darwin
  ];

  users.users.${vars.host} = {
    name = vars.host;
    home = "/Users/${vars.host}";
  };

  home-manager.users.${vars.host} = {
    targets.darwin.linkApps.enable = true;
    imports = [
      ../../modules/common
    ];
    home.stateVersion = "25.05";
  };

  ## NIX
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = vars.plataform;
  system.primaryUser = vars.host;

  ## SYSTEM CONFIG
  # $ darwin-rebuild changelog (please read the changelog before changing)
  system.stateVersion = 6;

  system.defaults = {
    dock.autohide = true;
    NSGlobalDomain.KeyRepeat = 2;
  };

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;
  security.pam.services.sudo_local.touchIdAuth = true;

  # SPOTLIGHT LINKS
  system.activationScripts.applications.text = let
    env = pkgs.buildEnv {
      name  = "system-applications";
      paths = config.environment.systemPackages;
      # pathsToLink = "/Applications";
    };
  in 
    pkgs.lib.mkForce ''
      # Set up applications

      echo "setting up desktop apps /Applications..." >&2
      rm -rf ~/Applications/Nix\ Apps/
      mkdir -p ~/Applications/Nix\ Apps/
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read -r src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix\ Apps/$app_name"
      done
    '';
}
