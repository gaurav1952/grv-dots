# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "t14-nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable blutooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Setting up power management
  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    settings = {

      # CPU_SCALING_GOVERNOR_ON_AC = "performance";
      # CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      #
      # CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      # CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      #
      # CPU_MIN_PERF_ON_AC = 0;
      # CPU_MAX_PERF_ON_AC = 100;
      # CPU_MIN_PERF_ON_BAT = 0;
      # CPU_MAX_PERF_ON_BAT = 20;

      START_CHARGE_THRESH_BAT0 = 70;
      STOP_CHARGE_THRESH_BAT0 = 79;
    };
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # services.displayManager.sddm.extraPackages = with pkgs; [
  #   gst_all_1.gstreamer
  #   gst_all_1.gst-plugins-base
  #   # Specialized plugins separated by quality
  #   gst_all_1.gst-plugins-good
  #   gst_all_1.gst-plugins-bad
  #   gst_all_1.gst-plugins-ugly
  # ];

  # #Lock Screen theme
  # programs.qylock = {
  #   enable = true;
  #   theme = "pixel-munchlax";
  # };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };
  xdg.portal.wlr.settings = {
    screencast = {
      chooser_type = "dmenu";
      chooser_cmd = "${pkgs.rofi}/bin/rofi -dmenu";
    };
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  #
  #
  # Gvfs support
  services.gvfs.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.trusted-users = [
    "root"
    "g4ur4v"
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."g4ur4v" = {
    isNormalUser = true;
    description = "g4ur4v";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
    packages = with pkgs; [
      kdePackages.kate
      #  thunderbird
    ];
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install firefox.
  programs.firefox.enable = true;
  programs.fish.enable = true;
  programs.mango.enable = true;
  programs.kdeconnect.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    papirus-icon-theme
    papirus-folders
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    gcc
    ripgrep
    fd
    fzf
    jq
    tree
    curl
    pkgs.ghostty
    zoom-us
    quickshell
    ffmpeg
    ffmpegthumbnailer
    nwg-look
    adw-gtk3

    # system Utilites
    file
    which
    unzip
    zip

    # WM packages
    satty
    grim
    slurp
    brightnessctl
    rofi
    nautilus
    matugen
    wvkbd
    nil
    nixd
    vscodium

  ];

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
  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      } # KDE Connect
    ];
    allowedUDPPortRanges = [
      {
        from = 1714;
        to = 1764;
      } # KDE Connect
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
