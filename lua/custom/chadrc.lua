---@type ChadrcConfig

local M = {}

M.ui = {
  theme_toggle = { "tokyonight", "palenight", "ayu_dark" },
  theme = "palenight",
  transparency = true,
  statusline = {
    theme = "vscode_colored"
  },
  tabufline = {
    lazyload = true
  }

}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
