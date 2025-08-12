{ pkgs, ... }:
{
    # Configure Flatpak repo
    systemd.services.flatpak-repo = {
        wantedBy = [ "multi-user.target" ];
        path = [ pkgs.flatpak ];
        script = ''
            flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        '';
    };
    systemd.settings.Manager = {
        DefaultTimeoutStopSec = "10s";
    };
    services = {
        journald.extraConfig = "SystemMaxUse=100M";
        xserver.enable = false;
	xserver.videoDrivers = ["amdgpu"];
        displayManager.sddm.enable = true;
        desktopManager.plasma6.enable = true;
        displayManager.defaultSession = "plasma";
        displayManager.sddm.wayland.enable = true;
        flatpak.enable = true;
        pulseaudio.enable = false;
        printing.enable = true;
        libinput.enable = false;
        openssh.enable = false;
        pipewire = {
            enable = true;
            pulse.enable = true;
        };
        ollama = {
            enable = true;
            acceleration="rocm";
        };
        syncthing = {
            enable = true;
            openDefaultPorts = true;
            guiAddress = "0.0.0.0:8384";
            user = "dixonj";
	    dataDir = "/home/dixonj/Documents";    # Default folder for new synced folders
            configDir = "/home/dixonj/.config/syncthing";
        };
    };
}

