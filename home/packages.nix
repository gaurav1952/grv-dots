{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    neovim
    btop
    cava
    fastfetch
    onlyoffice-desktopeditors
    zed-editor
    snapshot
    obs-studio
    kdePackages.kdenlive
    brave
    gimp
    mpv
    file-roller
    wl-clipboard
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    hyprpicker
    (tesseract.override {
      enableLanguages = [
        "eng"
        "hin"
      ];
    })
    imagemagick
    yad
    libnotify
    zbar
    wf-recorder
    swayosd
    figlet
    gthumb
    vesktop
    gnome-calculator
    gnome-calendar
    tmux
    pywalfox-native
    gnome-boxes
    steam-run
    jdk25
    polkit_gnome
    scrcpy
    gnome-disk-utility
    pavucontrol
    obsidian
    tldr
    papirus-folders
    papirus-icon-theme
    librewolf-bin
    gedit
    lazygit
    fd
    fzf
    jq
    tree
    curl
    ghostty
    zoom-us
    quickshell
    ffmpeg
    file
    which
    unzip
    zip
    satty
    grim
    slurp
    brightnessctl
    rofi
    matugen
    wvkbd
    nil
    nixd
    vscodium
    dgop





  ];
}
