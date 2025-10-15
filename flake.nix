{
  description = "A very basic flake";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/0bcf98ab2f6f8dd664d7ea19b09bef80f1e1d044"; # Pin to a specific commit
    nixpkgs.url = "github:nixos/nixpkgs/master";
    home-manager = {
    	url = "github:nix-community/home-manager/master";
      	inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
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
	home-manager.nixosModules.home-manager
	{
		home-manager.useGlobalPkgs = true;
		home-manager.useUserPackages = true;

		home-manager.users.dixonj = import ./home.nix;
	}

      	];
      };

    };
}
