{config, pkgs, inputs, ...}:
{
	environment.systemPackages = with pkgs; [
		starship
		eza
		nushell
		du-dust
		bat
		zellij
		ripgrep
		#ytui-music
		speedtest-rs
		wiki-tui
		#ytermusic

	];

}
