return {
  "lewis6991/gitsigns.nvim",
  name = "gitsigns.nvim",
  priority = 1000,
  config = function()
    local gitsigns = require("gitsigns")

    gitsigns.setup({
      signs_staged_enable = true,
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        follow_files = true,
      },
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "overlay", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
      },
      current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      on_attach = function(bufnr)
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        -- Actions
        map("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "Reset hunk" })
        map("n", "<leader>ga", gitsigns.stage_buffer, { desc = "Add buffer to stage" })
        map("n", "<leader>gr", gitsigns.reset_buffer, { desc = "Reset buffer" })
        map("n", "<leader>ghp", gitsigns.preview_hunk_inline, { desc = "Preview hunk" })
        map("n", "<leader>gi", gitsigns.toggle_current_line_blame, { desc = "Inline blame" })
      end,
    })
  end,
}
