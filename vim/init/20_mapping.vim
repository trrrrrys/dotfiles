" <Leader>をspaceに
let mapleader="\<Space>"

" ESC連打でハイライト解除
nnoremap <esc><esc> :nohlsearch<CR><esc>
nnoremap <C-c> :nohlsearch<CR><esc>

" 折り返し時に表示行単位での移動できるようにする
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

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
inoremap (( ()<Left>

" markdown用
inoremap ```<Cr> ```<Cr><Cr>```<Up>
inoremap '' ''<Left>

nnoremap <expr> sr ':%s/' . expand('<cword>') . '/'
vnoremap <expr> sr ':%s/' . expand('<cword>') . '/'

" ; と : を入れ替える
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

" space + return で改行挿入
nnoremap <Leader><Cr> i<CR><ESC>

nnoremap <silent> <c-j> 5gj
nnoremap <silent> <c-k> 5gk
vnoremap <silent> <c-j> 5gj
vnoremap <silent> <c-k> 5gk

" https://twitter.com/mattn_jp/status/1202603537521401856
vnoremap < <gv
vnoremap > >gv

" yank to clipboard
vnoremap <Leader>y "+y
nnoremap <Leader>yy "+yy
" paste from clipboard
" TODO: xserver setup
" nnoremap <Leader>p "+p
" paste mode
" nnoremap <silent> <Leader>p :<C-u>set paste!<CR>

nnoremap <silent> <Leader>c yiwgko<c-o>p<esc>:<c-u>TComment<cr>g$a<space>

inoremap <C-l> <Nop>

nnoremap H <Nop>
nnoremap L <Nop>

" replace paste 時にレジスタに格納しない
vnoremap p "_dP

nnoremap <silent><expr> * v:count ? '*'
			\ : ':sil exe "keepj norm! *" <Bar> call winrestview(' . string(winsaveview()) . ')<CR>'

" qfで <CR>押下で qf windowを閉じながら移動する
autocmd FileType qf nnoremap <buffer><silent> <CR> <CR>:<C-u>ccl<CR>
autocmd FileType qf nnoremap <buffer><silent> <esc> :<C-u>ccl<CR>

autocmd VimEnter * imap <Nul> <c-cpace>
