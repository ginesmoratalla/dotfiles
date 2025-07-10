return {
	"ThePrimeagen/harpoon",
	config = function()
		require("harpoon").setup({
      save_on_change = true,
      save_on_toggle = false,
      mark_branch = true,
    })
    require('telescope').load_extension('harpoon')
	end,
}
