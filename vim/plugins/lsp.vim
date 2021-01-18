
" completeopt を自動設定しない
let g:asyncomplete_min_chars = 2
let g:asyncomplete_popup_delay = 200
let asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,popup

" set completepopup=align:menu,border:off
set completepopup=border:off

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_documentation_float = 0

" logging
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')
let g:lsp_async_completion = 1

let g:lsp_signs_error = {'text': 'x'}
let g:lsp_signs_warning = {'text': '!!'}
let g:lsp_signs_hint = {'text': '!'}

let g:lsp_insert_text_enabled = 0
" let g:lsp_signs_enabled = 1         " enable signs
let lsp_signature_help_enabled = 0
" let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
hi Pmenu ctermfg=cyan ctermbg=black
hi PmenuSel ctermfg=black ctermbg=white

au FileType go,vim,python,typescript,typescriptreact call s:configure_lsp()	

let g:lsp_settings = {
			\		'gopls': {
			\			'initialization_options': {
			\				'staticcheck': v:true,
			\				'completeUnimported': v:true,
			\				'caseSensitiveCompletion': v:true,
			\				'usePlaceholders': v:true,
			\				'completionDocumentation': v:true,
			\				'analyses': {
			\					'fillstruct': v:true,
			\				},
			\				'symboMatcher': 'fuzzy',
			\				'codelens': {
			\					'generate': v:true,
			\					'test': v:true,
			\				},
			\				'watchFileChanges': v:true,
			\				'hoverKind': 'SingleLine', 
			\				'deepCompletion': v:true, 
			\			},
			\		},
			\		'pyls-all': { 'disabled': 1 },
			\		'typescript-language-server': {
			\			'initialization_options': {
			\				'usePlaceholders': v:true,
			\			},
			\		},
			\ }
function! s:configure_lsp() abort
  setlocal omnifunc=lsp#complete   " オムニ補完を有効化
	setlocal signcolumn=yes
  nnoremap <buffer> <C-]> :<C-u>LspDefinition<CR>
  nnoremap <buffer> g<C-]> :<C-u>LspReferences<CR>
  nnoremap <buffer> gs :<C-u>LspDocumentSymbol<CR>
  nnoremap <buffer> gS :<C-u>LspWorkspaceSymbol<CR>
  nnoremap <buffer> gQ :<C-u>LspDocumentFormat<CR>
  vnoremap <buffer> gQ :LspDocumentRangeFormat<CR>
  nnoremap <buffer> K :<C-u>LspHover<CR>
  nnoremap <buffer> gC :<C-u>LspCodeAction<CR>
  nnoremap <buffer> gi :<C-u>LspImplementation<CR>
  nnoremap <buffer> gr :<C-u>LspRename<CR>
	
	augroup autoformat
		autocmd!
		autocmd BufWritePre *.py call execute('LspDocumentFormatSync')
	augroup END
endfunction

" popupmenu visible
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
inoremap <expr> <c-cpace>  pumvisible() ? "\<C-y>" :  '<c-space>'
inoremap <expr> <esc>  pumvisible() ? "\<C-y><esc>" :  '<esc>'
