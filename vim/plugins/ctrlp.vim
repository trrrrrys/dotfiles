let g:ctrlp_custom_ignore = '\v[\/](mock|\.git|\.hg|\.svn|node_modules)$'
" mappintgの変更
let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<bs>', '<c-h>', '<c-]>'],
    \ 'PrtSelectMove("j")':   ['<c-j>', '<c-n>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<c-p>'],
    \ 'PrtHistory(-1)':       [],
    \ 'PrtHistory(1)':        [],
    \ }

