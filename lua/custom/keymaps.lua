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
  }
})
