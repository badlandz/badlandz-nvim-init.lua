-- AI configurations
require("gen").setup({
  model = "llama3.1",  -- Adjust to your preferred Ollama model
  display_mode = "float",
  show_model = true,
})

-- Custom prompts for wiki processing
require('gen').prompts['Merge_Texts'] = {
  prompt = "Merge the following texts, removing redundancies and preserving unique information:\n\n$text",
  replace = false,
}

-- User command for merging wiki files (two files)
vim.api.nvim_create_user_command('WikiMerge', function(opts)
  if #opts.fargs ~= 2 then
    vim.notify("Error: WikiMerge requires exactly two arguments", vim.log.levels.ERROR)
    return
  end
  local file1 = opts.fargs[1]
  local file2 = opts.fargs[2]
  local content1 = vim.fn.readfile(file1)
  local content2 = vim.fn.readfile(file2)
  local combined = "Text 1:\n" .. table.concat(content1, "\n") .. "\n\nText 2:\n" .. table.concat(content2, "\n")
  vim.cmd('enew')
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(combined, "\n"))
  vim.cmd('normal! ggVG')
  vim.cmd('Gen Merge_Texts')
end, { nargs = '+' })

-- Module table for additional functions
local M = {}
function M.merge_selected_files(files)
  vim.cmd('enew')
  local buf = vim.api.nvim_get_current_buf()
  local lines = {}
  for i, file in ipairs(files) do
    local content = vim.fn.readfile(file)
    table.insert(lines, "Text " .. i .. ":")
    for _, line in ipairs(content) do
      table.insert(lines, line)
    end
    table.insert(lines, "")
  end
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.cmd('normal! ggVG')
  vim.cmd('Gen Merge_Texts')
end
return M
