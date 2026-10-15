{ pkgs, config, ... }:

{
  xdg.configFile."fish".source = 
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/grv-dots/config/fish";
  

  #pkgs 
  # home.packages = with pkgs; [ fzf ]

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
  xdg.configFile."starship.toml".source = ../config/starship/starship.toml;

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    icons = "auto";
  };
}
