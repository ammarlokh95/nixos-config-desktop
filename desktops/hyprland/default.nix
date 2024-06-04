{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rofi-wayland
    dunst
    libnotify
    networkmanagerapplet
    swww
    pipewire
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
  ]; 
}
