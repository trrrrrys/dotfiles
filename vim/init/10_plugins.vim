
" git commit時
if $HOME != $USERPROFILE && $GIT_EXEC_PATH != ''
	finish
end

call plug#begin('~/.vim/plugged')

if has('nvim')
	Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/denite.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif  

Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ctrl + p 拡張
Plug 'ctrlpvim/ctrlp.vim'

" Tree 	
Plug 'scrooloose/nerdtree'

" language server
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'

" latest
" Plug 'prabirshrestha/vim-lsp'

" ok
Plug 'prabirshrestha/vim-lsp' , { 'commit': '2afe76df7b00684377b07575db12c0832a4482a1' }

Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
Plug 'natebosch/vim-lsc'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'

" snipets
Plug 'SirVer/ultisnips'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'

" <c-/><c-/> でコメント 
Plug 'tomtom/tcomment_vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

" tabサイズ変更につかってるやつ
Plug 'kana/vim-submode'

" <C-u>, <C-d>の動きを滑らかにする
Plug 'yonchu/accelerated-smooth-scroll'

" easymotion 	
Plug 'easymotion/vim-easymotion'

Plug 'vim-scripts/surround.vim'

" 選択箇所をpng化する
Plug 'segeljakt/vim-silicon'

" tmuxと一緒に使うやつ
Plug 'tpope/vim-obsession'

" markdown関連
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'mattn/sonictemplate-vim'
Plug 'mattn/vim-maketable' 
" Plug 'previm/previm'
Plug 'skanehira/preview-markdown.vim'

call plug#end()


