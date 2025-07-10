
-- Command to fix nvim tab completions for command mode
vim.keymap.set('c', '<tab>', '<C-z>', { silent = false }) -- to fix cmp 

-- Telescope commands
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<CR>", { silent = true })
vim.keymap.set("n", "<leader>th", ":Telescope colorscheme<CR>", { silent = true })
vim.keymap.set("n", "<leader>lu", ":Lazy update<CR>", { silent = true })

-- Window splitting commands
vim.api.nvim_set_keymap("n", "<Right>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Left>", ":vertical resize +2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Up>", ":resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Down>", ":resize +2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-x>", ":split<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-v>", ":vsplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-c>", ":close<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-q>", ":bd<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-w>", ":w<CR>", { noremap = true, silent = true })

-- Window switching commands
vim.api.nvim_set_keymap("n", "<A-l>", "<C-w>w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-h>", "<C-w>h", { noremap = true, silent = true })

-- Buffer commands
vim.api.nvim_set_keymap("n", "<Tab>", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })

-- Copy and paste to external clipboard
vim.api.nvim_set_keymap("v", "<C-y>", '"+y', { noremap = true, silent = true })

-- File related - Writing and Closing File
vim.api.nvim_set_keymap("n", "<leader>w", ":write<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>xp", ":Explore<CR>", { noremap = true, silent = true })

-- NvimTree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ww", ":NvimTreeFocus<CR>", { noremap = true, silent = true })

-- Other Commands/Macros
vim.api.nvim_set_keymap("n", "<S-b>", "<C-q>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>o", "ko", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>o', 'kddko', { noremap = true, silent = true })

-- FTerm 
vim.keymap.set("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- harpoon
vim.api.nvim_set_keymap("n", "<leader>hm", ":Telescope harpoon marks<CR>", {noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>hx", ":lua require('harpoon.mark').add_file()<CR>", {noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>hp", ":lua require('harpoon.ui').nav_prev()<CR>", {noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>hn", ":lua require('harpoon.ui').nav_next()<CR>", {noremap = true, silent = true })

-- git
vim.api.nvim_set_keymap("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", { noremap = true, silent = true })

-- LaTeX
--vim.api.nvim_set_keymap("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { noremap = true, silent = true })

-- LSP Config
