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

		#displayManager.sddm = {
		#	enable = true;
		#	wayland.enable = true; # Ensure Wayland support is enabled
		#	theme = "sddm-astronaut-theme"; # This should match the theme name
		#	settings = {
		#		Theme = {
		#			Current = "sddm-astronaut-theme"; # Set the current theme
		#		};
		#	};
		#};
		greetd = {
			enable = true;
			settings = {
				default_session = {
					command = "${pkgs.tuigreet}/bin/tuigreet --time --asterisks --greeting \"== Anomalous Research and Containment Unit (ARCU) Secure Access Portal ==\nThis computer system is for authorized use only. Unauthorized access or use of this system is strictly prohibited and will be addressed to the fullest extent of applicable laws. All activities may be monitored and recorded. By continuing, you acknowledge and consent to these terms.\" --cmd startplasma-wayland";
					user = "greeter";
				};
			};
		};

		desktopManager.plasma6.enable = true; # Enable Plasma 6 desktop
		displayManager.defaultSession = "plasma"; # Set default session to Plasma
		flatpak.enable = true; # Enable Flatpak support
		pulseaudio.enable = false; # Disable PulseAudio
		printing.enable = true; # Enable printing support
		libinput.enable = false; # Disable libinput
		pipewire = {
			enable = true; # Enable PipeWire
			pulse.enable = true; # Enable PulseAudio support in PipeWire
		};
		ollama = {
			enable = true;
			#acceleration = "rocm"; # Set acceleration method
		};
		syncthing = {
			enable = true;
			openDefaultPorts = true; # Open default ports for Syncthing
			guiAddress = "0.0.0.0:8384"; # Set GUI address
			user = "dixonj"; # Set user for Syncthing
			dataDir = "/home/dixonj/Documents"; # Default folder for new synced folders
			configDir = "/home/dixonj/.config/syncthing"; # Config directory for Syncthing
		};
	};
}
