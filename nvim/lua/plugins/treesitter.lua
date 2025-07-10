  -- Treesitter
  return {
    'nvim-treesitter/nvim-treesitter',
    -- Treesitter config
    run = ':TSUpdate',
    version = false,
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = {
          "bash",
          "c",
          "diff",
          "html",
          "java",
          "nix",
          "javascript",
          "jsdoc",
          "json",
          "jsonc",
          "lua",
          "luadoc",
          "luap",
          "markdown",
          "markdown_inline",
          "printf",
          "python",
          "regex",
          "toml",
          "vim",
          "vimdoc",
          "xml",
          "yaml",
        },
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  }
