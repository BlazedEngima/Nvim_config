local M = {}

M.general = {
  n = {
    ["<A-j>"] = {
      function ()
        require("nvchad.tabufline").move_buf(-1)
      end,
      "Move buffer left",
    },

    ["<A-k>"] = {
      function ()
        require("nvchad.tabufline").move_buf(1)
      end,
      "Move buffer right",
    }
  }
}

M.fugitive = {
  n = {
    ["<leader>gs"] = {
      "<cmd> Git <CR>",
      "Open git status",
    }
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
      function ()
        require("harpoon.mark").add_file()
      end,
      "Add file to harpoon",
    },

    ["<C-e>"] = {
      function ()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "Toggle harpoon menu",
    },

    ["<A-u>"] = {
      function ()
        require("harpoon.ui").nav_file(1)
      end,
      "Go to file 1",
    },

    ["<A-n>"] = {
      function ()
        require("harpoon.ui").nav_file(2)
      end,
      "Go to file 2",
    },

    ["<A-e>"] = {
      function ()
        require("harpoon.ui").nav_file(3)
      end,
      "Go to file 3",
    },

    ["<A-c>"] = {
      function ()
        require("harpoon.ui").nav_file(4)
      end,
      "Go to file 4",
    }
  }
}

M.tabufline = {
  n = {
    ["<leader>X"] = {
      function ()
        require("nvchad.tabufline").closeAllBufs()
      end,
      "Close all buffers",
    }
  }
}

M.ui = {
  n = {
    ["<leader>tt"] = {
      function ()
        require("base46").toggle_transparency()
      end,
      "Toggle transparency",
    },

    ["<leader>ts"] = {
      function ()
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
    }
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
