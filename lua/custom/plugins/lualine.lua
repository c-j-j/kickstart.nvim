return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        sections = {
          lualine_b = {
            {
              'branch',
              fmt = function(str)
                return str:sub(1, 10)
              end,
            },
            'diff',
            'diagnostics',
          },
        },
      }
    end,
  },
}
