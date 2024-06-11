{pkgs, config, ...}:
{
  protgrams.tmux = {
      enable = true;

      prefix = "C-a";

      plugins = with pkgs; [
        tmuxPlugins.better-mouse-mode
        tmuxPlugins.vim-tmux-navigator
        tmuxPlugins.catppucin
        ];
      extraConfig = ''
          set -g default-terminal "screen-256color"

          unbind C-b
          bind-key C-a send-prefix

          # Mouse on 
          set-option -g mouse on
          
          unbind %
          bind | split-window -h -c "#{pane_current_path}"

          unbind '""'
          bind - split-window -v -c "#{pane_current_path}"
         
          bind -r j resize-pane -D 5
          bind -r k resize-pane -U 5
          bind -r l resize-pane -R 5
          bind -r h resize-pane -L 5

          bind -r m resize-pane -Z

          set -g @catppuccin_flavour 'mocha'
        '';
    };
}
