{ vars, ... }:
{

  # GLOBAL HOME MANAGER CONFIG SHARED ACROSS PLATAFORMS
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit vars; };
    backupFileExtension = "backup";
  };
}
