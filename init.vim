source $HOME/.vim/autoload/plug.vim

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
set nofoldenable
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
" Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" or                                , { 'branch': '0.1.x' }
" Plug 'valloric/youcompleteme'
" I need to do this telescope load extension media files to image preview!
call plug#end()
" Find files using Telescope command-line sugar.
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


" broken
let g:airline_theme='ravenpower'
" let g:airline_theme='onehalfdark'
" colorscheme onehalflight
