
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
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'

" snipets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" コメント用
Plug 'tomtom/tcomment_vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

" tab
Plug 'kana/vim-submode'

" easymotion 	
Plug 'easymotion/vim-easymotion'

Plug 'vim-scripts/surround.vim'

" 選択箇所をpng化する
Plug 'segeljakt/vim-silicon'

" tmuxと一緒に使うやつ
Plug 'tpope/vim-obsession'

" yapf
Plug 'mindriot101/vim-yapf'


" pretter
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
  \ }

" TODO: syntax のみ利用したい
Plug 'leafgarland/typescript-vim'

call plug#end()


