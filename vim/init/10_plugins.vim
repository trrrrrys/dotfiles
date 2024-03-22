
call plug#begin('~/.vim/plugged')

" UI系
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ctrlp
Plug 'ctrlpvim/ctrlp.vim'
" tree
Plug 'scrooloose/nerdtree'

" language server
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" snipets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" コメント用
Plug 'tomtom/tcomment_vim'

" Git
Plug 'tpope/vim-fugitive'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

" tab
Plug 'kana/vim-submode'

" easymotion
Plug 'easymotion/vim-easymotion'

Plug 'vim-scripts/surround.vim'

" 選択箇所をpng化する
Plug 'segeljakt/vim-silicon'

" yapf
Plug 'mindriot101/vim-yapf'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
  \ }

" Plug 'sheerun/vim-polyglot'

Plug 'vim-denops/denops.vim'
Plug 'trrrrrys/switchb.vim'
Plug 'hashivim/vim-terraform' , { 'for': 'terraform'}
Plug 'mattn/vim-maketable'

" Plug 'github/copilot.vim'
call plug#end()
