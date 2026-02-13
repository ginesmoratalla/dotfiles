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
    qbittorrent
    minikube
    pandoc
    # opencode
    mosquitto
    (texliveFull.withPackages (
        ps: with ps; [ 
          emptypage 
          csquotes 
          sectsty
          titlesec 
          placeins 
          tocloft
          lastpage
          svg-inkscape
        ]
      )
    )
  ];

  imports = [
    ./tmux.nix
    ./git.nix
  ];

}
