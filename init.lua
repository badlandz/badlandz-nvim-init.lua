vim.g.mapleader = " "

vim.opt.guicursor = ""
vim.opt.syntax = "on"
vim.opt.filetype = "on"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.ruler = true
vim.opt.list = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
vim.opt.laststatus = 2
vim.opt.foldenable = false
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.g.neovide_transparency = 0.5
vim.g.transparency = 0.8
vim.g.neovide_background_color = "#0f1117" .. string.format("%x", math.floor(255 * vim.g.transparency))
vim.opt.guifont = "CaskaydiaCove Nerd Font:h13"
vim.cmd("colorscheme industry")
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "folke/tokyonight.nvim" },
  { "morhetz/gruvbox" },
  { "preservim/nerdtree" },
  { "vim-airline/vim-airline" },
  { "vim-airline/vim-airline-themes" },
  { "vimwiki/vimwiki" },
  { "tbabej/taskwiki" },
  { "farseer90718/vim-taskwarrior" },
  { "plasticboy/vim-markdown" },
  { "powerman/vim-plugin-AnsiEsc" },
  { "majutsushi/tagbar" },
  { "tpope/vim-fugitive" },
  { "cormacrelf/vim-colors-github" },
  { "sonph/onehalf", rtp = "vim" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },
  { "xiyaowong/transparent.nvim" },
  { "David-Kunz/gen.nvim" },
}, {
  install = { colorscheme = { "industry" } },
})

local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, {})
vim.keymap.set("n", "<leader>fw", telescope.live_grep, {})
vim.keymap.set("n", "<leader>fb", telescope.buffers, {})
vim.keymap.set("n", "<leader>fh", telescope.help_tags, {})
vim.keymap.set("n", "<leader>ft", function()
  local topic = vim.fn.input("Ask AI about topic: ")
  if topic and topic ~= "" then
    vim.cmd("Gen Find_Topic " .. topic)
  end
end, {})
vim.keymap.set("n", "<C-f>", ":NERDTreeToggle<CR>", {})
vim.keymap.set("n", "<C-l>", ":TaskWikiToggle<CR>", {})
vim.keymap.set("n", "<leader>gf", ":diffget //2<CR>", {})
vim.keymap.set("n", "<leader>gj", ":diffget //3<CR>", {})
vim.keymap.set("n", "<leader>gs", ":G<CR>", {})
vim.keymap.set("n", "<leader>ma", function()
  require("telescope.builtin").find_files({
    cwd = vim.fn.expand("~/doc/"),
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local selected = require("telescope.actions.state").get_current_picker(prompt_bufnr):get_multi_selection()
        if #selected > 0 then
          local files = {}
          for _, entry in ipairs(selected) do table.insert(files, entry[1]) end
          require('ai').merge_selected_files(files)
        end
        require("telescope.actions").close(prompt_bufnr)
      end)
      return true
    end,
  })
end, {})

vim.g.vimwiki_list = { { path = "~/doc/", syntax = "markdown", ext = ".md" } }
vim.g.vimwiki_ext2syntax = { [".md"] = "markdown", [".markdown"] = "markdown", [".mdown"] = "markdown" }
vim.g.vimwiki_markdown_link_ext = 1
vim.g.vimwiki_folding = ""
vim.g.taskwiki_markup_syntax = "markdown"
vim.g.taskwiki_disable_concealcursor = "nc"
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = "base16_gigavolt"

require('ai')

