call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'vim-airline/vim-airline'

Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'Quramy/tsuquyomi'
Plug 'mxw/vim-jsx'

call plug#end()

set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set number
set ruler
set visualbell
set wildmode=longest,list

inoremap jk <esc>
inoremap kj <esc>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

map <SPACE> <leader>
let g:NERDSpaceDelims=1

nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

highlight ColorColumn ctermbg=gray
set colorcolumn=80
