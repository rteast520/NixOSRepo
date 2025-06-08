{config, pkgs, inputs, ...}:

{

    programs.hyprland.enable = true;
    programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    programs.thunar.enable = true;
    programs.xfconf.enable = true;
    programs.thunar.plugins = with pkgs.xfce; [
        thunar-volman
        thunar-archive-plugin
    ];

    environment.systemPackages = with pkgs; [
        pkgs.waybar
	    pkgs.ironbar
        pkgs.dunst
        pkgs.libnotify
        pkgs.xdg-desktop-portal-gtk
        hyprpolkitagent
        pkgs.swww
        rofi-wayland
        pkgs.networkmanagerapplet
        nm-connection-editor
        libsForQt5.qt5ct
        #pkgs.qt5ct
        pkgs.qt6ct
        kdePackages.polkit-kde-agent-1
	    hyprshot
        swaynotificationcenter
        hypridle
        hyprlock
        hyprsysteminfo
        #(import (pkgs.callPackage (pkgs.fetchFromGitHub {
        #   owner = "MalpenZibo";
        #    repo = "ashell";
        #    rev = "0.4.1"; # Or specify the branch/tag you need
        #    sha256 = "sha256-1jf17d7ji6jqac85dwl9q6gi8dc7ydssd0739g1zc11sj47gn1dl="; # Replace with the correct hash
        #}) {}).defaultPackage.x86_64-linux)
    ];
    #environment.systemPackages = with pkgs; [
    #(import (pkgs.callPackage (pkgs.fetchFromGitHub {
      #owner = "MalpenZibo";
      #repo = "ashell";
      #rev = "refs/heads/main"; # Or specify the branch/tag you need
     # sha256 = "8107a567517b7adff642b070aef862d0aab23e83"; # Replace with the correct hash
    #}) {}).defaultPackage.x86_64-linux)
    #];
}
