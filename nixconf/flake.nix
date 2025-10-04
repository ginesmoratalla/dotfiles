{
  description = "ginesmr nix system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
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
  , nixpkgs
  , nixpkgs-stable
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
                host = hosts.darwinhost;
                plataform = system.darwin;
                homebrew-cask = inputs."homebrew-cask";
                homebrew-core = inputs."homebrew-core";
              };
            };
          };
        };
        # nixos here
        nixosConfigurations = {
          nixos = nixpkgs.lib.nixosSystem {
            system = system.nixos;
            modules = [
              home-manager.nixosModules.home-manager {
                home-manager = {
                  useUserPackages = true;
                  useGlobalPkgs = true;
                };
              }
              ./hosts
              ./hosts/nixos/configuration.nix
            ];
            specialArgs = {
              inherit nixpkgs-stable;
              vars = { host = hosts.nixosHost; };
            };
          };
        };
    };
}
