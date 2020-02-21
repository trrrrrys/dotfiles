
" completeopt を自動設定しない
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
let g:asyncomplete_log_file = expand('~/asyncomplete.log')
let g:lsp_async_completion = 1

let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '!!'}
let g:lsp_signs_hint = {'text': '💡'}

" let g:lsp_insert_text_enabled = 1
" let g:lsp_signs_enabled = 1         " enable signs
" let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

autocmd FileType go,vim call s:configure_lsp()	
let g:lsp_settings = {
			\  'gopls': {
			\	'workspace_config': {'gopls': {
			\     'staticcheck': v:true,
			\     'completeUnimported': v:true,
			\     'caseSensitiveCompletion': v:true,
			\     'usePlaceholders': v:true,
			\     'completionDocumentation': v:true,
			\     'watchFileChanges': v:true,
			\     'hoverKind': 'SingleLine', 
			\     'deepCompletion': v:true, 
			\   }},
			\  }
			\}

function! s:configure_lsp() abort
  setlocal omnifunc=lsp#complete   " オムニ補完を有効化
  nnoremap <buffer> <C-]> :<C-u>LspDefinition<CR>
  nnoremap <buffer> gd :<C-u>LspDefinition<CR>
  nnoremap <buffer> gD :<C-u>LspReferences<CR>
  nnoremap <buffer> gs :<C-u>LspDocumentSymbol<CR>
  nnoremap <buffer> gS :<C-u>LspWorkspaceSymbol<CR>
  nnoremap <buffer> gQ :<C-u>LspDocumentFormat<CR>
  vnoremap <buffer> gQ :LspDocumentRangeFormat<CR>
  nnoremap <buffer> K :<C-u>LspHover<CR>
  nnoremap <buffer> <F1> :<C-u>LspImplementation<CR>
  nnoremap <buffer> <F2> :<C-u>LspRename<CR>
endfunction


" c-space で補完popup出力
let g:asyncomplete_auto_popup = 0
" <Nul>にc-spaceをmapping
autocmd VimEnter * imap <Nul> <C-Space>
imap <C-Space> <Plug>(asyncomplete_force_refresh)

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
