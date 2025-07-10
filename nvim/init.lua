
-- Import Lazy Package Manager and Set Up the Plugins
require("config.lazy")
---@diagnostic disable-next-line: different-requires
require("lazy").setup("plugins")

require("keymappings.keymappings")

-- Custom Config Parameters
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=1")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set foldmethod=manual")
vim.cmd("set relativenumber")
vim.cmd("highlight WinSeparator guibg=None")
vim.cmd([[set laststatus=3]])

-- UI Stuff
vim.cmd("set termguicolors")
vim.cmd("set cursorline")

-- Persistent undo (cache undos accross login sessions)
vim.opt.undofile = true
vim.opt.showmode = false
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undo"

-- Remove those tildes at emtpy lines
vim.opt.fillchars = { eob = " " }
