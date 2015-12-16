set nocompatible
set tags=~/.tags
"set cmdheight=2

set backspace=2
set tabstop=2
set shiftwidth=4
set softtabstop=0
set expandtab

" display
" ---------------------------------------
set guifont=Ricty\ Regular:h20
set list
set number
set ruler
set smartindent
set laststatus=2
set showcmd
set wildmenu
set linespace=0
set title

" colorscheme
" ---------------------------------------

colorscheme onedark
" encoding
" ---------------------------------------
set encoding=utf-8
set fileencodings=iso-2022-jp,sjis,euc-jp,utf-8

" syntax
" ---------------------------------------
syntax on

" search
" ---------------------------------------
set ignorecase
set smartcase
set wrapscan
set hlsearch
set incsearch

" edit
" ---------------------------------------
set autoindent
set cindent
set showmatch
set matchtime=2
set backspace=indent,eol,start
set clipboard=unnamed
set pastetoggle=<F12>
set guioptions+=a

" tab
" ---------------------------------------
set tabstop=2
set expandtab
set smarttab
set shiftwidth=4
set shiftround
set wrap

" keymap
" ---------------------------------------
set bioskey
set timeout
set timeoutlen=500

" brackets
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap <> <><LEFT>

" backup
" -----------------------------
set backup
set backupdir=~/.vim/backup
set swapfile
set directory=~/.vim/swap

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.vim/plugged')
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/vim-plug',
        \ {'dir': '~/.vim/plugged/vim-plug/autoload'}
let b:commandDepends = ['Unite', 'UniteWithBufferDir',
      \ 'VimFilerCurrentDir', 'VimFilerBufferDir']
Plug 'Shougo/unite.vim', {'on': b:commandDepends, 'for': ['unite']}
      \ | Plug 'Shougo/vimfiler', {'on': b:commandDepends}
unlet b:commandDepends
call plug#end()

" lightline
" --------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
