call plug#begin('~/.vim/bundle')

Plug 'flazz/vim-colorschemes'
Plug 'noahfrederick/vim-noctu'
Plug 'w0ng/vim-hybrid'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe'
" Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'rhysd/vim-clang-format'
Plug 'python/black'
Plug 'rust-lang/rust.vim'
Plug 'Chiel92/vim-autoformat'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
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
set hidden

set background=dark
colorscheme noctu
set notermguicolors

" let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_typescript_checkers=['tsuquyomi']

let g:syntastic_python_checkers=['flake8']
" let g:syntastic_python_flake8_args='--ignore=E203,E266,E501,W503 --max-line-length=80 --max-complexity=18, --select=B,C,E,F,W,T4,B9'
let g:syntastic_always_populate_loc_list=1

let g:tsuquyomi_disable_quickfix=1
let g:tsuquyomi_completion_detail=1

" let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='hybrid'

let g:clang_format#auto_format=0

" autocmd BufWritePre *.py execute ':Black'
nmap <buffer> <Leader>p :Autoformat<CR>
autocmd FileType python nmap <buffer> <Leader>p :Black<CR>
autocmd FileType sql nmap <Leader>p :%!pg_format - <CR>
let g:black_linelength=88

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

map <leader>n :NERDTreeFocus<CR>
map <leader>N :NERDTreeToggle<CR>
map <leader>b :Buffer<CR>
map <leader>B :b#<CR>
map <leader>f :GFiles<CR>
map <leader>F :Files<CR>
map <leader>g :Find<CR>

autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
highlight LineNr ctermfg=grey
set colorcolumn=101
