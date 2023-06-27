local M = {}

function M.setup()
  require("lualine").setup()
  local navic = require("nvim-navic")

  require("lspconfig").clangd.setup {
      on_attach = function(client, bufnr)
          navic.attach(client, bufnr)
      end
  }
end
return M
