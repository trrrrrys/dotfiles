
" completeopt を自動設定しない
let g:asyncomplete_min_chars = 2
let g:asyncomplete_popup_delay = 200
let asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,popup

" set completepopup=align:menu,border:off
set completepopup=border:off

let g:lsp_async_completion = 1
let g:lsp_insert_text_enabled = 1
let g:lsp_text_edit_enabled = 1
let g:lsp_signature_help_enabled = 1
let g:lsp_signs_enabled = 1

" diagnostics
let g:lsp_diagnostics_enabled = 1
" let g:lsp_diagnostics_echo_cursor = 1
" let g:lsp_diagnostics_echo_delay = 500
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_float_delay = 500
" テキストのハイライト設定
let g:lsp_diagnostics_highlights_enabled = 1
let g:lsp_diagnostics_highlights_insert_mode_enabled = 0
let g:lsp_diagnostics_highlights_delay = 500
" 行番号左の表示
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_diagnostics_signs_insert_mode_enabled = 0
let g:lsp_diagnostics_signs_delay = 200
" let g:lsp_diagnostics_signs_error = {'text': ''}
" let g:lsp_diagnostics_signs_warning = {'text': ''}
" let g:lsp_diagnostics_signs_information = {'text': ''}
" let g:lsp_diagnostics_signs_hint = {'text': ''}
let g:lsp_diagnostics_signs_priority = 10
" let g:lsp_diagnostics_signs_priority_map = {}
" インライン表示
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_virtual_text_insert_mode_enabled = 0
" let g:lsp_diagnostics_virtual_text_delay = 500
" let g:lsp_diagnostics_virtual_text_prefix = ""
let g:lsp_format_sync_timeout = 1000

" logging
" let g:lsp_log_verbose = 0
" let g:lsp_log_file = expand('~/tmp/vim-lsp.log')
" let g:asyncomplete_log_file = expand('~/tmp/asyncomplete.log')
"
hi Pmenu ctermfg=cyan ctermbg=black
hi PmenuSel ctermfg=black ctermbg=white
" lsp_document_highlight color
highlight lspReference ctermbg=darkgray

"
let g:lsp_document_code_action_signs_enabled = 0
au FileType go,gomod,rust,vim,python,typescript,typescriptreact,rust,php,terraform,proto,yaml call s:configure_lsp()
let g:lsp_settings_filetype_go = ['gopls', 'golangci-lint-langserver']

" gopls 設定 https://github.com/golang/tools/blob/master/gopls/doc/settings.md
let g:lsp_settings = {
  \    'gopls': {
  \      'initialization_options': {
  \        'staticcheck': v:true,
  \        'completeUnimported': v:true,
  \        'usePlaceholders': v:true,
  \        'completionDocumentation': v:true,
  \        'analyses': {
  \          'fillstruct': v:true,
  \          'staticcheck': v:true,
  \        },
  \        'matcher': 'fuzzy',
  \        'codelenses': {
  \          'generate': v:true,
  \          'test': v:true,
  \          'tidy': v:true,
  \          'vendor': v:false,
  \          'run_vulncheck_exp': v:true,
  \        },
  \        'ui.inlayhint.hints': {
  \          'assignVariableTypes': v:true,
  \          'compositeLiteralFields': v:true,
  \          'compositeLiteralTypes': v:true,
  \          'constantValues': v:true,
  \          'functionTypeParameters': v:true,
  \          'parameterNames': v:true,
  \          'rangeVariableTypes': v:true,
  \        },
  \        'hoverKind': 'SynopsisDocumentation',
  \        'linksInHover': v:false,
  \        'deepCompletion': v:true,
  \        'standaloneTags': ['ignore', 'wireinject'],
  \      },
  \    },
  \    'golangci-lint-langserver': {
  \      'initialization_options': {
  \        'command': [
  \          'golangci-lint', 'run',
  \          '--out-format', 'json',
  \        ]
  \      },
  \    },
  \    'pyls-all': { 'disabled': 1 },
  \    'yaml-language-server': { 'disabled': 1 },
  \  }
function! s:configure_lsp() abort
  setlocal omnifunc=lsp#complete   " オムニ補完を有効化
  setlocal signcolumn=yes
  nnoremap <buffer> <C-]> :<C-u>LspDefinition<CR>zz
  nnoremap <buffer> g<C-]> :<C-u>LspReferences<CR>
  nnoremap <buffer> gs :<C-u>LspDocumentSymbol<CR>
  nnoremap <buffer> gS :<C-u>LspWorkspaceSymbol<CR>
  nnoremap <buffer> gQ :<C-u>LspDocumentFormat<CR>
  vnoremap <buffer> gQ :LspDocumentRangeFormat<CR>
  nnoremap <buffer> K :<C-u>LspHover<CR>
  nnoremap <buffer> gC :<C-u>LspCodeAction<CR>
  inoremap <buffer> <c-g> :<C-u>LspCodeAction<CR>
  nnoremap <buffer> gi :<C-u>LspImplementation<CR>
  nnoremap <buffer> gr :<C-u>LspRename<CR>
  nnoremap <buffer> gL :<C-u>LspCodeLens<CR>
  nnoremap <buffer> gI :<C-u>LspCallHierarchyIncoming<CR>
  nnoremap <buffer> gO :<C-u>LspCallHierarchyOutgoing<CR>
  nnoremap <buffer> g<c-r> :<C-u>silent LspStopServer<CR>:e
  nnoremap <buffer> gH :e<CR>
  augroup autoformat
    autocmd!
    autocmd BufWritePre *.py,*.rs call execute('LspDocumentFormatSync')
    autocmd BufWritePre *.go call execute(['LspCodeActionSync source.organizeImports', 'LspDocumentFormatSync'])
    " autocmd BufWritePre *.ts call execute(['LspCodeActionSync source.organizeImports.ts', 'LspDocumentFormatSync'])
  augroup END
endfunction

" popupmenu visible
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
inoremap <expr> <c-cpace> pumvisible() ? "\<C-y>" : '<c-space>'
