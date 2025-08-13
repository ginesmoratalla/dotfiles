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

  outputs = inputs @ 
  { self
  , nix-darwin
  , nixpkgs-unstable
  , nix-homebrew
  , flake-utils
  , ... 
  }:
    let
      hosts = {
        darwinHost = "ginesmoratalla";
        nixosHost = "ginesmr";
      };
      system = {
        darwin = "aarch64-darwin";
        nixos = "x86_64-linux";
      };
    in {
        darwinConfigurations = {
          ${hosts.darwinHost} = nix-darwin.lib.darwinSystem {
            system = system.darwin;
            modules = [
              # Set Git commit hash for darwin-version.
              { system.configurationRevision = self.rev or self.dirtyRev or null; }
              nix-homebrew.darwinModules.nix-homebrew
              ./shared
              ./darwin/configuration.nix
            ];
            specialArgs = {
              vars = {
                host = hosts.darwinHost;
                plataform = system.darwin;
                homebrew-cask = inputs."homebrew-cask";
                homebrew-core = inputs."homebrew-core";
              };
            };
          };
        };
        # nixos here
    };
}
