return {
  "ghillb/cybu.nvim",
  branch = "main", -- timely updates
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" }, -- optional for icon support
  config = function()
    local ok, cybu = pcall(require, "cybu")
    if not ok then
      return
    end
    cybu.setup({
      position = {
        anchor = "topright",
      },
      style = {
        path = "tail",
      },
    })
    vim.keymap.set("n", "<C-o>", "<Plug>(CybuNext)")
  end,
}
