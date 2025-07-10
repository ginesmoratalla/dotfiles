-- Visual menu plugins
return {
  {
    "nvzone/volt",
  },

  -- Timer
  {
    "nvzone/timerly",
    cmd = "TimerlyToggle",
  },

  -- Typer to practice typing
  -- {
  --   "nvzone/typr",
  --   config = function()
  --   end,
  -- },

  -- show keys to the top right of the screen
  --{
  --  "nvzone/showkeys",
  --  config = function()
  --    require("showkeys").setup({
  --      cmd = "ShowkeysToggle",
  --      timeout = 1,
  --      maxkeys = 4,
  --      -- more opts
  --      position = "top-right",
  --    })
  --    vim.cmd("ShowkeysToggle")
  --  end,
  --},

  -- Menu
  -- {
  --   "nvzone/menu",
  --   lazy = true,
  --   opts = {
  --     mouse = true,
  --     border = false
  --   },
  --   vim.keymap.set("n", "<leader>me", function() require("menu").open("default") end, {})
  -- },
}
