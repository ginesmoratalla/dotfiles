{ vars, ... }:

{
  nix = {
    settings.experimental-features = "nix-command flakes";
  };

  nixpkgs = {

    config = {
      allowUnfree = true;      # Allow unfree packages
    };

  };
  

}
