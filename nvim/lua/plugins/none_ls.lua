-- For terminal linting and other similar stuff
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			autostart = true,
			sources = {
				null_ls.builtins.diagnostics.checkstyle.with({
					extra_args = { "-c", "/google_checks.xml" }, -- or "/sun_checks.xml" Java
				}),
				null_ls.builtins.formatting.stylua,        --lua
				null_ls.builtins.formatting.black,         --python
				null_ls.builtins.formatting.clang_format,  --C/C++/C#
				null_ls.builtins.formatting.biome,         --JavaScript, TypeScript, JSON, HTML, Markdown, and CSS.
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
