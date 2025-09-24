{ pkgs, config, ... }:
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
