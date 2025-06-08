# core.nix
{config, pkgs, inputs, ...}:
{
  #security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
   environment.systemPackages = with pkgs; [
    git
    neovim
    vscodium
    pipewire
    neofetch
    p7zip
    steam-run
    obsidian
    gparted
    kdePackages.polkit-kde-agent-1
    openvpn
    networkmanager-openvpn
  ];

  
}
