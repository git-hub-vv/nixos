{ inputs, ... }:
{

  imports = [
    ./bufferline.nix 
  ];
    
  plugins = {
    lualine.enable = true;
    treesitter.enable = true;

    # file browser
    oil = {
      enable = true;
      settings = {
        view_options.show_hidden = true;
      };
    };

    #language servers
    lsp = {
      enable = true;
      servers = {
        ts-ls.enable = true;  # javascript / typescript
        lua-ls.enable = true;  # lua
        rust-analyzer = { #rust
          enable = true;
          installRustc = true;
          installCargo = true; 
        };
        zls.enable = true; # zig
      };
    };

    zig = {
      enable = true;
      autoLoad = true;
    };

    # completion
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
        ];
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-e>" = "cmp.mapping.close()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
      };
    };

    # tree file browser
    nvim-tree = {
      enable = true;
      autoLoad = true;
      openOnSetup = true;
      openOnSetupFile = true;
      autoClose = true;
    };

    # obsidian.nvim 
      # set up later
  };

  keymaps = [
    {
      mode = "t";
      action = "<C-\\><C-n>";
      key = "<Esc><Esc>";
      options.silent = true;
      options.noremap = true;
    }
  ];

  
  #colorschemes.gruvbox.enable = true;
  
  opts = {
    number = true; # display line numbers

    # tab indenting
    tabstop = 2;  # number of columns between two tab stops
    shiftwidth = 0;  # how tabs are displayed 0 means use tabstop value
    expandtab = true;  # uses spaces instead of tab-indents
    smartindent = true;  # tries to indent automatically

    # search
    ignorecase = true;
    smartcase = true;  # dont ignore when i search for upper case

    # fold
    foldmethod = "indent";
    foldlevel = 99;  # doesnt fold by default

    # visuals
    termguicolors = true;  # enables 24bit color

    # other
    cursorline = true;  # highlights line cursor is in
    scrolloff = 8;  # when less lines are left below or above the cursor it scrolls
    wrap = false;  # wrapping lines
    sidescrolloff = 8;  # like scrolloff
      

  };
}
