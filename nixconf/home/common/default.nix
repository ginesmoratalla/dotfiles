{ pkgs, ... }:
{

  home.packages = with pkgs; [
    bat                                        # Like cat but with pretty print and in rust
    uv                                         # Python package and project manager
    helix
    typst
    cowsay
    ripgrep
    cmake
    podman
    qbittorrent
    minikube                                   # Run Kubernetes Locally
    pandoc
    mosquitto
    fastfetch
  ];

  imports = [
    ./tmux.nix
    ./git.nix
    ./ghostty.nix
  ];

}
