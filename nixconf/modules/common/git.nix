{ config, pkgs, ...}:
{
  programs.git = {
    enable = true;
    userName = "ginesmoratalla";
    userEmail = "ginesmoratalla@gmail.com";
  };
}
