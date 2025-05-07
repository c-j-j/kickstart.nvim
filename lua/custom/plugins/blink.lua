return {
  'saghen/blink.cmp',
  version = '1.*',
  -- `main` is untested, please open a PR if you've confirmed it works as expected
  dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
  opts = {
    keymap = { preset = 'default' },

    snippets = { preset = 'luasnip' },
    -- ensure you have the `snippets` source (enabled by default)
    sources = {
      default = { 'lsp', 'path', 'buffer' },
    },
    completion = {
      menu = { border = 'single' },
      documentation = { window = { border = 'single' } },
    },
    signature = { window = { border = 'single' } },
    fuzzy = { implementation = 'lua' },

  }
}
