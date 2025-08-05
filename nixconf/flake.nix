{
  description = "ginesmr nix system flake";

  inputs = {
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs-unstable";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = { self, nix-darwin, nixpkgs-unstable, nix-homebrew, ... }:
    let

      hosts = {
        darwinHost = "ginesmoratalla";
        nixosHost = "ginesmr";
      };
      currentSystem = "aarch64-darwin";
      sharedModules = import ./modules/default.nix;

    in {
        darwinConfigurations.${hosts.darwinHost} = nix-darwin.lib.darwinSystem {
          system = currentSystem;
          modules = [

            # Set Git commit hash for darwin-version.
            { system.configurationRevision = self.rev or self.dirtyRev or null; }
            ./darwin/configuration.nix
            nix-homebrew.darwinModules.nix-homebrew
            # sharedModules
          ];
          specialArgs = {
            vars = {
              host = hosts.darwinHost;
              plataform = currentSystem;
            };
          };
        };

        /*
        nixosConfigurations = if currentSystem == linuxSystem then {
          hostname = nixpkgs-unstable.lib.nixosSystem {
            system = currentSystem;
            modules = [
              ./nixos/configuration.nix
              # sharedModules 
            ];
          };
        } else {};
        */
    };
}
