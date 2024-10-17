local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"
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

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {noremap = true, silent = true, buffer = bufnr, desc = "LSP declaration"})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {noremap = true, silent = true, buffer = bufnr, desc = "LSP hover"})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {noremap = true, silent = true, buffer = bufnr, desc = "LSP implementation"})
    vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, {noremap = true, silent = true, buffer = bufnr, desc = "LSP signature help"})
    vim.keymap.set('n', '<leader>ra', rename.open, {noremap = true, silent = true, buffer = bufnr, desc = "LSP rename"})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {noremap = true, silent = true, buffer = bufnr, desc = "LSP code action"})
    vim.keymap.set('n', '<leader>lf', vim.diagnostic.open_float, {noremap = true, silent = true, buffer = bufnr, desc = "Floating diagnostic"})
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {noremap = true, silent = true, buffer = bufnr, desc = "Goto prev diagnostic"})
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {noremap = true, silent = true, buffer = bufnr, desc = "Goto next diagnostic"})
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {noremap = true, silent = true, buffer = bufnr, desc = "Diagnostic setloclist"})
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, {noremap = true, silent = true, buffer = bufnr, desc = "Add workspace folder"})
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, {noremap = true, silent = true, buffer = bufnr, desc = "Remove workspace folder"})
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, {noremap = true, silent = true, buffer = bufnr, desc = "List workspace folders"})
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

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml", "rust-project.json"),
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      }
    }
  }
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
