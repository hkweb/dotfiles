"----------------------------------------------------
" 基本的な設定
"----------------------------------------------------
" viとの互換性をとらない(vimの独自拡張機能を使う為)
"set nocompatible

if filereadable($HOME.'/.vimprofile')
  source $HOME/.vimprofile
endif

" 改行コードの自動認識
set fileformats=unix,dos,mac
set history=500
set smartcase
set nowrapscan
set noincsearch
set title
set number
set ruler
set laststatus=2
syntax on
set hlsearch
set wrap
"set noswapfile
set showmode
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,euc-jp,cp932,iso-2022-jp
set fileencodings+=,ucs-2le,ucs-2,utf-8
set tabpagemax=200
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set number
set nowrapscan    "検索でファイル終端に来たら先頭に戻らない
set ruler

highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white

imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap “” “”<Left>
imap ” ”<Left>
imap <> <><Left>
imap “ “<Left>

function! RTrim()
let s:cursor = getpos(".")
%s/\s\+$//e
call setpos(".", s:cursor)
endfunction
" autocmd BufWritePre *.php,*.rb,*.js,*.bat call RTrim())

" ドワンゴ環境で支障が出たのでコメントアウト
"autocmd BufWritePre * call RTrim()


" vundle plugin install
"set nocompatible
"filetype off

"set rtp+=~/.vim/vundle/ "vundleのディレクトリ
"call vundle#rc()

"Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/unite.vim'
"Bundle 'thinca/vim-ref'
"Bundle 'thinca/vim-quickrun'
"Bundle 'tpope/vim-surround'
"Bundle 'mattn/zencoding-vim'
"Bundle 'othree/html5.vim'
"Bundle 'Shougo/neocomplcache'

"Bundle 'rails.vim'
"Bundle 'Source-Explorer-srcexpl.vim'

filetype plugin indent on " required!

" settings for srcexpl.vim
let g:SrcExpl_UpdateTags = 1
let g:SrcExpl_RefreshTime = 1
let g:SrcExpl_RefreshMapKey = "<Space>"
let g:SrcExpl_GoBackMapKey = "<C-b>"
