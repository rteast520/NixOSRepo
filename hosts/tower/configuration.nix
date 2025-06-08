# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../modules/nixos/bundler.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-05f9653a-1a63-43d4-b851-1e8126855d50".device = "/dev/disk/by-uuid/05f9653a-1a63-43d4-b851-1e8126855d50";
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  #Nix Flake enable
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "";

  #set up shell
  #programs.nushell.enable = true;
  users.defaultUserShell = pkgs.nushell;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ry = {
    isNormalUser = true;
    description = "ry";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  #Enable desktop
  #programs.hyprland.enable = true;
  #programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  #Enable program interaction control
  xdg.portal.enable = true;
	
  # gaming settings
  #programs.steam.enable = true;
  #programs.steam.gamescopeSession.enable = true;
  #programs.gamemode.enable = true;

  #program list
  environment.systemPackages = with pkgs; [
  lf
  pkgs.kitty
  pkgs.firefox
  
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  wget
  (pkgs.waybar.overrideAttrs (oldAttrs: {
	mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
	})
)
  ];

  
  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = {inherit inputs;};
    users = {
      "ry" = import ./home.nix;
    };
  };	

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
  #Sound Config
  #sound.enable = true;
  #security.rtkit.enable = true;
  #services.pipewire = {
	#enable = true;
	#alsa.enable = true;
	#alsa.support32Bit = true;
	#pulse.enable = true;
	#jack.enable = true;
	#};

  #gpu management for games etc
  #hardware.opengl = {
   # enable = true;
    #driSupport = true;
    #driSupport32Bit = true;
    #};

  services.xserver.videoDrivers = ["amdgpu"];

  #SystemD services
  systemd.user.services.ry = {
  description = "...";
  serviceConfig.PassEnvironment = "DISPLAY";
  script = ''
    Hyprland
    '';
    wantedBy = [ "multi-user.target" ];
  };

  #usb auto tools
  services.devmon.enable = true;
  services.gvfs.enable = true; 
  services.udisks2.enable = true;

}
