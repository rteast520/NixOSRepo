# binary.nix
{config, pkgs, ...}:
{
    programs.nix-ld.enable = true;
    programs.ssh.startAgent = true;
    programs.nix-ld.libraries = with pkgs; [
        # add missing dynamic libraries here
        # NOT in evirement.system packages
    ];
    environment.systemPackages = with pkgs; [
	unar
    ];
}
