-- Set leader key
vim.g.mapleader = " "

-- Basic Neovim settings
vim.opt.guicursor = ""
vim.opt.syntax = "on"
vim.opt.tabstop = 4
vim.opt.filetype = "on"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.spell = false
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

-- Neovide settings (optional, for GUI users)
vim.g.neovide_transparency = 0.5
vim.g.transparency = 0.8
vim.g.neovide_background_color = "#0f1117" .. string.format("%x", math.floor(255 * vim.g.transparency))
vim.opt.guifont = "CaskaydiaCove Nerd Font:h13"

-- Colorscheme
vim.cmd("colorscheme industry")

-- Transparent background
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

-- Lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin specifications
require("lazy").setup({
  { "folke/tokyonight.nvim", branch = "main" },
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
  { "David-Kunz/gen.nvim" },  -- For AI capabilities with Ollama
}, {
  install = { colorscheme = { "industry" } },
})

-- Keymappings for Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- NERDTree keymapping
vim.keymap.set("n", "<C-f>", ":NERDTreeToggle<CR>", {})

-- TaskWiki keymapping
vim.keymap.set("n", "<C-l>", ":TaskWikiToggle<CR>", {})

-- Fugitive keymappings
vim.keymap.set("n", "<leader>gf", ":diffget //2<CR>", {})
vim.keymap.set("n", "<leader>gj", ":diffget //3<CR>", {})
vim.keymap.set("n", "<leader>gs", ":G<CR>", {})

-- Keymapping for merging files with AI
vim.keymap.set("n", "<leader>ma", function()
  require("telescope.builtin").find_files({
    cwd = vim.fn.expand("~/doc/"),
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
        local selected = picker:get_multi_selection()
        if #selected > 0 then
          local files = {}
          for _, entry in ipairs(selected) do
            table.insert(files, entry[1])
          end
          require('ai').merge_selected_files(files)
        end
        require("telescope.actions").close(prompt_bufnr)
      end)
      map("n", "<CR>", function(prompt_bufnr)
        local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
        local selected = picker:get_multi_selection()
        if #selected > 0 then
          local files = {}
          for _, entry in ipairs(selected) do
            table.insert(files, entry[1])
          end
          require('ai').merge_selected_files(files)
        end
        require("telescope.actions").close(prompt_bufnr)
      end)
      return true
    end,
  })
end, {})

-- VimWiki configuration
vim.g.vimwiki_list = {
  {
    path = "~/doc/",
    syntax = "markdown",
    ext = ".md",
  },
}
vim.g.vimwiki_ext2syntax = {
  [".md"] = "markdown",
  [".markdown"] = "markdown",
  [".mdown"] = "markdown",
}
vim.g.vimwiki_markdown_link_ext = 1
vim.g.vimwiki_folding = ""

-- TaskWiki configuration
vim.g.taskwiki_markup_syntax = "markdown"
vim.g.taskwiki_disable_concealcursor = "nc"

-- Airline configuration
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = "base16_gigavolt"

-- Load AI configuration
require('ai')