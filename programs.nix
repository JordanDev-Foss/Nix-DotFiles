{ pkgs, ... }:
{
    programs = {
    	adb.enable = true;
        zsh.enable = true;
        steam = {
            enable = true;
            remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
            dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
            localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
        };
        gnupg.agent = {
            enable = true;
            pinentryPackage = with pkgs; pinentry-all;
            enableSSHSupport = true;
        };
	gamemode.enable = true;
    };

}
