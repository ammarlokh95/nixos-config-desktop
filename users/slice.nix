{ pkgs, lib, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ../programs
    ../desktops/hyprland
  ];

  home = {
    username = "slice";
    homeDirectory = "/home/slice";
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "23.11"; # Please read the comment before changing.
    

    packages = with pkgs; [
      # misc
    arkpandora_ttf
      brave
      discord
      doublecmd
      gimp
      ripgrep
      (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      unzip
      obsidian
      # Audio control
      pavucontrol
      #utils
      busybox
      gwenview
      btop
      vlc
      gzip

      # Neve - neovim
      inputs.Neve.packages.${pkgs.system}.default  
      # Programming languages:
      zig
      go
      rustup
      nodejs_22
      python312
    ];
    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file."./.config/" = {
      source = ../dotfiles;
      recursive = true;
    };

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;
  
  programs = {
    bat = {
      enable = true;
    };
    eza = {
      enable = true;
      enableZshIntegration = true;
      git = true;
      icons = true;
    };

    fd = {
      enable = true;
      hidden = true;
      ignores = [
        ".git/"
        "node_modules/"
      ];
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
      changeDirWidgetCommand = "fd --type d";
      fileWidgetCommand = "fd --type f";
    };

    gh = {
      enable = true;
    };

    git = {
      enable = true;
      userName = "ammarlokh95";
      userEmail = "ammar.lokh1234@gmail.com";
    };

    go = {
      enable = true;
      goBin = ".local/bin/bin.go";
      goPath = ".local/go";
    };

    jq = {
      enable = true;
    };

    lazygit = {
      enable = true;
    };

    nix-index = {
      enable = true;
    };

    yazi = {
      enable = true;
      enableZshIntegration = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting = {
        enable = true;
        highlighters = [
        "main"
        "brackets"
        "pattern"
        "regexp"
        "cursor"
        "root"
        "line"
        ];
      };
      shellAliases = {
        cd = "z";
        };
      initExtra = ''
        echo ".zshrc ran"
      '';
    };
  };
}
