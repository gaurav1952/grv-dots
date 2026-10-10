{ config, ... }:

  let
    browser = "brave";

    iconDir = "${config.home.homeDirectory}/.icons";

    mkWebApp = {name, genericName, url, icon, categories}: {
     inherit name genericName categories;

     exec = "${browser} --app=${url} --ozone-platform=x11 %U";
     icon = "${iconDir}/${icon}.png";
     terminal = false;
    };
  in
{
   xdg.desktopEntries = {
    whatsapp = mkWebApp {
      name = "Whatsapp";
      genericName = "Messeging";
      url = "https://web.whatsapp.com/";
      icon = "whatsapp";
      categories = ["Network" "InstantMessaging"];
    };
   };
}
