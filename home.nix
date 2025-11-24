{ pkgs, lib, config, ... }:

{
	home = {
		username = "dixonj";
		homeDirectory = "/home/dixonj";
		stateVersion = "25.11";
		enableNixpkgsReleaseCheck = false;
		packages = with pkgs; [
			bat
			bottom
			eza
			dysk
			fd
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
			nix-search
			neo
			obs-studio
			oh-my-zsh
			onlyoffice-desktopeditors
			prismlauncher
			protonup-qt
			procs
			qbittorrent
			qtcreator
			ripgrep
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
			xh
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
					ls = "eza --icons -hal";
					cat = "bat";
					update = "nix flake update --flake $HOME/nix-flake; sudo nixos-rebuild switch --flake $HOME/nix-flake --impure";
					find = "fd";
					grep = "rg";
					top = "btm";
					curl = "xh";
					df = "dysk -a";
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
