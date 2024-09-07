local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

-- clangd setup
lspconfig.clangd.setup({
  on_attach = function(client, bufnr)

    if client.server_capabilities.inlayHintProvider then
      vim.g.inlay_hints_visible = true
      vim.lsp.inlay_hint.enable(true, {bufnr = bufnr})
    else
      print("No inlay hints available")
    end

    -- if client.server_capabilities.codeLensProvider then
    --   vim.g.codelens_visible = true
    --   vim.lsp.codelens.refresh()
    --   vim.api.nvim_create_autocmd({
    --     "BufEnter",
    --     "CursorHold",
    --     "InsertLeave",
    --   },
    --   {
    --     buffer = bufnr,
    --     callback = function()
    --       vim.lsp.codelens.refresh()
    --     end,
    --   })
    -- else
    --   print("No code lens available")
    -- end
    --
    -- on_attach(client, bufnr)
  end,

  capabilities = capabilities,
    cmd = {
      "clangd",
      "--offset-encoding=utf-16",
      "--inlay-hints",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "-j=4",
      "--fallback-style=llvm",
    },
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true,
    },
})

-- Python setup
lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"python"},
})

-- cmake setup
lspconfig.cmake.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
