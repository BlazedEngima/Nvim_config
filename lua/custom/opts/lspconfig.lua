local ret = {
  diagnostics = {
    underline = true,
    update_in_insert = false,
    virtual_text = {
      spacing = 4,
      source = "if_many",
      prefix = "●",
    },
  },

  inlay_hints = {
    enabled = true,
    exclude = {"python"},
  },

  code_lens = {
    enabled = false,
  },

  servers = {
    lua_ls = {
      settings = {
        Lua = {
          codeLens = {
            enable = true,
          },

          completion = {
            callSnippet = "Replace",
          },

          hint = {
            enable = true,
            setType = false,
            paramType = true,
            paramName = "Disable",
          },
        },
      },
    },
  },
}

return ret
