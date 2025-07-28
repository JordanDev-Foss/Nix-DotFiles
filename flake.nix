{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/932868d5726c38c5015aa281e0759593663ab39c"; # Pin to a specific commit
    home-manager.url = "github:nix-community/home-manager"; # Add Home Manager as an input
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # Make Home Manager follow the same nixpkgs input
  };

  outputs = { self, nixpkgs, home-manager }: { # Include home-manager in the outputs
    nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
      modules = [
        ./boot.nix
        ./configuration.nix
        ./networking.nix
        ./packages.nix
        ./programs.nix
        ./services.nix
        ./users.nix
        home-manager.nixosModules.home-manager # Include Home Manager module
      ];
    };

    homeConfigurations = { # Move homeConfigurations inside outputs
      dixonj = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.pkgs; # Use the same nixpkgs
        modules = [ ./home.nix ]; # Your Home Manager configuration file
      };
    };
  };
}

