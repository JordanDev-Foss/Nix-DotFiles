{ ... }:
{
    time.timeZone = "America/Chicago";
    networking = {
        hostName = "NixOS";
        networkmanager.enable = true;

        # Configure network proxy if necessary
        # proxy.default = "http://user:password@proxy:port/";
        # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

        firewall = {
            enable = true;
            allowedTCPPorts = [ 443 ];
            allowedUDPPortRanges = [
                { from = 45000; to = 65535; }
            ];
        };
    };
}
