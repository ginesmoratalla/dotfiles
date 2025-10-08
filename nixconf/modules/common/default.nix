{ pkgs, config, lib, ... }:
{

  home.packages = with pkgs; [
    bat
    uv
    helix
    tmux
    typst
    cowsay
    ripgrep
    cmake
    podman
  ];

  imports = [
    ./tmux.nix
    ./git.nix
  ];

}
