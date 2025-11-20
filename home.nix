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
			flutter
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
			onlyoffice-desktopeditors
			prismlauncher
			protonup-qt
			qbittorrent
			qtcreator
			riseup-vpn
			rustdesk
			signal-desktop
			tealdeer
			tuigreet
			thunderbird
			tree
			vesktop
			vlc
			vscodium
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
				cat ~/nix-flake/ascii.txt
				fastfetch -c examples/2.jsonc
				'';
				shellAliases = {
					gc = "nix-collect-garbage -d && sudo nix-collect-garbage -d";
					ls = "eza --icons";
					cat = "bat";
					update = "sudo nixos-rebuild switch --flake /home/dixonj/nix-flake/ --impure";
				};

				oh-my-zsh = {
					enable = true;
					plugins = [ "git" ];
					theme = "duellj";
				};
			};
			
			git = {
				enable = true;
				settings = {
					user.name = "JordanDev-Foss";
					user.email = "jordandixon@jrips.org";
					extraConfig = {
						init.defaultBranch = "master";
					};
				};

			};
			kitty = {
				enable = true;
				font.name = "FiraCode Nerd Font Mono";
				font.package = pkgs.nerd-fonts.fira-code;
				font.size = 12;

			};
	};

}
