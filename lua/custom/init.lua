vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
  callback = function ()
    vim.t.bufs = vim.tbl_filter(function (bufnr)
      return vim.api.nvim_buf_get_option(bufnr, "modified")
    end, vim.t.bufs)
  end,
})

-- Enable folding based on treesitter for specific filetypes
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {"c", "cpp", "rust", "python"},
  callback = function ()
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
  end
})

-- Enable filetype detection, plugins, and indentation
vim.cmd([[
  filetype plugin indent on
  syntax on
]])

vim.opt.foldenable = false
vim.opt.foldnestmax = 7
vim.opt.foldlevel = 7

vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#9DA9A0" })


vim.diagnostic.config({
  float = {
    border = "rounded"
  }
})

