{ pkgs, ... }:
{
	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;
	fonts.packages = with pkgs; [
		corefonts
		vistafonts
	];
	environment.systemPackages = with pkgs; [
		arti
		cmake
		git
		gnupg
		kdePackages.full
	kdePackages.qtmultimedia
	kdePackages.qtsvg
		kdePackages.qtvirtualkeyboard
	neovim
	rocmPackages.tensile
	sddm-sugar-dark
	sddm-astronaut
		wimlib
		wget
	];
	environment.plasma6.excludePackages = with pkgs.kdePackages; [
		plasma-browser-integration
		konsole
	elisa
	];
}
