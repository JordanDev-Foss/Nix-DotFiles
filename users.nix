{ lib, pkgs, ... }:

# This file is used for configuring users.
{
	users.users.dixonj = {
		isNormalUser = lib.mkForce true;
		isSystemUser = lib.mkForce false;
		extraGroups = [ "wheel" "ollama" "adbusers" ]; # Enable ‘sudo’ for the user.
		shell = pkgs.zsh;
	};
}
