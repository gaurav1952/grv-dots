{ config, ... }:

{
  # xdg.configFile."kitty/kitty.conf".source = ../config/kitty/kitty.conf;
  # home.file."kitty/kitty.conf".source = ../config/kitty/kitty.conf;
  xdg.configFile."fastfetch" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/grv-dots/config/fastfetch";
  };
}
