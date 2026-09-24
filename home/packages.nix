{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    neovim
    vis
    btop
    cava
    yazi
    fastfetch
    libreoffice
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
    inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    hyprpicker
    (tesseract.override {
      enableLanguages = [
        "eng"
        "hin"
      ];
    })
    imagemagick
    zbar
    wf-recorder
    swayosd
    figlet
    gthumb
    vesktop
    gnome-calculator
    tmux
    fuzzel
    pywalfox-native
    gnome-boxes
    steam-run
    jdk25
    polkit_gnome
    scrcpy



  ];
}
