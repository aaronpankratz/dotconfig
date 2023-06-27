local M = {}

function M.setup()
  local whichkey = require "which-key"

  local conf = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
    ["w"] = { "<cmd>update!<CR>", "Save" },
    ["q"] = { "<cmd>q!<CR>", "Quit" },

    b = {
      name = "Buffer",
      c = { "<Cmd>bd!<Cr>", "Close current buffer" },
      D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
    },

    f = {
      name = "Find",
      f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
      b = { "<cmd>FzfLua buffers<cr>", "Buffers" },
      o = { "<cmd>FzfLua oldfiles<cr>", "Old files" },
      g = { "<cmd>FzfLua live_grep<cr>", "Live grep" },
      c = { "<cmd>FzfLua commands<cr>", "Commands" },
      e = { "<cmd>NvimTreeToggle<cr>", "Toggle Explorer" },
      s = { "<cmd>NvimTreeFindFile<cr>", "Show in Explorer" },
    },

    z = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      p = { "<cmd>PackerProfile<cr>", "Profile" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

    G = {
      name = "Git",
      s = { "<cmd>Neogit<CR>", "Status" },
      b = { "<cmd>GitBlameToggle<CR>", "Blame toggle" },
      o = { 
        name = "Open",
        c = { "<cmd>GitBlameOpenCommitURL<CR>", "Open commit URL" },
        f = { "<cmd>GitBlameOpenFileURL<CR>", "Open file URL" },
      },
      c = { "<cmd>GitBlameCopySHA<CR>", "Copy SHA" },
    },
    ["."] = {
      name = "Go-to",
      d = { "Definition" },
      D = { "Declaration" },
      r = { "References" },
      i = { "Implementation" },
    },
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
