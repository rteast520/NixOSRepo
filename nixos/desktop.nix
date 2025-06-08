# desktop.nix

{ pkgs, lib, config, ... }: {

  options = {
    hypr.enable = 
      lib.mkEnableOption "enables hypr";
  };

  config = lib.mkIf config.hypr.enable {
    programs.hyprland.enable = true;
    programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };
  
}
