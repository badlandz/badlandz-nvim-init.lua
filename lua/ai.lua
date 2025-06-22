require("gen").setup({
  model = "llama3.1",
  display_mode = "float",
  show_model = true,
})

-- Prompts
require('gen').prompts['Merge_Texts'] = {
  prompt = "Merge the following texts. Preserve structure, remove redundant content, and summarize:\n\n$text",
  replace = false,
}

require('gen').prompts['Find_Topic'] = {
  prompt = "Search and summarize all content about the following topic for writing purposes:\n\n$text",
  replace = false,
}

vim.api.nvim_create_user_command('WikiMerge', function(opts)
  if #opts.fargs ~= 2 then
    vim.notify("Error: WikiMerge requires exactly two arguments", vim.log.levels.ERROR)
    return
  end
  local content1 = vim.fn.readfile(opts.fargs[1])
  local content2 = vim.fn.readfile(opts.fargs[2])
  local merged = "Text 1:\n" .. table.concat(content1, "\n") .. "\n\nText 2:\n" .. table.concat(content2, "\n")
  vim.cmd('enew')
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(merged, "\n"))
  vim.cmd('normal! ggVG')
  vim.cmd('Gen Merge_Texts')
end, { nargs = '+' })

local M = {}
function M.merge_selected_files(files)
  vim.cmd('enew')
  local buf = vim.api.nvim_get_current_buf()
  local lines = {}
  for i, file in ipairs(files) do
    local content = vim.fn.readfile(file)
    table.insert(lines, "=== File " .. i .. ": " .. file .. " ===")
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

