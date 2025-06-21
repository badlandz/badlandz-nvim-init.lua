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
