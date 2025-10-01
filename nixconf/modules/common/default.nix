{ pkgs, config, lib, ... }:
{

  home.packages = with pkgs; [
    uv
    helix
    tmux
    typst
    cowsay
    ripgrep
    cmake
  ];

  imports = [
    ./tmux.nix
    ./git.nix
  ];

}
