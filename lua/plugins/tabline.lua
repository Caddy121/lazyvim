return {
  {
    "kdheepak/tabline.nvim",
    config = function()
      require("tabline").setup({
        -- Defaults configuration options
        enable = true,
        options = {
          -- If lualine is installed tabline will use separators configured in lualine by default.
          -- These options can be used to override those settings.
          -- section_separators = {'', ''},
          -- component_separators = {'', ''},
          max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
          show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
          show_devicons = true, -- this shows devicons in buffer section
          show_bufnr = false, -- this appends [bufnr] to buffer section,
          show_filename_only = true, -- shows base filename only instead of relative path in filename
          -- modified_icon = "+ ", -- change the default modified icon
          modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
          show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
        },
      })
      vim.cmd([[
      set guioptions-=e " Use showtabline in gui vim
      set sessionoptions+=tabpages,globals " store tabpages and globals in session
    ]])
    end,
    dependencies = { { "nvim-lualine/lualine.nvim", opt = true }, { "nvim-tree/nvim-web-devicons", opt = true } },
    keys = {
      { "<leader>ta", ":TablineTabNew<cr>", { desc = "New tab with current files" } },
      { "<leader>tc", ":tabclose<cr>", { desc = "Close tab" } },
      { "<leader>to", ":tabonly<cr>", { desc = "Close all tabs except current one" } },
      { "<leader>tp", ":-tabnext<cr>", { desc = "Go to prev tab" } },
      { "<leader>tn", ":+tabnext<cr>", { desc = "Go to next tab" } },
      { "<leader>tr", ":TablineTabRename", { desc = "Go to next tab" } },
    },
  },
}
