local wk = require("which-key")

wk.add({
  {
    "<leader>yp",
    function()
      local path = vim.fn.expand("%:p")
      vim.fn.setreg("+", path)
      print("Yanked path: " .. path)
    end,
    desc = "Yank Path"
  },
  {
    "<leader>yb",
    function()
      local buf = vim.api.nvim_get_current_buf()
      local path = vim.fn.expand("%:p")
      local result = "#buffer:" .. path
      vim.fn.setreg("+", result)
      print("Yanked buffer: " .. result)
    end,
    desc = "Yank Buffer"
  },
  {
    "<leader>yt",
    function()
      local test_cmd = require('my_commands')
      test_cmd.CopyTestCmd()
    end,
    desc = "Yank Test command"
  },
  {
    "<leader>yr",
    function()
      local path = vim.fn.expand("%:.")
      vim.fn.setreg("+", path)
      print("Yanked relative path: " .. path)
    end,
    desc = "Yank Relative path"
  },
  -- Diffview shortcuts
  {
    "<leader>gd",
    function()
      local file = vim.fn.expand("%")
      if file == "" then
        print("No file in current buffer")
        return
      end
      vim.cmd("DiffviewOpen main -- " .. file)
    end,
    desc = "Diff current file with main"
  },
  {
    "<leader>gh",
    function()
      local file = vim.fn.expand("%")
      if file == "" then
        print("No file in current buffer")
        return
      end
      vim.cmd("DiffviewFileHistory " .. file)
    end,
    desc = "Show file history"
  },
  {
    "<leader>gD",
    "<cmd>DiffviewOpen main<cr>",
    desc = "Diff all files with main"
  }
})
