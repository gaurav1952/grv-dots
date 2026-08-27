{ inputs, ... }:

{
    wayland.windowManager.mango.enable = true;

    xdg.configFile."mango" = {
      source = ../config/mango;
      recursive = true;
     };
}
