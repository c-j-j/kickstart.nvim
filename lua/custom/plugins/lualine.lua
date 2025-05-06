return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        sections = {

          lualine_a = { 'mode' },
          lualine_b = {
            'diagnostics',
          },
          lualine_c = {
            {
              'filename',
              path = 1,
            }
          },
          lualine_x = {
            {
              'diff',
              colored = true,                                           -- Displays a colored diff status if set to true
              symbols = { added = '+', modified = '~', removed = '-' }, -- Changes the symbols used by the diff.
            }
          },
          lualine_y = {},
          lualine_z = {}
        },
      }
    end,
  },
}
