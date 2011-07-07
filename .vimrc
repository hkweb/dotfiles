"----------------------------------------------------
" 基本的な設定
"----------------------------------------------------
" viとの互換性をとらない(vimの独自拡張機能を使う為)
"set nocompatible

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
highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,euc-jp,cp932,iso-2022-jp
set fileencodings+=,ucs-2le,ucs-2,utf-8
set tabpagemax=200
set expandtab
set tabstop=2
set shiftwidth=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set number
set nowrapscan    "検索でファイル終端に来たら先頭に戻らない
set ruler

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
set nocompatible
filetype off

set rtp+=~/.vim/vundle/ "vundleのディレクトリ
call vundle#rc()

"Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/unite.vim'
"Bundle 'thinca/vim-ref'
"Bundle 'thinca/vim-quickrun'
Bundle 'tpope/vim-surround'
Bundle 'mattn/zencoding-vim'
Bundle 'othree/html5.vim'
Bundle 'Shougo/neocomplcache'

Bundle 'rails.vim'
Bundle 'Source-Explorer-srcexpl.vim'

filetype plugin indent on " required!

" settings for srcexpl.vim
let g:SrcExpl_UpdateTags = 1
let g:SrcExpl_RefreshTime = 1
let g:SrcExpl_RefreshMapKey = "<Space>"
let g:SrcExpl_GoBackMapKey = "<C-b>"
nmap <F8> :SrcExplToggle<CR>


"settings for neocomplcache.vim

	" Disable AutoComplPop.
	let g:acp_enableAtStartup = 0
	" Use neocomplcache.
	let g:neocomplcache_enable_at_startup = 1
	" Use smartcase.
	let g:neocomplcache_enable_smart_case = 1
	" Use camel case completion.
	let g:neocomplcache_enable_camel_case_completion = 1
	" Use underbar completion.
	let g:neocomplcache_enable_underbar_completion = 1
	" Set minimum syntax keyword length.
	let g:neocomplcache_min_syntax_length = 3
	let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

	" Define dictionary.
	let g:neocomplcache_dictionary_filetype_lists = {
	    \ 'default' : '',
	    \ 'vimshell' : $HOME.'/.vimshell_hist',
	    \ 'scheme' : $HOME.'/.gosh_completions'
	        \ }

	" Define keyword.
	if !exists('g:neocomplcache_keyword_patterns')
	    let g:neocomplcache_keyword_patterns = {}
	endif
	let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

	" Plugin key-mappings.
	imap <C-k>     <Plug>(neocomplcache_snippets_expand)
	smap <C-k>     <Plug>(neocomplcache_snippets_expand)
	inoremap <expr><C-g>     neocomplcache#undo_completion()
	inoremap <expr><C-l>     neocomplcache#complete_common_string()

	" SuperTab like snippets behavior.
	"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y>  neocomplcache#close_popup()
	inoremap <expr><C-e>  neocomplcache#cancel_popup()

	" AutoComplPop like behavior.
	"let g:neocomplcache_enable_auto_select = 1

	" Shell like behavior(not recommended).
	"set completeopt+=longest
	"let g:neocomplcache_enable_auto_select = 1
	"let g:neocomplcache_disable_auto_complete = 1
	"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
	"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

	" Enable omni completion.
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

	" Enable heavy omni completion.
	if !exists('g:neocomplcache_omni_patterns')
		let g:neocomplcache_omni_patterns = {}
	endif
	let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
	"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
	let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
	let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
	let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

