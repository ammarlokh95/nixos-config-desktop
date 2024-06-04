{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local config = {}
      
      -- Font
      config.font = wezterm.font("JetBrainsMonoNerdFont")

      -- To work with hyprland
      config.enable_wayland = false

      -- Theming
      config.window_background_opacity = 0.7
     
      return config
    '';
  };
}
