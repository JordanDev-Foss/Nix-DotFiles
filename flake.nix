{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
    	url = "github:nix-community/home-manager/master";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
	url = "github:nix-community/lanzaboote/master";
	inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nixpkgs, home-manager, lanzaboote, ... }: {
    nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem rec {
    system = "x86_64-linux";
    specialArgs = {
	inherit inputs system;
    };
      modules = [
        ./boot.nix
        ./configuration.nix
        ./networking.nix
        ./packages.nix
        ./programs.nix
        ./services.nix
        ./users.nix
	inputs.home-manager.nixosModules.home-manager
	{
		home-manager.useGlobalPkgs = true;
		home-manager.useUserPackages = true;

		home-manager.users.dixonj = import ./home.nix;
	}
	inputs.lanzaboote.nixosModules.lanzaboote

      	];
      };

    };
}
