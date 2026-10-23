{
  config,
  pkgs,
  inputs,
  ...
}:

let
  sddmTheme = pkgs.sddm-astronaut.override {
    embeddedTheme = "pixel_sakura";
  };
in
{
  imports = [
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

  networking.networkmanager.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  time.timeZone = "Asia/Kolkata";
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
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  nix.optimise.automatic = true;

  boot.loader.systemd-boot.configurationLimit = 19;

  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT0 = 70;
      STOP_CHARGE_THRESH_BAT0 = 79;
    };
  };

  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm = {
    enable = true;
    # wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    theme = "sddm-astronaut-theme";
    extraPackages = with pkgs; [ sddm-astronaut];
  };
  # services.desktopManager.plasma6.enable = false;
  services.desktopManager.cosmic.enable = true;


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

  services.libinput.enable = true;

  services.gvfs.enable = true;
  services.tumbler.enable = true;



  services.playit = {
    enable  = true;
    secretPath = "/etc/playit/secret.toml";
  };

  # services.fprintd.enable = true;
  # security.pam.services = {
  #   sudo.fprintAuth = true;
  #   polkit1.fprintAuth = true;
  #   login.fprintAuth = true;
  #   sddm.enableGnomeKeyring = true;
  #   sddm.fprintAuth = false;
  #   sddm-greeter.fprintAuth = false;
  #   sddm-autologin.fprintAuth = false;
  # };

  services.flatpak.enable = true;
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

    # packages = with pkgs; [
    #   kdePackages.kate
    #   #  thunderbird
    # ];
  };
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;  # USB passthrough (Optional)

  programs.dconf.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    gcc
    ripgrep
    nwg-look
    adw-gtk3
    appimage-run
    ffmpegthumbnailer # video thumbnails
    poppler-utils # PDF thumbnails
    nautilus
    webp-pixbuf-loader # webp thumbnails in GTK
    gnome-epub-thumbnailer # optional, epub covers
    sddmTheme

  ];

  programs.firefox = {
    enable = true;
  };

  programs.fish = {
    enable = true;
  };

  programs.mango = {
    enable = true;
  };
  programs.seahorse.enable = true;

  programs.kdeconnect = {
    enable = true;
  };
  programs.xfconf.enable = true;



  # programs.nix-ld.enable = true;
  # programs.nix-ld.libraries = with pkgs; [
  # ];



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
  system.stateVersion = "26.05";

}
