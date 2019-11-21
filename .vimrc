if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

" colors
Plug 'flazz/vim-colorschemes'
Plug 'noahfrederick/vim-noctu'
Plug 'w0ng/vim-hybrid'

" navigations + status
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" autocomplete
Plug 'Valloric/YouCompleteMe'
" Plug 'ervandew/supertab'

" formatting & syntax highlighting
Plug 'katusk/vim-qkdb-syntax'
Plug 'rhysd/vim-clang-format'
Plug 'python/black'
Plug 'rust-lang/rust.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" linting
Plug 'vim-syntastic/syntastic'
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'mxw/vim-jsx'

" writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-abolish'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

call plug#end()

""" general config
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
colorscheme gruvbox
set termguicolors

function! s:patch_colors()
    set background=dark
    colorscheme gruvbox
    set termguicolors
    highlight ColorColumn ctermbg=gray
    highlight LineNr ctermfg=grey
    AirlineRefresh
endfunction

" autocmd! ColorScheme gruvbox call s:patch_colors()

highlight ColorColumn ctermbg=gray
highlight LineNr ctermfg=grey
set colorcolumn=101

" language specific whitespace
au BufNewFile,BufRead *.html set filetype=htmldjango
au FileType javascript,html,htmldjango,css,scss,less setlocal tabstop=2 softtabstop=2 shiftwidth=2


""" keybinds
map <SPACE> <leader>

" navigation
inoremap jk <esc>
inoremap kj <esc>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
nnoremap <F6> :setl noai nocin nosi inde= <CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

map <leader>n :NERDTreeFocus<CR>
map <leader>N :NERDTreeToggle<CR>
map <leader>b :Buffer<CR>
map <leader>B :b#<CR>
map <leader>f :GFiles<CR>
map <leader>F :Files<CR>
map <leader>g :Find<CR>

" code formatting
nmap <Leader>p :Autoformat<CR>
au FileType python nmap <buffer> <Leader>p :Black<CR>
au FileType sql nmap <buffer> <Leader>p :%!pg_format - <CR>
au BufEnter,BufNew *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html nmap <buffer> <Leader>p <Plug>(Prettier)
au FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>


""" syntax & formatting options
let g:syntastic_python_checkers=['flake8']
" let g:syntastic_python_flake8_args='--ignore=E203,E266,E501,W503 --max-line-length=80 --max-complexity=18, --select=B,C,E,F,W,T4,B9'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_typescript_checkers=['tsuquyomi']
let g:tsuquyomi_disable_quickfix=1
let g:tsuquyomi_completion_detail=1
let g:black_linelength=88
let g:clang_format#auto_format=0


""" fzf + rg
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --ignore --hidden --follow --glob "!{.git,node_modules,env,venv}/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)


""" misc config
let g:NERDSpaceDelims=1
" let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='hybrid'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


""" writing
function! s:goyo_enter()
    Limelight
    colorscheme zenburn
endfunction

function! s:goyo_leave()
    Limelight!
    colorscheme gruvbox
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
