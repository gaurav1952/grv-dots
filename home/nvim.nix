{ config, ... }:

{
  # xdg.configFile."nvim".source = ../config/nvim;
				
  # xdg.configFile."nvim" = {
  #   source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/grv-dots/config/nvim";
  # };
}
