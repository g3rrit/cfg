{ config, pkgs, ... }: {

  # Enable the OpenSSH daemon.
  services.openssh.enable = false;

  # Allow unfree packages like vscode
  nixpkgs.config.allowUnfree = true;

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "uk";
  };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "gb";
    # Enable touchpad support.
    libinput.enable = true;
    xkbOptions = "caps:swapescape";

    desktopManager = {
      xterm.enable = false;
    };
   
    displayManager = {
        defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        i3status # gives you the default i3 status bar
        i3lock #default i3 screen locker
        i3blocks #if you are planning on using i3blocks over i3status
     ];
    };
  };



}


