{
  programs.nixvim = {
    keymaps = [
    # Neo-tree bindings
    {
      action = "<cmd>Neotree toggle<CR>";
      key = "<leader>e";
    }

    # Telescope bindings

    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>fw";
    }
    {
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader><space>";
    }
    {
      action = "<cmd>Telescope git_commits<CR>";
      key = "<leader>fg";
    }
    {
      action = "<cmd>Telescope oldfiles<CR>";
      key = "<leader>fh";
    }
    {
      action = "<cmd>Telescope colorscheme<CR>";
      key = "<leader>ch";
    }
    {
      action = "<cmd>Telescope man_pages<CR>";
      key = "<leader>fm";
    }

    # Notify bindings

    {
      mode = "n";
      key = "<leader>un";
      action = ''
        <cmd>lua require("notify").dismiss({ silent = true, pending = true })<cr>
      '';
      options = {
        desc = "Dismiss All Notifications";
      };
    }

    # Bufferline bindings

    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }

    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }

    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<cr>";
      options = {
        desc = "Delete buffer";
      };
    }

    # Window management
    {
      mode = "n";
      key = "<leader>wv";
      action = "<C-w>v";
      options = {
        desc = "Split window vertically";
      };
    }
    
    {
      mode = "n";
      key = "<leader>wx";
      action = "<C-w>q";
      options = {
        desc = "close current window ";
      };
    }
    
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options = {
        desc = "Navigate to left window";
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options = {
        desc = "Navigate to right window ";
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options = {
        desc = "Navigate to bottom window";
      };
    }

    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options = {
        desc = "Navigate to top window";
      };
    }

    # ToggleTerm open
    {
      mode = "n";
      key = "<leader>td";
      action = "<cmd>ToggleTerm<cr>";
      options = {
        desc = "Toggle terminal";
      };
    }

    {
      mode = "t";
      key = "jk";
      action = "<C-\\><C-n>";
      options = {
        noremap = true;
        silent = true;
        desc = "jk to escape terminal mode";
      };
    }

    # Jk to escape
    {
      mode = ["n" "i" "v"];
      key = "jk";
      action = "<esc>";
      options = {
        desc = "jk to escpae";
        noremap = true;
      };
    }
  ];
};
}
