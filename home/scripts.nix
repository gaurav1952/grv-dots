{ config, ... }:
{
  xdg.dataFile."bin".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/grv-dots/config/scripts";

  home.sessionPath = [
    "${config.xdg.dataHome}/bin"
  ];
}
