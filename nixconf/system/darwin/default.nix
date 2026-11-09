{ self, pkgs, vars, ... }:
{


  # -------------------------------------------------------------------
  # SYSTEM SETTINGS
  system = {

    primaryUser = vars.user;

    defaults = {
      dock.autohide = true;
      NSGlobalDomain.KeyRepeat = 2;
    };

    configurationRevision = self.rev or self.dirtyRev or null;

  };
  # SYSTEM SETTINGS
  # -------------------------------------------------------------------

  imports = [
    ../common
    ./yabai.nix
    ./skhd.nix
    ./homebrew.nix
  ];

  environment.systemPackages = with pkgs; [
  ];

}
