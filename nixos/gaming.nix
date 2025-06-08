#gaming.nix


{config, pkgs, ... }: {

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    lutris
    bottles
    steam
    mangohud
    gamemode
    discord
    melonDS
    discordo
    ungoogled-chromium
    protontricks
    winetricks
    steamtinkerlaunch
  ];
  

  
}

