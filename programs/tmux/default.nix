{pkgs, config, ...}:
{
  programs.tmux = {
      enable = true;

      plugins = with pkgs; [
        tmuxPlugins.better-mouse-mode
        tmuxPlugins.vim-tmux-navigator
        tmuxPlugins.catppuccin
        tmuxPlugins.tmux-resurrect
        tmuxPlugins.tmux-continuum
        ];
      extraConfig = ''
          set -g default-terminal "screen-256color"
          
          set -g prefix C-a
          unbind C-b
          bind-key C-a send-prefix

          # Mouse on 
          set-option -g mouse on
          
          unbind %
          bind | split-window -h -c "#{pane_current_path}"

          unbind '"'
          bind - split-window -v -c "#{pane_current_path}"
         
          bind -r j resize-pane -D 5
          bind -r k resize-pane -U 5
          bind -r l resize-pane -R 5
          bind -r h resize-pane -L 5

          bind -r m resize-pane -Z
          
          set-window-option -g mode-keys vi
          
          bind-key -T copy-mode-vi 'v' send -X begin-selection
          bind-key -T copy-mode-vi 'y' send -X copy-selection

          unbind -T copy-mode-vi MouseDragEnd1Pane
          
          set -g @resurrect-capture-pane-contents 'on'
          set -g @continuum-restore 'on'

          set -g @catppuccin_flavour 'mocha'
        '';
    };
}
