-- AI configurations
require("gen").setup({
  model = "llama3.1",  -- Adjust to your preferred Ollama model
  display_mode = "float",
  show_model = true,
})

-- Custom prompts for wiki processing
require('gen').prompts['Merge_Texts'] = {
  prompt = "Merge the following two texts, removing redundancies and preserving unique information:\n\n$text",
  replace = false,
}

-- User command for merging wiki files
vim.api.nvim_create_user_command('WikiMerge', function(opts)
  if #opts.fargs ~= 2 then
    print("Error: WikiMerge requires exactly two arguments")
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
