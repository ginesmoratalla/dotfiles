{ ... }:
let
  user = "ginesmoratalla";
in
{

  # Import submodules
  imports = [];

  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.${user} = {
    name = user;
    home = "/Users/${user}";
  };

  system = {
    stateVersion = 6;
  };


  security = {

    # Set Git commit hash for darwin-version.
    pam.services.sudo_local.touchIdAuth = true;

  };


}
