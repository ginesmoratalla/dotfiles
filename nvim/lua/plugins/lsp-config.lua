return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup ({})
      lspconfig.pyright.setup ({})
      lspconfig.clangd.setup ({})
      lspconfig.lua_ls.setup ({})
      lspconfig.jdtls.setup ({})
      lspconfig.ast_grep.setup ({})
      lspconfig.jsonls.setup ({})
      lspconfig.rust_analyzer.setup ({})
      lspconfig.vuels.setup ({})
      lspconfig.htmx.setup ({})
      lspconfig.ltex.setup ({})

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
    end
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
          "htmx",
        }})
      end
	},
}

