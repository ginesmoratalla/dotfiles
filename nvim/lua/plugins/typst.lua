-- Tyspt setup for running that shi locally
return {
  'chomosuke/typst-preview.nvim',
  lazy = false, -- or ft = 'typst'
  version = '1.*',
  opts = {}, -- lazy.nvim will implicitly calls `setup {}`
  config = function()
      vim.keymap.set("n", "<leader>tp", ":TypstPreview<CR>", { silent = true })
      vim.keymap.set("n", "<leader>ts", ":TypstPreviewStop<CR>", { silent = true })
  end,
  -- require 'typst-preview'.setup {
  -- }

}
