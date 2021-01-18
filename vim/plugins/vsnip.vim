
imap <expr> <tab>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<tab>'
imap <expr> <c-l>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<c-l>'
smap <expr> <c-l>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<c-l>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

nmap si viw<Plug>(vsnip-cut-text)
vmap ss <Plug>(vsnip-cut-text)
