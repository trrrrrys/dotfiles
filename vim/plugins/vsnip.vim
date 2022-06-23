
imap <expr> <tab>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<tab>'
smap <expr> <tab>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<tab>'
imap <expr> <c-l>   vsnip#available(1)   ? '<Plug>(vsnip-expand-or-jump)'      : '<c-l>'
smap <expr> <c-l>   vsnip#available(1)   ? '<Plug>(vsnip-expand-or-jump)'      : '<c-l>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

nmap si viw<Plug>(vsnip-cut-text)
vmap ss <Plug>(vsnip-cut-text)
