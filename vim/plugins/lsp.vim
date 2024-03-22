
set completeopt=menuone,noinsert,noselect,popup
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr> <cr> pumvisible() ? '<C-y>' : '<cr>'
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" set completepopup=align:menu,border:off
set completepopup=border:off

" let g:lsp_async_completion = 1
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
" insert modeではLSPエラーを表示しない
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

" let g:lsp_inlay_hints_enabled = 1

" logging
let g:lsp_log_verbose = 0
let g:lsp_log_file = expand('~/tmp/vim-lsp.log')

hi Pmenu ctermfg=cyan ctermbg=black
hi PmenuSel ctermfg=black ctermbg=white
" lsp_document_highlight color
highlight lspReference ctermbg=darkgray

"
let g:lsp_document_code_action_signs_enabled = 0
au FileType go,gomod,rust,vim,python,typescript,typescriptd,typescriptreact,rust,php,terraform,proto,yaml call s:configure_lsp()
let g:lsp_settings_filetype_go = ['gopls', 'golangci-lint-langserver']
let g:lsp_settings_filetype_typescript = ['typescript-language-server', 'deno', 'efm-langserver']
let g:markdown_fenced_languages = ['ts=typescript']

" gopls 設定 https://github.com/golang/tools/blob/master/gopls/doc/settings.md
let g:lsp_settings = json_decode(join(
  \ readfile(expand('<sfile>:p:h').'/lsp.json', '', 1000),
  \ "\n"
  \ ))


" npmディレクトリ判定
function! s:is_npm_dir() abort
    let l:path = expand('%:p:h')
    while l:path != '/'
        let l:npmPath = l:path . '/node_modules'
        if isdirectory(l:npmPath)
            return v:true
        endif
        let l:path = fnamemodify(l:path, ':h')
    endwhile
    return v:false
endfunction

function! s:configure_lsp() abort
  setlocal omnifunc=lsp#complete   " オムニ補完を有効化
  setlocal signcolumn=yes
  let l:is_npm = s:is_npm_dir()
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nnoremap <buffer> <C-]> :<C-u>LspDefinition<CR>zz
  if !l:is_npm | nnoremap <buffer> <C-]> :<C-u>LspDenoDefinition<CR>zz | endif
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
  nnoremap <buffer> <expr>gk lsp#scroll(-1)
  nnoremap <buffer> <expr>gj lsp#scroll(+1)
  augroup autoformat
    autocmd!
    autocmd BufWritePre *.py,*.rs call execute('LspDocumentFormatSync')
    autocmd BufWritePre *.go call execute(['LspCodeActionSync source.organizeImports', 'LspDocumentFormatSync'])

    if l:is_npm
      autocmd BufWritePre *.ts call execute([
        \ 'LspDocumentFormatSync --server=efm-langserver'
        \ ])
    else
      autocmd BufWritePre *.ts call execute([
        \ 'LspDocumentFormatSync'
        \ ])
    endif
  augroup END
endfunction
