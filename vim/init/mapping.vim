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
"
nnoremap sw <C-w>w
nnoremap sp :<C-u>bp<CR>
nnoremap sn :<C-u>bn<CR>

nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>bd<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sc :<C-u>close<CR>
nnoremap sb :<C-u>Denite buffer -buffer-name=file<CR>

" smooth scroll
let g:ac_smooth_scroll_no_default_key_mappings = 1
nmap <silent> <C-d> <Plug>(ac-smooth-scroll-c-d)
nmap <silent> <C-u> <Plug>(ac-smooth-scroll-c-u)
nmap <silent> <C-f> <Plug>(ac-smooth-scroll-c-f)
nmap <silent> <C-b> <Plug>(ac-smooth-scroll-c-b)

nnoremap <C-h> ^
nnoremap <Leader>h ^
nnoremap <C-l> $<Right>
nnoremap <Leader>l $<Right>
vnoremap <C-h> ^
vnoremap <Leader>h ^
vnoremap <C-l> $<Right>
vnoremap <Leader>l $<Right>


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


nnoremap <expr> s<Leader> ':%s/' . expand('<cword>') . '/'
vnoremap <expr> s<Leader> ':%s/' . expand('<cword>') . '/'

nnoremap ; <Esc>:
vnoremap ; :

nnoremap : ;
vnoremap : ;

" easymotion-vim
map <Leader> <Plug>(easymotion-prefix)

" space + return で改行挿入
nnoremap <Leader><Cr> i<CR><ESC>

" 選択中のものを囲む
vnoremap <Leader>" di""<esc>P
vnoremap <Leader>' di''<esc>P
vnoremap <Leader>` di``<esc>P
vnoremap <Leader>{ di{}<esc>P
vnoremap <Leader>} di{}<esc>P
vnoremap <Leader>( di()<esc>P%
vnoremap <Leader>) di()<esc>P%
vnoremap <Leader>[ di[]<esc>P
vnoremap <Leader>] di[]<esc>P

" カーソル位置に改行挿入
nnoremap <C-j> i<CR><Esc>k$<Right>

" https://twitter.com/mattn_jp/status/1202603537521401856
vnoremap < <gv
vnoremap > >gv

" yank to clipboard
vnoremap <Leader>y "+y
" paste from clipboard
nnoremap <Leader>p "+p

