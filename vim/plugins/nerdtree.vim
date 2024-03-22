let g:NERDTreeDirArrows = 1
let g:NERDTreeNodeDelimiter = "\u00a0"
let NERDTreeShowHidden=1
let NERDTreeShowIgnoreStatus=1
let NERDTreeIgnore = ['\.git$', '\.DS_Store$', 'bin/$']

" https://github.com/ryanoasis/vim-devicons/pull/355
let g:NERDTreeGitStatusLogLevel = 3

function NerdTreeFindToggle()
    if &filetype == 'nerdtree'
        :NERDTreeToggle
    else
        :NERDTreeFind
    endif
endfunction

nnoremap <silent> <c-q> :call NerdTreeFindToggle()<CR>
