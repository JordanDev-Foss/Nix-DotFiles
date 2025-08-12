{
  description = "A very basic flake";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/932868d5726c38c5015aa281e0759593663ab39c"; # Pin to a specific commit
    nixpkgs.url = "github:nixos/nixpkgs"; # Pin to a specific commit
    home-manager = {
    	url = "github:nix-community/home-manager/master";
      	inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
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
