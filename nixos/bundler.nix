{ config, pkgs, ...}:

{

    imports = [
        ./binary.nix
        ./core.nix
        ./sound.nix
        ./gaming.nix
	./hyper.nix
	./fonts.nix
	./oxidise.nix
    ];
}
