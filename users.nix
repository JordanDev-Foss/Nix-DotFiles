{ lib, pkgs, ... }:

# This file is used for configuring users.
{
	users.users.dixonj = {
		isNormalUser = lib.mkForce true;
		isSystemUser = lib.mkForce false;
		extraGroups = [ "wheel" "ollama" ]; # Enable ‘sudo’ for the user.
		shell = pkgs.zsh;
		packages = with pkgs; [
			eza
			fastfetch
			flatpak
			gimp
			inkscape
			kdePackages.kdeconnect-kde
			kdePackages.kleopatra
			keepassxc
			kitty
			librewolf
			lutris
			nil
			neo
			obs-studio
			oh-my-zsh
			onlyoffice-bin
			protonup-qt
			qbittorrent
			qtcreator
			riseup-vpn
			rustdesk
			signal-desktop
			thunderbird
			tree
			vesktop
			vlc
			wl-clipboard
			zsh
		];
	};
}
