{ pkgs, ... }:
{
  imports = [
    ./yabai.nix
    ./skhd.nix
  ];

  environment.systemPackages = with pkgs; [
  ];

}
