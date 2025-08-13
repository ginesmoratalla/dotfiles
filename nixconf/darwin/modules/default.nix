{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.callPackage ./fastfetch.nix {} )
  ];
}
