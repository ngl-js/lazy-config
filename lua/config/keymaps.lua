local M = {}

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

function M.setup()
  M.general()
  M.movements()
end

function M.general()
  vim.g.mapleader = " "
  keymap.set("n", "=ap", "ma=ap'a")
  -- Join in line
  keymap.set("n", "J", "mzJ`z")
  -- Select all
  keymap.set("n", "<C-a>", "gg<S-v>G")
  -- Close all buffers tabs
  keymap.set("n", "<leader>Q", ":%bd|e#<cr>", { desc = "Close all other buffers" })
  -- Split window
  keymap.set("n", "sh", ":split<cr>", opts)
  keymap.set("n", "sv", ":vsplit<cr>", opts)
  -- Terminal
  keymap.set("n", "<C-p>", "<cmd>terminal<cr>", opts)
end

function M.movements()
  keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", opts)
  keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", opts)
end

M.setup()
