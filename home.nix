{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.username = "g4ur4v";
  home.homeDirectory = "/home/g4ur4v";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.pywal.enable = true;

  imports = [
    ./home/fish.nix
    ./home/packages.nix
    ./home/kitty.nix
    ./home/nvim.nix
    ./home/direnv.nix
    ./home/fastfetch.nix
    ./home/git.nix
    ./home/vicinae.nix
    ./home/mango.nix
    ./home/noctalia.nix
    ./home/webapp.nix
    ./home/rofi.nix
    ./home/scripts.nix
    ./home/niri.nix

  ];

  home.sessionVariables.NIXOS_OZONE_WL = "1";

  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  dconf.settings."org/gnome/desktop/interface" = {
    cursor-theme = "Bibata-Modern-Classic";
    cursor-size = 24;
  };
}
