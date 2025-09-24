return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- local lspconfig = require("lspconfig")

			vim.lsp.enable('lua_ls')
			vim.lsp.enable('pyright')
			vim.lsp.enable('clangd')
			vim.lsp.enable('lua_ls')
			vim.lsp.enable('nil_ls')
			vim.lsp.enable('jdtls')
			vim.lsp.enable('ast_grep')
			vim.lsp.enable('jsonls')
			vim.lsp.enable('rust_analyzer')
			vim.lsp.enable('vuels')
			vim.lsp.enable('htmx')
			vim.lsp.enable('ltex')

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.diagnostic.config({ virtual_text = true })
		end,
	},
	-- MASON
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"pyright",
					"lua_ls",
					"jdtls",
					"ast_grep",
					"ltex",
					"jsonls",
					"rust_analyzer",
					"vuels",
					"nil_ls",
					"htmx",
				},
			})
		end,
	},
}
