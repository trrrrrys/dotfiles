" <Leader>をspaceに
let mapleader="\<Space>"

" pumvisible(): is pop up menu visuble
" <CR>で pub
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" ESC連打でハイライト解除
nnoremap <esc><esc> :nohlsearch<CR><esc>

" <c-h> 強制用
inoremap <BS> <Nop>
cnoremap <BS> <Nop>

" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

" 参考: https://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
nnoremap s <Nop>
" x をレジスタに格納しない
nnoremap x "_x

" ウインドウの移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h

" ウインドウの位置移動
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H

" airline 使用するのでtab関連は定義しない
" tab移動
" nnoremap st :<C-u>tabnew<CR>

" switch window
nnoremap sw <C-w>w
" previous bufffer
nnoremap <silent> sp :<C-u>bp<CR>
" next bufffer
nnoremap <silent> sn :<C-u>bn<CR>

nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>bd<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sc :<C-u>close<CR>


nnoremap <C-h> ^
nnoremap <C-l> g$
vnoremap <C-h> ^
vnoremap <C-l> g$


" 括弧の補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap {<C-j> {}<Left><CR><ESC><S-o>
inoremap [<C-j> []<Left><CR><ESC><S-o>
inoremap (<C-j> ()<Left><CR><ESC><S-o>



inoremap (" ("")<Left><Left>
inoremap "" ""<Left>
inoremap `` ``<Left>
inoremap '' ''<Left>


nnoremap <expr> sr ':%s/' . expand('<cword>') . '/'
vnoremap <expr> sr ':%s/' . expand('<cword>') . '/'

nnoremap ; <Esc>:
vnoremap ; :

nnoremap : ;
vnoremap : ;

" space + return で改行挿入
nnoremap <Leader><Cr> i<CR><ESC>

" カーソル位置に改行挿入
nnoremap <c-j> i<CR><Esc>kg$

" https://twitter.com/mattn_jp/status/1202603537521401856
vnoremap < <gv
vnoremap > >gv

" yank to clipboard
vnoremap <Leader>y "+y
" paste from clipboard
nnoremap <Leader>p "+p


inoremap <C-l> <Nop>
