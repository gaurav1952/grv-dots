{ config, pkgs, ... }:
{
  xdg.desktopEntries = {
    whatsapp = {
      name = "WhatsApp";
      genericName = "Messaging";
      exec = "helium --app=https://web.whatsapp.com/ --ozone-platform=x11 %U";
      icon = "whatsapp";
      categories = [ "Network" "InstantMessaging" ];
      terminal = false;
    };

    youtube-music = {
      name = "YouTube Music";
      genericName = "Music Player";
      exec = "helium --app=https://music.youtube.com/ --ozone-platform=x11 %U";
      icon = "youtube-music";
      categories = [ "AudioVideo" "Audio" ];
      terminal = false;
    };
  };
}
