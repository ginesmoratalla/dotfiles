local function nordic_config()
  require('nordic').setup({
    -- This callback can be used to override the colors used in the base palette.
    on_palette = function(palette)
      palette.gray0 = '#12121D'
      palette.gray5 = '#e0d369'
      palette.black1 = '#191926'
      palette.black0 = '#24221f'
    end,
  })
end

local function catpuccin_config()
  require('catppuccin').setup({
    color_overrides = {
      all = {
          -- base = "#0f0f14",
          base = "#0d0d0d",
      },
    }
  })
  vim.cmd([[colorscheme catppuccin]])
end

local function cyberdream_config()
  require('cyberdream').setup({
    variant = "dark",
    transparent = false,
    colors = {
        bg = "#0d0d0d",
    }
  })
  vim.cmd([[colorscheme cyberdream]])
end

return {
  {
    "scottmckendry/cyberdream.nvim",
    -- "catppuccin/nvim",
		priority = 1000,
		lazy = false,
		config = function()
      cyberdream_config()
    end,
	},

	--{ dir = "~/Documents/me/forks/nvim-fonts/calvera-dark.nvim" },
	--{ dir = "~/Documents/me/forks/nvim-fonts/oh-lucy.nvim" },
	--{ dir = "~/Documents/me/forks/nvim-fonts/rose-pine" },
	--{ dir = "~/Documents/me/forks/nvim-fonts/monochrome-grey" },
	--{"catpuccin/nvim"},
	--{"killitar/obscure.nvim",},
	--{"tiagovla/tokyodark",},
	{ "mellow-theme/mellow.nvim" },
	{ "aditya-azad/candle-grey" },
	{ "andreasvc/vim-256noir" },
	{ "kdheepak/monochrome.nvim" },
	{ "nyoom-engineering/oxocarbon.nvim" },
	{ "bluz71/vim-moonfly-colors", name = "moonfly" },
	{ "gruvbox-community/gruvbox" },
	{ "AlexvZyl/nordic.nvim" },
	{ "kvrohit/rasmus.nvim" },
	{ "kdheepak/monochrome.nvim" },
	{ "rockerBOO/boo-colorscheme-nvim" },
}
