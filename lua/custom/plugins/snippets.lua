return {
  {
    'L3MON4D3/LuaSnip',
    dependencies = { 'rafamadriz/friendly-snippets' },
    enabled = true,

    -- follow latest release.
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',
    config = function()
      local ls = require 'luasnip'

      vim.keymap.set({ 'i' }, '<C-K>', function()
        ls.expand()
      end, { silent = true })
      vim.keymap.set({ 'i', 's' }, '<C-L>', function()
        ls.jump(1)
      end, { silent = true })
      vim.keymap.set({ 'i', 's' }, '<C-J>', function()
        ls.jump(-1)
      end, { silent = true })

      vim.keymap.set({ 'i', 's' }, '<C-E>', function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
      require('luasnip.loaders.from_vscode').lazy_load()
      local list_snips = function()
        local ft_list = require("luasnip").available()[vim.o.filetype]
        local ft_snips = {}
        for _, item in pairs(ft_list) do
          ft_snips[item.trigger] = item.name
        end
        print(vim.inspect(ft_snips))
      end

      vim.api.nvim_create_user_command("SnipList", list_snips, {})
    end,
  },
}
