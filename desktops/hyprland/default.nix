{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # window picker
    rofi-wayland
    dunst
    # notification manager
    libnotify

    # wifi manager
    networkmanagerapplet

    # screensharing
    pipewire
    wireplumber

    # lock screen
    hyprlock

    # Screenshot
    hyprshot

    # auto mount usb
    udiskie

    # clipboard 
    wl-clipboard
    wl-clipboard-x11
  ];
  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [
          "hyprland"
        ];
        "org.freedesktop.impl.portal.FileChooser" = [
          "gtk"
        ];
      };
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  programs = {
    hyprlock = {
      enable = true;
    };
    
  };

  
  imports = [
    ./config.nix
    ./services.nix
  ]; 
}
