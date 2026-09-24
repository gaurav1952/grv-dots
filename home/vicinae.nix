{ pkgs, ... }:

{

  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
    };
    settings = {
          tray.enabled = false;
        };
  };
}
