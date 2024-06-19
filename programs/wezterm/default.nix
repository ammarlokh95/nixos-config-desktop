{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      -- This will hold the configuration.
      local config = wezterm.config_builder()
      
      -- Font
      config.font = wezterm.font("JetBrainsMonoNerdFont")

      -- To work with hyprland
      config.enable_wayland = false

      -- Theming
      config.color_scheme = "Catppuccin Mocha"
      config.window_background_opacity = 0.4


      -- keys
      local act = wezterm.action
      config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1500 }
      config.keys = {
          {
            key = "|",
            mods = "LEADER|SHIFT",
            action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
          },        
          {
            key = "-",
            mods = "LEADER",
            action = act.SplitVertical { domain = 'CurrentPaneDomain' },
          },
          {
            key = 'h',
            mods = 'LEADER',
            action = act.AdjustPaneSize { 'Left', 5 },
          },
          {
            key = 'j',
            mods = 'LEADER',
            action = act.AdjustPaneSize { 'Down', 5 },
          },
          { key = 'k', mods = 'LEADER', action = act.AdjustPaneSize { 'Up', 5 } },
          {
            key = 'l',
            mods = 'LEADER',
            action = act.AdjustPaneSize { 'Right', 5 },
          },        
          {
            key = 'm',
            mods = 'LEADER',
            action = act.TogglePaneZoomState,
          },
          {
            key = 'h',
            mods = 'CTRL|SHIFT',
            action = act.ActivatePaneDirection 'Left',
          },
          {
            key = 'l',
            mods = 'CTRL|SHIFT',
            action = act.ActivatePaneDirection 'Right',
          },
          {
            key = 'k',
            mods = 'CTRL|SHIFT',
            action = act.ActivatePaneDirection 'Up',
          },
          {
            key = 'j',
            mods = 'CTRL|SHIFT',
            action = act.ActivatePaneDirection 'Down',
          },
      }

      config.mouse_bindings = {
        -- Ctrl-click will open the link under the mouse cursor
        {
          event = { Up = { streak = 1, button = 'Left' } },
          mods = 'CTRL',
          action = wezterm.action.OpenLinkAtMouseCursor,
        },
      }
      return config
      '';
  };
}
