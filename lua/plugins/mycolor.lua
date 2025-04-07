return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
        contrast = "", -- can be "hard", "soft" or empty string
        overrides = {
          Identifier = { fg = "#f3b354" },
          Function = { fg = "#e77f2a" },
          Constant = { fg = "#c46602", bold = true, italic = true },
          String = { fg = "#e49e35", italic = false },
          Boolean = { fg = "#37c479", bold = true, link = nil, underline = true },
          Number = { fg = "#58b6ae" },
          NoiceCmdlinePopupBorder = { fg = "#e37e0b" },
          TelescopeBorder = { fg = "#e37e0b" },
          TelescopePromptBorder = { fg = "#e37e0b" },
          ["@keyword.import"] = { fg = "#d13d3d" },
          ["@keyword.operator"] = { fg = "#df6c36" },
          ["@keyword.conditional"] = { fg = "#df6c36" },
          Conditional = { fg = "#df6c36" },
          Operator = { fg = "#eb5426", italic = true, nocombine = false, underdotted = true },
          Directory = { fg = "#c9e31b" },
          Title = { fg = "#c9e31b" },
          ["@variable"] = { fg = "#d1b608" },
          ["@comment"] = { fg = "#997f63" },
          CursorLine = { bg = "#1d1d1d" },
          Folded = { fg = "#df6000" },
          SnacksPickerGitStatusUntracked = { fg = "#eb7444" },
          SnacksPickerGitStatusIgnored = { fg = "#797d7a" },
          SnacksPickerGitStatusAdded = { fg = "#40da6f" },
          GitSignsAdd = { fg = "#40da6f" },
          GitSignsChange = { fg = "#d2d640" },
          GitSignsDelete = { fg = "#d1121b" },
          GitSignsUntracket = { fg = "#b7e6d3" },
        },
        transparent_mode = true,
      })

      vim.cmd([[colorscheme gruvbox]])
    end,
  },
}
