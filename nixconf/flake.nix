{
  description = "ginesmr nix system flake";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";

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
  , ... 
  }@inputs:

    let
      users = {
        darwin = "ginesmoratalla";
        nixos = "ginesmr";
      };

      hosts = {
        macbookHost = "Giness-MacBook-Pro";
      };

    in {

        # Nix Darwin
        darwinConfigurations = {

          # MacBook
          ${hosts.macbookHost} = nix-darwin.lib.darwinSystem {
            modules = [
              home-manager.darwinModules.home-manager
              nix-homebrew.darwinModules.nix-homebrew
              ./home/darwin
              ./hosts/macbook
              ./system/darwin
            ];
            specialArgs = {
              inherit self inputs;
              vars = { user = users.darwin; };
            };
          };

        };

        # nixos here
        nixosConfigurations = {
          nixos = nixpkgs.lib.nixosSystem {
            modules = [
              home-manager.nixosModules.home-manager
              ./hosts
              ./hosts/nixos/configuration.nix
            ];
            specialArgs = {
              inherit nixpkgs-stable;
              vars = { host = users.nixos; };
            };
          };
        };
    };
}
