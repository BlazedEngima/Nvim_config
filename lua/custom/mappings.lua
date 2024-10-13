local M = {}

M.general = {
  n = {
    ["<A-h>"] = {
      function()
        require("nvchad.tabufline").move_buf(-1)
      end,
      "Move buffer left",
    },

    ["<A-l>"] = {
      function()
        require("nvchad.tabufline").move_buf(1)
      end,
      "Move buffer right",
    },

    ["<C-f>"] = {
      "za",
      "Toggle fold",
    },
  }
}

M.lazygit = {
  n = {
    ["<leader>gg"] = {
      "<cmd> LazyGit <CR>",
      "Open LazyGit",
    },
  }
}

M.undotree = {
  n = {
    ["<leader>u"] = {
      "<cmd> UndotreeToggle <CR>",
      "Toggle undo tree",
    }
  }
}

M.harpoon = {
  n = {
    ["<leader>a"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Add file to harpoon",
    },

    ["<C-e>"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "Toggle harpoon menu",
    },

    ["<A-u>"] = {
      function()
        require("harpoon.ui").nav_file(1)
      end,
      "Go to file 1",
    },

    ["<A-n>"] = {
      function()
        require("harpoon.ui").nav_file(2)
      end,
      "Go to file 2",
    },

    ["<A-e>"] = {
      function()
        require("harpoon.ui").nav_file(3)
      end,
      "Go to file 3",
    },

    ["<A-c>"] = {
      function()
        require("harpoon.ui").nav_file(4)
      end,
      "Go to file 4",
    }
  }
}

M.tabufline = {
  n = {
    ["<leader>X"] = {
      function()
        require("nvchad.tabufline").closeAllBufs()
      end,
      "Close all buffers",
    }
  }
}

M.ui = {
  n = {
    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "Toggle transparency",
    },

    ["<leader>ts"] = {
      function()
        require("base46").toggle_theme()
      end,
      "Toggle theme"
    }
  }
}

M.telescope = {
  plugin = true,
  n = {
    ["<leader>fg"] = {
      "<cmd> Telescope git_files <CR>",
      "Find git files",
    },

    ["gr"] = {
      function()
        require("telescope.builtin").lsp_references({ include_current_line = true })
      end,
      "List function references",
    },

    ["gd"] = {
      function ()
        require("telescope.builtin").lsp_definitions()
      end,
      "Go to definition",
    },

    ["<leader>D"] = {
      function ()
        require("telescope.builtin").lsp_type_definitions()
      end,
      "Go to type definition",
    },

    ["<leader>lk"] = {
      function ()
        require("telescope.builtin").keymaps()
      end,
      "List keymaps",
    },

    ["<leader>lc"] = {
      function ()
        require("telescope.builtin").commands()
      end,
      "List available commands",
    },

    ["<leader>lac"] = {
      function ()
        require("telescope.builtin").autocommands()
      end,
      "List available autocommands",
    },

    ["<leader>ml"] = {
      function ()
        require("telescope.builtin").marks()
      end,
      "List vim marks",
    },

    ["<leader>lds"] = {
      function ()
        require("telescope.builtin").lsp_document_symbols()
      end,
      "Lists LSP document symbols in current buffer",
    },

    ["<leader>lws"] = {
      function ()
        require("telescope.builtin").lsp_workspace_symbols()
      end,
      "Lists LSP document symbols in current workspace",
    },

    ["<leader>ldws"] = {
      function ()
        require("telescope.builtin").lsp_dynamic_workspace_symbols()
      end,
      "Dynamically lists LSP document symbols in current workspace",
    },

    ["<leader>lts"] = {
      function ()
        require("telescope.builtin").treesitter()
      end,
      "Lists symbols from treesitter",
    },

    ["<leader>jl"] = {
      function ()
        require("telescope.builtin").jumplist()
      end,
      "Lists jump list entries",
    },

    ["<leader>rl"] = {
      function ()
        require("telescope.builtin").registers()
      end,
      "Lists vim registers",
    },

    ["<leader>ll"] = {
      function ()
        require("telescope.builtin").loclist()
      end,
      "Lists items from the current window's location list",
    },
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    }
  }
}

return M
