{ config, ... }:

{
  wayland.windowManager.mango.enable = true;
  xdg.configFile."mango" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/grv-dots/config/mango";
  };
}
