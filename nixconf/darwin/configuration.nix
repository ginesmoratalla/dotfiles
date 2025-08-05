{ pkgs, config, vars, ... }:
let
    _ = import ./homebrew.nix { inherit vars; };
in {


  # Import submodules
  imports = [
  ];

  ## NIX
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";


  ## SYSTEM CONFIG
  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = vars.plataform;

  system.defaults = {
    dock.autohide = true;
    NSGlobalDomain.KeyRepeat = 2;
  };

  # SPOTLIGHT LINKS
  system.activationScripts.applications.text = let
    env = pkgs.buildEnv {
      name  = "system-applications";
      paths = config.environment.systemPackages;
      pathsToLink = "/Applications";
    };
  in 
    pkgs.lib.mkForce ''
      # Set up applications
      echo "setting up desktop apps /Applications..." >&2
      rm -rf /Applications/Nix\ Apps/
      mkdir -p /Applications/Nix\ Apps/
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read -r src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix\ Apps/$app_name"
      done
    '';
  system.primaryUser = vars.host;
}
