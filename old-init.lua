-- Existing configurations...

-- Setting up the merge keymapping. Because manually merging is so last century.
-- If this doesn't work, maybe try sacrificing a keyboard to the coding gods.
vim.keymap.set('n', '<leader>ma', function() require('telescope').extensions.ai.merge() end, { desc = 'Merge with AI' })

-- Additional keymappings and settings...
