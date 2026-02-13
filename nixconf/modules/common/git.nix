{ config, pkgs, ...}:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "ginesmoratalla";
        email = "ginesmoratalla@gmail.com";
      };
    };
  };
}
