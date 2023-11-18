---@type ChadrcConfig

local M = {}

M.ui = {
  theme_toggle = { "palenight", "catppuccin" },
  theme = "palenight",
}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
