{ pkgs, ... }:
{
	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;
	fonts.packages = with pkgs; [
		corefonts
		vistafonts
	];

	environment.systemPackages = with pkgs; [
		cmake
		git
		gnupg
		neovim
		wimlib
		wget
	];
	hardware.graphics.extraPackages = with pkgs; [ 
		rocmPackages.clr.icd
		rocmPackages.tensile
	];
	environment.plasma6.excludePackages = with pkgs.kdePackages; [
		plasma-browser-integration
		konsole
		elisa
	];
}
