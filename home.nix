{ pkgs, lib, config, ... }:

{
	home = {
      		username = "dixonj";
      		homeDirectory = "/home/dixonj";
      		stateVersion = "25.11";
		enableNixpkgsReleaseCheck = false;
		packages = with pkgs; [
			bat
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

      	programs = {

      		zsh = {
        		enable = true;
			autocd = true;
			enableCompletion = true;
			autosuggestion.enable = true;
			dotDir = "${config.xdg.configHome}/zsh";

			initContent = ''
			fastfetch
			'';
			shellAliases = {
				gc = "nix-collect-garbage -d && sudo nix-collect-garbage -d";
				ls = "eza --icons";
				cat = "bat";
				update = "sudo nix flake update; sudo nixos-rebuild switch";
			};

			oh-my-zsh = {
				enable = true;
				plugins = [ "git" ];
				theme = "duellj";
			};
		};
			
			git = {
				enable = true;
				userName = "JordanDev-Foss";
				userEmail = "jordandixon@jrips.org";
				extraConfig = {
					init.defaultBranch = "master";
				};

			};
	};

}
