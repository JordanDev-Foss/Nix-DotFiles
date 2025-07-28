{ ... }:

{
	home = {
      		username = "dixonj";
      		homeDirectory = "/home/dixonj";
      		stateVersion = "25.05";
		enableNixpkgsReleaseCheck = false;
		useUserPackages = true;
	};

      	programs = {

      		zsh = {
        		enable = true;
				autocd = true;
				dotDir = ".config/zsh";
				enableCompletion = true;
				autosuggestion.enable = true;

				initContent = ''
					fastfetch
					'';
				shellAliases = {
					gc = "nix-collect-garbage -d && sudo nix-collect-garbage -d";
					update = "sudo nixos-rebuild switch --upgrade";
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
					init.defaultBranch = "main";
					safe.directory = "/etc/nixos";
				};

			};
		};

}
