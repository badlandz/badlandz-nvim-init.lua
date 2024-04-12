source $HOME/.vim/autoload/plug.vim

let mapleader = " " " map leader to Space

set guicursor=
syntax on
set tabstop=4
filetype on
"set rnu
set relativenumber
set nu
set spell!
set ruler
"set mouse=
set list
set wrap
set linebreak
set scrolloff=8
set colorcolumn=80
set laststatus=2
"set nofoldenable
syntax enable

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
" My plugins
"Plug 'mhinz/vim-startify'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'tbabej/taskwiki'
Plug 'farseer90718/vim-taskwarrior'
Plug 'plasticboy/vim-markdown'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'cormacrelf/vim-colors-github'
Plug 'sonph/onehalf'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'xiyaowong/transparent.nvim'
" I need to do this telescope load extension media files to image preview!
call plug#end()
" Find files using Telescope command-line shit.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" For NerdTree
nmap <C-f> :NERDTreeToggle<CR>
" For Time Tracking With VimTask
nmap <C-h> :TaskWikiToggle<CR>
" For Fugitive
" f for left frame, j for right frame
nmap <leader>gf :diffgit //2<CR>
nmap <leader>gj :diffgit //3<CR>
nmap <leader>gs :G<CR>
" List ends here. Plugins become visible to Vim after this call.

" VimWiki Tweaks
let g:vimwiki_list = [{'path': '~/src/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md':'markdown', '.markdown':'markdown','.mdown':'markdown'}
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_folding=''

" TaskWarrior Tweaks
let g:taskwiki_markup_syntex = 'markdown'
let g:taskwiki_disable_concealcursor = 'nc'

let g:airline_powerline_fonts = 1

" g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
let g:neovide_transparency = 0.5
let g:transparency = 0.8
let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))

set guifont=ComicShannsMono\ Nerd\ Font:h14
" colorscheme OceanicNext
" colorscheme default
" colorscheme gruvbox
" colorscheme industry
" colorscheme tokyonight
" colorscheme zellner
" colorscheme newspaper
" colorscheme github
" colorscheme slate
" colorscheme default
colorscheme gruvbox

let g:airline_theme='ravenpower'

