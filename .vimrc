:syntax on


set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
endfor

filetype off

" plugin
if 0 | endif

if has('vim_starting')
  set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
  if &compatible
    set nocompatible
  endif
endif

if dein#load_state('~/.vim/dein')
     call dein#begin(expand('~/.vim/dein/'))
     call dein#add('Shougo/dein.vim')
     call dein#add('Shougo/vimproc.vim', {'build': 'make'})
     call dein#add('Shougo/unite.vim')
     call dein#add('Shougo/unite-outline')
     call dein#add('Shougo/neosnippet.vim')
     call dein#add('Shougo/neosnippet-snippets')
     call dein#add('Shougo/neomru.vim')
     call dein#add('Shougo/neocomplcache.vim')
     call dein#add('Shougo/neocomplcache-rsense.vim')
     call dein#add('scrooloose/nerdtree')
     call dein#add('tpope/vim-surround')
     call dein#add('mattn/emmet-vim')
     call dein#end()
     call dein#save_state()
endif

filetype plugin indent on

if dein#check_install()
    call dein#install()
endif


" neocomplcacheの設定
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1


" Rsense用の設定
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

"rsenseのインストールフォルダがデフォルトと異なるので設定
let g:rsenseHome = expand("/Users/s-takahashi/.rbenv/shims/rsense")
let g:rsenseUseOmniFunc = 1

let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""




set number " 行番号の表示
set title
set ambiwidth=double " 全角文字の幅を2に固定

set tabstop=2 " 画面上でtab文字が占める幅
set expandtab " tabキーを押した時にスペースを入れる
set shiftwidth=2 " オートインデント時にインデントする文字数
set smartindent " 改行時に入力された行の末尾に合わせて次の行のインデントを選択

set list " 空白文字の可視化
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:% " 可視化した空白文字の表示形式
set backspace=indent,eol,start " バックスペースを空白、行末、行頭でも使える
set nrformats-=octal " 0で始まる数値を8進数として扱わない
set hidden " ファイルの保存をしていなくても別のファイルを開ける
set history=50
set virtualedit=block " 文字のないところにカーソル移動できる
set whichwrap=b,s,h,l,[,],<,> " カーソルの回り込みができる
set wildmenu " ファイル名をタブ補完する時最初のマッチのみ補完
set wildmode=list:full
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll " バイナルファイルを対象外

set ignorecase " 検索の際、小文字なら大文字小文字無視で検索
set smartcase  " 検索の際、大文字なら大文字のみで検索
set incsearch  " 検索文字を打ち込んでるタイミングで検索
set nohlsearch " no highlight search
set wrapscan   " 検索がファイル末尾まで来たら、ファイル先頭から再び検索

set laststatus=2 " 最下ウィンドウに常にステータスを表示
set showtabline=2 " タブページのラベルを常に表示

set clipboard=unnamed " vimのレジスタとクリップボードを連携
setlocal softtabstop=0
setlocal textwidth=80
autocmd BufWritePre * :%s/\s\+$//ge
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END


" カラースキーム選択
syntax enable
colorscheme railscasts
set t_co=256


imap <C-j> <esc>
noremap! <C-j> <esc>

imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let g:python_highlight_all = 1
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>


