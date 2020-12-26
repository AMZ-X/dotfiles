# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  ## Boot
  boot = {
    # EFI boot loader
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # Linux kernel
    kernelPackages = pkgs.linuxPackages_latest;
  };

  ## Networking
  networking.hostName = "AMZ-Linux";

  ## Sound
  sound.enable = true;

  ## Date & Time / Locale

  # Set your time zone.
  time.timeZone = "Africa/Johannesburg";

  # Internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  # networking.useDHCP = false;
  # networking.interfaces.enp3s0f3u2.useDHCP = true;
  # networking.interfaces.wlp1s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  
  ## Services
  services = {
    # X11 
    xserver = {
      # Enable X11
      enable = true;

      # Keyboard layout
      layout = "us";
      xkbOptions = "eurosign:e";

      # Enable touchpad support
      libinput.enable = true;

      # AMD GPU drivers
      videoDrivers = [ "amdgpu" ];

      # Desktop Manager - Pantheon DE
      desktopManager = {
        xterm.enable = false;
        pantheon.enable = true;
      };

      # Display Manager - LightDM Pantheon
      displayManager = {
        lightdm.enable = true;
        lightdm.greeters.pantheon.enable = true;
      };
    };

    # Pantheon DE applications
    pantheon.apps.enable = true;

    # Flatpak
    flatpak.enable = true;

    # Printing
    # printing.enable = true;
  };

  ## Hardware
  hardware = {
    
    # Pulseaudio
    pulseaudio = {
      enable = true;
      support32Bit = true;
    };

    # OpenGL 32-bit support
    opengl = {
      driSupport32Bit = true;
      extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
    };
  };

  ## XDG
  xdg.portal.enable = true; 

  ## User Account
  programs.zsh.enable = true;
  users.users.amz = {
    isNormalUser = true;
    home = "/home/amz";
    description = "AMZ-X";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };

  # Allow non-free packages
  nixpkgs.config.allowUnfree = true;

  # Environment
  environment = {

    # Exclude specific Pantheon DE applications
    pantheon.excludePackages = with pkgs; [
      pantheon.elementary-code
      gnome3.geary
    ];

    # System packages
    systemPackages = with pkgs; [
      # utilities
      ansible
      git
      wget      
      # shell & plugin manager
      antibody
      oh-my-zsh
      zsh
      zsh-nix-shell
      # gpu drivers
      mesa
      # applications
      anydesk
      bitwarden
      dbeaver
      discord
      firefox
      flatpak
      google-chrome
      mailspring
      slack
      simplenote
      steam
      vscode
      zoom-us
      # developer tools
      direnv
      nix-direnv
      docker
      docker-compose
      # other
      dconf
      gnome3.dconf-editor
    ];

    # direnv
    pathsToLink = [
      "/share/nix-direnv"
    ];
  };

  # Nix options for derivations to persist garbage collection
  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';

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


  ## Virtualization

  # Docker
  virtualisation.docker.enable = true;

  ## System

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).

  system = {
    # State version
    stateVersion = "20.09";

    # Automatic updates
    autoUpgrade.enable = true;
    autoUpgrade.allowReboot = true;
  };
}

