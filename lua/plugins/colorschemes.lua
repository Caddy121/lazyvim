return {
  { "LazyVim/LazyVim", opts = {
    colorscheme = "horizon",
  } },

  { "ellisonleao/gruvbox.nvim", enabled = true },
  { "sainnhe/gruvbox-material", enabled = true },
  { "Shatur/neovim-ayu", enabled = true },
  { "lunarvim/horizon.nvim", enabled = true },
  { "sainnhe/edge", enabled = true },
  { "Mofiqul/dracula.nvim", enabled = true },
  { "cpea2506/one_monokai.nvim", enabled = true },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = true,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
      })
    end,
  },
  {
    "marko-cerovac/material.nvim",
    enabled = true,
    config = function()
      require("material").setup({
        styles = {
          types = { italic = true },
          keywords = { italic = true },
          variables = { italic = true },
          fields = { italic = true },
        },
      })
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    enabled = true,
    config = function()
      require("nightfox").setup({
        options = {
          styles = {
            types = "italic",
            keywords = "bold",
            variables = "italic",
          },
        },
      })
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = true,
    config = function()
      require("rose-pine").setup({
        dark_variant = "moon",
      })
    end,
  },
  -- { "olimorris/onedarkpro", enabled = true },
  -- { "rebelot/kanagawa", enabled = true },
  {
    "uloco/bluloco.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      require("bluloco").setup({
        style = "dark", -- "auto" | "dark" | "light"
        transparent = false,
        italics = true,
        terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
        guicursor = true,
      })
    end,
  },
}
