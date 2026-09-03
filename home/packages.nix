{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    neovim
    btop
    yazi
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
    inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    hyprpicker
    tesseract
    imagemagick
    zbar
    wf-recorder
    swayosd
    figlet
    pkgs.gthumb
    vesktop
    gnome-calculator
    tmux
    fuzzel
    pywalfox-native
    librewolf

  ];
}
