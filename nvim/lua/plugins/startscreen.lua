--local ascii_table = require("theming.ascii")
--local color = os.getenv("MAIN_COLOR")
--
return {}
--return {
--	"goolord/alpha-nvim",
--	dependencies = { "nvim-tree/nvim-web-devicons" },
--	config = function()
--		vim.api.nvim_set_hl(0, "Dim_Red", { fg = "#9E1C1C" })
--		vim.api.nvim_set_hl(0, "Light_Grey", { fg = "#757575" })
--		vim.api.nvim_set_hl(0, "Dark_Grey", { fg = "#454545" })
--		vim.api.nvim_set_hl(0, "Grey_Green", { fg = "#537a5d" })
--		vim.api.nvim_set_hl(0, "Tmux_Green", { fg = "#57e389" })
--		vim.api.nvim_set_hl(0, "Pink", { fg = "#e29eca" })
--		vim.api.nvim_set_hl(0, "Blue", { fg = "#2989f0" })
--		vim.api.nvim_set_hl(0, "Blue_Purple", { fg = "#5777d9" })
--		vim.api.nvim_set_hl(0, "Orange", { fg = "#f27435" })
--		vim.api.nvim_set_hl(0, "Primary", { fg = color })
--		local alpha = require("alpha")
--		local dashboard = require("alpha.themes.dashboard")
--
--		dashboard.section.header.val = ascii_table.pattern
--		dashboard.section.header.opts = {
--			position = "center",
--			hl = "Orange",
--		}
--
--		dashboard.section.buttons.val = {
--			dashboard.button("SPC f f", "󰈞  Find file"),
--			dashboard.button("SPC f o", "󰊄  Recently opened files"),
--			dashboard.button("SPC f b", "  Find buffers"),
--			dashboard.button("SPC f g", "  Live Grep"),
--			dashboard.button("SPC e e", "󱘎  Open filetree"),
--			dashboard.button("SPC t h", "  List themes"),
--			--dashboard.button("SPC a a", "  Change ASCII Logo"),
--		}
--		dashboard.section.buttons.opts = {
--			position = "right",
--		}
--		-- This line here is needed for the colour to be applicable, I think becuase it takes every line as and
--		-- independent modifiable group
--		dashboard.section.footer.type = "group"
--		dashboard.section.footer.val = {
--			{
--				type = "text",
--				val = "  ",
--				opts = { hl = "Dim_Red", position = "center" },
--			},
--			{
--				type = "text",
--				val = "- ginesmoratalla -",
--				opts = { hl = "Blue", position = "center" },
--			},
--			{
--				type = "text",
--				val = " ",
--				opts = { hl = "Blue", position = "center" },
--			},
--		}
--		alpha.setup(dashboard.config)
--	end,
--}
