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
    waybar = {
      enable = true;
    };
    
  };

  
  imports = [
    ./config.nix
    ./services.nix
  ]; 
}
