{ ... }:
{

  environment.variables = {
    EDITOR = "nvim";
  };

  imports = [
    ./nix.nix
  ];

}
