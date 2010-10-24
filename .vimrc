set nocompatible
set tags=~/.tags
"set cmdheight=2

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=iso-2022-jp,sjis,utf-8

set backspace=2
set tabstop=2
set shiftwidth=4
set expandtab

" display
" ---------------------------------------
set list
set number
set ruler
set smartindent
set laststatus=2
set showcmd
set wildmenu
set linespace=0
set title
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
"highlight Comment ctermfg=DarkBlue
"set textwidth=78

" encoding
" ---------------------------------------
set encoding=utf-8
set fileencodings=iso-2022-jp,sjis,euc-jp,utf-8

" syntax
" ---------------------------------------
syntax on
colorscheme darkbluecommentmod

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

" misc
" -----------------------------
" colorscheme wombat でVisual mode時の選択色のみdesertの色に
" http://wildlifesanctuary.blog38.fc2.com/blog-entry-180.html
"if exists(g:colors_name)
"    g:colors_name == 'wombat'
"    hi Visual gui=none guifg=khaki guibg=olivedrab
"endif
