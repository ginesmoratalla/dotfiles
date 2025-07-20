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

return {
  {
    --"sho-87/kanagawa-paper.nvim",
    --"yashguptaz/calvera-dark.nvim",
    --"killitar/obscure.nvim",
    --"projekt0n/github-nvim-theme",
    --"rebelot/kanagawa.nvim",
    --"Vallen217/eidolon.nvim",
    --"Vallen217/eidolon.nvim",
    --"decaycs/decay.nvim",
    --"sainnhe/everforest",
	  -- dir = "~/me/nvim-themes/everforest",
	  --"AlexvZyl/nordic.nvim",
    --"webhooked/kanso.nvim",
    "catppuccin/nvim",
		priority = 1000,
		lazy = false,
		config = function()
      --nordic_config()
      require('catppuccin').setup({
        --theme = "zen",
        --background = {"zen"},
        color_overrides = {
          all = {
              base = "#0f0f14",
          },
        }
      })
			vim.cmd([[colorscheme catppuccin]])
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
