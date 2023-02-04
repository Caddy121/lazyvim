-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Window Splits
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
vim.keymap.set("n", "<leader>wv", "<C-W>s", { desc = "Split window below" })
vim.keymap.set("n", "<leader>wh", "<C-W>v", { desc = "Split window right" })

-- Tabs
-- vim.keymap.set("n", "<leader>ta", ":tabnew<cr>", { desc = "New tab" })
-- vim.keymap.set("n", "<leader>tc", ":tabclose<cr>", { desc = "Close tab" })
-- vim.keymap.set("n", "<leader>to", ":tabonly<cr>", { desc = "Close all tabs except current one" })
-- vim.keymap.set("n", "<leader>tmp", ":-tabnext<cr>", { desc = "Go to prev tab" })
-- vim.keymap.set("n", "<leader>tmn", ":+tabnext<cr>", { desc = "Go to next tab" })

-- Quit/Save
vim.keymap.set("n", "<C-q>", ":q! <cr>", { desc = "Quit" })
vim.keymap.set("n", "<C-w>", ":w <cr>", { desc = "Save" })

-- Paste without yanking
vim.keymap.set("v", "p", '"_dP', { desc = "Paste over selection without yanking" })

-- Delete word backward
vim.keymap.set("i", "<A-BS>", "<c-w>", { desc = "Delete word backward" })

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Move Lines
vim.keymap.set("n", "E", ":m '>+1<CR>gv-gv", { desc = "Move down" })
vim.keymap.set("v", "E", ":m '>+1<CR>gv-gv", { desc = "Move down" })
-- vim.keymap.set("n", "E", ":m .+1<cr>==", { desc = "Move down" })
-- vim.keymap.set("v", "E", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("n", "U", ":m '<-2<CR>gv-gv", { desc = "Move up" })
vim.keymap.set("v", "U", ":m '<-2<CR>gv-gv", { desc = "Move up" })
-- vim.keymap.set("n", "U", ":m .-2<cr>==", { desc = "Move up" })
-- vim.keymap.set("v", "U", ":m '<-2<cr>gv=gv", { desc = "Move up" })
-- vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

-- Center
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")
vim.keymap.set("n", "g*", "g*zz")
vim.keymap.set("n", "g#", "g#zz")
-- vim.keymap.set("n", "G", "Gzz")

-- Buffers
vim.keymap.set("n", "bp", "<cmd>Telescope buffers<cr>", { desc = "Select Buffers" })
