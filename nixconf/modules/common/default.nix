{ pkgs, config, ... }:
{

  home.packages = with pkgs; [
    uv
    helix
    tmux
    typst
    cowsay
    ripgrep
  ];

  imports = [
    ./tmux.nix
    ./git.nix
  ];

}
