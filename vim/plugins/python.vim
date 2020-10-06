" yapf
" TODO: yapfエラー時にエラーメッセージでファイルが上書きされてしまう
let g:yapf_style = "google"
au BufWritePre *.py 0,$!yapf
