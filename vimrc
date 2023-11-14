"" Hdogan

""Plugins
call plug#begin('~/.vim/plugged')
Plug 'vimwiki/vimwiki'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mattn/emmet-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

"" some basics
set nocompatible
filetype plugin on
syntax on
set hlsearch
set ignorecase
set smartcase
set number
"" map normal copy and paste
vnoremap <C-c> "+y
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"" enable wild mode
set wildmode=list:longest,full

" For regular expressions turn magic on
set magic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
"autocmd BufNewFile *.html 0r ~/.vim/templates/html.skel
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
autocmd FileType xml,html,css inoremap </ </<C-x><C-o>

"insert date when f5 pressed
:nnoremap <F5> "=strftime("%c")<CR>p
:inoremap <F5> <C-R>=strftime("%c")<CR>
