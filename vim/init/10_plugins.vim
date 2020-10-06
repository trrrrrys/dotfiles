
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
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'

" snipets
Plug 'SirVer/ultisnips'

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

call plug#end()


