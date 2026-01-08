return { {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },   -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  config = function(_, opts)
    require('render-markdown').setup(opts)

    local function open_markdown_in_browser()
      local input = vim.api.nvim_buf_get_name(0)
      if input == '' then
        vim.notify('Current buffer is not associated with a file', vim.log.levels.ERROR)
        return
      end

      if vim.fn.filereadable(input) ~= 1 then
        vim.notify('File is not readable on disk: ' .. input, vim.log.levels.ERROR)
        return
      end

      local ext = vim.fn.fnamemodify(input, ':e'):lower()
      if ext ~= 'md' and ext ~= 'markdown' then
        vim.notify('OpenMdInBrowser only works on markdown files', vim.log.levels.ERROR)
        return
      end

      if vim.fn.executable('pandoc') ~= 1 then
        vim.notify('pandoc is not available in PATH', vim.log.levels.ERROR)
        return
      end

      vim.cmd('silent update')

      local output = '/tmp/' .. vim.fn.fnamemodify(input, ':t:r') .. '.html'
      local pandoc_output = vim.fn.system({ 'pandoc', input, '-t', 'html', '--output', output })
      if vim.v.shell_error ~= 0 then
        vim.notify('pandoc failed: ' .. pandoc_output, vim.log.levels.ERROR)
        return
      end

      local open_output = vim.fn.system({ 'open', output })
      if vim.v.shell_error ~= 0 then
        vim.notify('open failed: ' .. open_output, vim.log.levels.ERROR)
        return
      end

      vim.notify('Opened ' .. output .. ' in browser', vim.log.levels.INFO)
    end

    vim.api.nvim_create_user_command(
      'OpenMdInBrowser',
      open_markdown_in_browser,
      { desc = 'Render current markdown with pandoc and open in browser', force = true }
    )
  end,
} }
