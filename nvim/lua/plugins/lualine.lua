return {
 { "nvim-lualine/lualine.nvim", dependencies = { 'nvim-tree/nvim-web-devicons' },
   config = function()
      require('lualine').setup {
        options = {
          --theme = 'iceberg_dark',
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' }
        },
        sections = {
          lualine_a = {
            {
              'mode',
              icon = "",
              fmt = string.lower
            }
          },
          lualine_b = {
            {
              'branch',
              icon = ""
            },
            {'diff', 'diagnostics'},
          },
          lualine_c = {
            {'filename'},
            {
              'filetype',
              icon_only = true
            },
          },
          lualine_x = {
            {'encoding'},
            {
              'filetype'
            }
          },
        }
      }
    end,
  }
}
