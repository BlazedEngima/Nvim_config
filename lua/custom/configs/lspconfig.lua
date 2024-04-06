local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false

    if client.server_capabilities.inlayHintProvider then
      vim.g.inlay_hints_visible = true
      vim.lsp.inlay_hint.enable(bufnr, true)
    else
      print("No inlay hints available")
    end

    on_attach(client, bufnr)
  end,

  capabilities = capabilities,
    cmd = {
      "clangd",
      "--offset-encoding=utf-16",
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
}

lspconfig.cmake.setup{}
