return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    delay = 500,
    layout = { align = "center" },
    plugins = {
      spelling = {
        enabled = false,
      },
    },
    win = { col = 0.5 },
  },
}
