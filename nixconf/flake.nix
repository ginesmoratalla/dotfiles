{
  description = "ginesmr nix system flake";

  inputs = {
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
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

  outputs =  
  { self
  , nix-darwin
  , home-manager
  , nixpkgs-unstable
  , nix-homebrew
  , flake-utils
  , ... 
  }@inputs:
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
              # home-manager stuff
              home-manager.darwinModules.home-manager
              nix-homebrew.darwinModules.nix-homebrew
              ./hosts
              ./hosts/darwin/configuration.nix
            ];
            specialArgs = {
              inherit self;
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
