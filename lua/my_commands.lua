local M = {}

-- Copies the nx test command required to run the current test, which can be pasted to another terminal pane
function M.CopyTestCmd()
  -- Get the full file path of the current file
  local path = vim.fn.expand '%:p'

  -- Function to find the nearest project.json file recursively upwards
  local function find_project_json(dir)
    local project_json = dir .. '/project.json'
    if vim.fn.filereadable(project_json) == 1 then
      return project_json
    end
    local parent_dir = vim.fn.fnamemodify(dir, ':h')
    if parent_dir == dir then
      return nil
    end
    return find_project_json(parent_dir)
  end

  -- Get the directory of the current file
  local dir = vim.fn.fnamemodify(path, ':h')

  -- Find the nearest project.json file
  local project_json_path = find_project_json(dir)
  if not project_json_path then
    vim.api.nvim_err_writeln 'project.json not found'
    return
  end

  -- Read the project.json file and get the name field
  local project_json = vim.fn.json_decode(vim.fn.readfile(project_json_path))
  local name = project_json.name
  if not name then
    vim.api.nvim_err_writeln 'name field not found in project.json'
    return
  end

  -- Construct the command
  local cmd = string.format('nx run %s:test --testFiles %s', name, path)

  -- Copy the command to the clipboard
  vim.fn.setreg('+', cmd)
  vim.api.nvim_out_write('Command copied to clipboard: ' .. cmd .. '\n')
end

return M
