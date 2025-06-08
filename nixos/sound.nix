#sound.nix
{config, pkgs, ...}:
{
    environment.systemPackages = with pkgs; [
      pipewire
    ];

    services.pipewire = {
    enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
