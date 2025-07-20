return {
	{
		"hrsh7th/cmp-path",
	},
	{
		"uga-rosa/cmp-dictionary",
		config = function()
			require("cmp_dictionary").setup({
				--paths = { "~/.local/share/dict/words" },
				exact_length = 2,
			})
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
      local kind_icons = {
        Text = '󰉿',
        Method = 'm',
        Function = '󰊕',
        Constructor = '',
        Field = '',
        Variable = '󰆧',
        Class = '󰌗',
        Interface = '',
        Module = '',
        Property = '',
        Unit = '',
        Value = '󰎠',
        Enum = '',
        Keyword = '󰌋',
        Snippet = '',
        Color = '󰏘',
        File = '󰈙',
        Reference = '',
        Folder = '󰉋',
        EnumMember = '',
        Constant = '󰇽',
        Struct = '',
        Event = '',
        Operator = '󰆕',
        TypeParameter = '󰊄',
      }
			require("luasnip.loaders.from_vscode").lazy_load()
			cmp.setup({

				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},

				completion = { completeopt = "menu,menuone,noinsert" },

				window = {
					completion = cmp.config.window.bordered({
            col_offset = 0,
            side_padding = 0,
          }),
					documentation = cmp.config.window.bordered(),
				},

				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),

					-- FOR AUTOCOMPLETION SHIFT
          ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
					["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
					{ name = "path" }, -- For luasnip users.
					{ name = "dictionary", keyword_length = 2 },
					{ name = "buffer" },
				}),

        -- Customization for Pmenu
        vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" }),
        vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" }),

        vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true }),
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true }),
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true }),
        vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true }),

        vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#11111B", bg = "#A6E3A1" }),
        vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#11111B", bg = "#A6E3A1" }),
        vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#11111B", bg = "#A6E3A1" }),

        vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#11111B", bg = "#F38BA8" }),
        vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#11111B", bg = "#F38BA8" }),
        vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#11111B", bg = "#F38BA8" }),

        vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#11111B", bg = "#FBB387" }),
        vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#11111B", bg = "#FBB387" }),
        vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#11111B", bg = "#FBB387" }),

        vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#11111B", bg = "#89B4FA" }),
        vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#11111B", bg = "#89B4FA" }),
        vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#11111B", bg = "#89B4FA" }),
        vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#11111B", bg = "#89B4FA" }),
        vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#11111B", bg = "#89B4FA" }),

        vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#11111B", bg = "#F2CDCD" }),
        vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#11111B", bg = "#F2CDCD" }),

        vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#11111B", bg = "#FFEE8C" }),
        vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#11111B", bg = "#FFEE8C" }),
        vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#11111B", bg = "#FFEE8C" }),

        vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#11111B", bg = "#6C8ED4" }),
        vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#11111B", bg = "#6C8ED4" }),
        vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#11111B", bg = "#6C8ED4" }),

        vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" }),
        vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" }),
        vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" }),

        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            --vim_item.menu = string.format('%s', vim_item.kind)
            kind.kind = " " .. (strings[1] or "") .. " "
            kind.menu = " " .. (strings[2] or "") .. " "
            return kind
          end,
        },

			})
		end,
	},
}
