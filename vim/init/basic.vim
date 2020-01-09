" setting
if has("multi_lang")
	language C
endif

set fenc=utf-8

" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
set autowrite
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 行番号
set number
" 現在の行からの相対位置を表示
" set relativenumber
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" スマートインデント
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch

" 現在の行をハイライト
" set cursorline
" コマンドラインの補完
" set wildmode=list:longest:full
set wildmenu
set wildmode=longest:full,full

" ビープ音
set belloff=all

set scrolloff=10

" Tab文字を半角スペースにする
" set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch

" スクリーンベル無効化
set t_vb=
set novisualbell

" バックスペース効かない問題
set backspace=indent,eol,start

set updatetime=100

syntax on
filetype plugin on
filetype plugin indent on
au FileType yaml setl indentkeys-=<:>
au FileType vim setlocal foldmethod=marker
au FileType typescript setlocal omnifunc=lsp#complete
syntax enable

"
" set autochdir
set splitright

" ctagsの設定
set tags=./tags

