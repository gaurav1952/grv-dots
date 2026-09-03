{ config, ... }:

{
  xdg.configFile."rofi" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/grv-dots/config/rofi";
  };
}
