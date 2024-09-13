local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")
local rename = require('nvchad.renamer')

-- clangd setup
lspconfig.clangd.setup({
  on_attach = function(client, bufnr)

    local bufopts = {noremap = true, silent = true, buffer = bufnr}
    if client.server_capabilities.inlayHintProvider then
      vim.g.inlay_hints_visible = true

      local toggle_inlay_hints = function ()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end

      vim.keymap.set('n', '<leader>ih', toggle_inlay_hints, bufopts)

      vim.lsp.inlay_hint.enable()
    else
      print("No inlay hints available")
    end

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>ra', rename.open, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>lf', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, bufopts)
    vim.keymap.set('n', '<leader>wl', vim.lsp.buf.list_workspace_folders, bufopts)
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
