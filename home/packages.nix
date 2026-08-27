{ pkgs,inputs, ...}:
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

    pkgs.wl-clipboard
    pkgs.vivaldi
    pkgs.nwg-look
    inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    papirus-folders
    papirus-icon-theme
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
	];
}
