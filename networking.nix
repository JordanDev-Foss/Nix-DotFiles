{ ... }:
{
	time.timeZone = "America/Chicago";
	networking = {
		hostName = "NixOS";
		networkmanager.enable = true;

		# Configure network proxy if necessary
		#proxy.default = "socks5://localhost:9150";
		#proxy.noProxy = "127.0.0.1,localhost,internal.domain";

		firewall = {
			enable = true;
			allowedTCPPorts = [ 443 9150 ];
			allowedUDPPorts = [9150];
			allowedUDPPortRanges = [
				{ from = 45000; to = 65535; }
			];
		};
	};
}
