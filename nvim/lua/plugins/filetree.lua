-- NvimTree
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({})
    --vim.cmd([[highlight NvimTreeNormal guibg=#1a1a1a]])
  end,
}
