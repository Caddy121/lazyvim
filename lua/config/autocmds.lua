-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Do not add additional comments when entering next line after commenting
local FormatOptions = augroup("FormatOptions", { clear = true })
autocmd("BufEnter", {
  group = FormatOptions,
  pattern = "*",
  desc = "Set buffer local formatoptions.",
  callback = function()
    vim.opt_local.formatoptions:remove({
      "r", -- Automatically insert the current comment leader after hitting <Enter> in Insert mode.
      "o", -- Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
    })
  end,
})

-- Treesitter no conceal
autocmd({ "Filetype" }, {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})
