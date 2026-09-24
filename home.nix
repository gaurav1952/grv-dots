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
  ];
}
