
if has('python3')
	let g:UltiSnipsExpandTrigger="<tab>"
	" let g:UltiSnipsExpandTrigger="<CR>"
    call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))
endif

