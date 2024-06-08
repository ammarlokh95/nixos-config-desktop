{
  programs.nixvim = {
    globalOpts = {
    # Line numbers
    number = true;
    relativenumber = true;

    # Always show the signcolumn, otherwise text would be shifted when displaying error icons
    signcolumn = "yes";

    # Search
    ignorecase = true;
    smartcase = true;

    # Tab defaults (might get overwritten by an LSP server)
    tabstop = 4;
    shiftwidth = 4;
    softtabstop = 0;
    expandtab = true;
    smarttab = true;
    autoindent = true;
    # System clipboard support, needs xclip/wl-clipboard
    clipboard = "unnamedplus";

    # Highlight the current line
    cursorline = true;

    # Show line and column when searching
    ruler = true;

    # Start scrolling when the cursor is X lines away from the top/bottom
    scrolloff = 8;
  };

  userCommands = {
    Q.command = "q";
    Q.bang = true;
    Wq.command = "q";
    Wq.bang = true;
    WQ.command = "q";
    WQ.bang = true;
    W.command = "q";
    W.bang = true;
  };

  globals.mapleader = " ";

    # autoCmd = [
    #   {
    #     event = [ "BufEnter" "BufWinEnter" ];
    #     pattern = [ "*.md" "*.mdx" ];
    #     command = "MarkdownPreviewToggle";
    #   }
    # ];

    highlight = {
      Comment = {
        fg = "#ff00ff";
        bg = "#000000";
        underline = true;
        bold = true;
      };
    };
  };
}