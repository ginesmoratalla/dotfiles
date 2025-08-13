{ pkgs, config, ... }:
{

  environment.systemPackages = with pkgs; [
    uv
    helix
    tmux
    typst
    cowsay
    ripgrep
  ];

  environment.variables = {
    EDITOR = "nvim";
  };

  imports = [
    # ./tmux/tmux.nix
  ];

}
