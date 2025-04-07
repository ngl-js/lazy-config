return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("noice").setup({
      cmdline = {
        enabled = true, -- enables the Noice cmdline UI
        view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
        ---@type table<string, CmdlineFormat>
        format = {
          cmdline = { pattern = "^:", icon = "_", lang = "vim", title = "Do this!" },
        },
      },
      cmdline_popup = {
        backend = "popup",
        relative = "editor",
        focusable = false,
        enter = false,
        zindex = 200,
        position = {
          row = "50%",
          col = "50%",
        },
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    })
  end,
}
