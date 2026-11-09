{ pkgs
, vars
, ...
}:
{
  imports = [
    ../home-manager.nix
  ];

  home-manager = {

    users.${vars.user} = {

      targets.darwin.linkApps.enable = false;
      targets.darwin.copyApps.enable = true;

      imports = [
        ../common
      ];

      home = {
        stateVersion = "25.05";
        packages = with pkgs; [];
      };

    };
  };


}
