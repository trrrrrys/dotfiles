" ===================
" 言語別の設定
" ===================

" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
au FileType python,go set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=2
au FileType python,go set shiftwidth=4

" tsxが typescript として扱われてlspの補完が効かなくなるのでその暫定対応
au BufNewFile,BufRead *.tsx set filetype=typescriptreact

" vimgrep時に自動でqfウィンドウで開く
" autocmd QuickfixCmdPost make,grep,grepadd,vimgrep cwindow

" tftplファイルを開いた際にterraform filetypeを設定
autocmd BufNewFile,BufRead *.tftpl set filetype=terraform
" tsconfig.jsonをjsoncとして扱う
autocmd BufNewFile,BufRead tsconfig.json setlocal filetype=jsonc

augroup TabSettings
	autocmd!
	" ソフトタブ
	au FileType python,proto,sh setlocal expandtab
	" タブ表示幅
	au FileType proto,sh setlocal shiftwidth=2
	au FileType python,go setlocal shiftwidth=4
	au FileType python,go setlocal tabstop=4
augroup END
