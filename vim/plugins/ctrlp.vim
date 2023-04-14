" let g:ctrlp_custom_ignore = '\v[\/]()$'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](mock|\.git|\.hg|\.svn|node_modules|\.DS_Store|\.git_keep)$',
	\ 'file': '\v(\.exe|\.so|\.dll|\.gitkeep|\.png|\.jpg|\.mp4|\.mp3|\.m4a)$',
	\ }
let g:ctrlp_show_hidden = 1
" mappintgの変更
let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<bs>', '<c-h>', '<c-]>'],
    \ 'PrtSelectMove("j")':   ['<c-j>', '<c-n>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<c-p>'],
    \ 'PrtHistory(-1)':       [],
    \ 'PrtHistory(1)':        [],
    \ }

