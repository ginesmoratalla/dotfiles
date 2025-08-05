{
  description = "ginesmr nix system flake";

  inputs = {
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs-unstable";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs-unstable, nix-homebrew, ... }:
    let
      currentSystem = "aarch64-darwin";
      hosts = {
        darwinHost = "ginesmoratalla";
        nixosHost = "ginesmr";
      };
    in {
        darwinConfigurations.${hosts.darwinHost} = nix-darwin.lib.darwinSystem {
          system = currentSystem;
          modules = [
            # Set Git commit hash for darwin-version.
            { system.configurationRevision = self.rev or self.dirtyRev or null; }
            ./modules/shared.nix
            ./darwin/configuration.nix
            nix-homebrew.darwinModules.nix-homebrew
            # darwinHomebrew
          ];
          specialArgs = {
            vars = {
              host = hosts.darwinHost;
              plataform = currentSystem;
              homebrew-cask = inputs."homebrew-cask";
              homebrew-core = inputs."homebrew-core";
            };
          };
        };

        /*
        nixosConfigurations = if currentSystem == linuxSystem then {
          hostname = nixpkgs-unstable.lib.nixosSystem {
            system = currentSystem;
            modules = [
              ./nixos/configuration.nix
            ];
          };
        } else {};
        */
    };
}
