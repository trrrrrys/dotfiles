" <Leader>をspaceに
let mapleader="\<Space>"

" ESC連打でハイライト解除
" nnoremap <esc><esc> :nohlsearch<CR><esc>
nnoremap <silent> <C-c><C-c> :nohlsearch<CR><esc>

" 折り返し時に表示行単位での移動できるようにする
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

nnoremap s <Nop>
vnoremap s <Nop>
" x をレジスタに格納しない
" "_ ブラックホールレジスタ
nnoremap x "_x
vnoremap x "_x

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

" switch window
nnoremap sw <C-w>w
" previous bufffer
nnoremap <silent> sp :<C-u>bp<CR>
" next bufffer
nnoremap <silent> sn :<C-u>bn<CR>

nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>bd<CR>
nnoremap sQ :<C-u>bd<CR>

" 括弧の補完
" inoremap {<Enter> {}<Left><CR><ESC><S-o>
" inoremap [<Enter> []<Left><CR><ESC><S-o>
" inoremap (<Enter> ()<Left><CR><ESC><S-o>

nnoremap <expr> sr ':%s/' . expand('<cword>') . '/'
vnoremap <expr> sr ':%s/' . expand('<cword>') . '/'

" ; と : を入れ替える usキー用
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

" space + return で改行挿入
nnoremap <Leader><Cr> i<CR><ESC>

nnoremap <silent> <c-j> 10gj
nnoremap <silent> <c-k> 10gk
vnoremap <silent> <c-j> 10gj
vnoremap <silent> <c-k> 10gk

" https://twitter.com/mattn_jp/status/1202603537521401856
vnoremap < <gv
vnoremap > >gv

" yank to clipboard
vnoremap <silent><Leader>y "+y
nnoremap <silent><Leader>yy "+yy
nnoremap <silent><Leader>yy "+yy
" paste from clipboard
nnoremap <silent> <Leader>p "+p

nnoremap <silent> <Leader>c yiwgko<c-o>p<esc>:<c-u>TComment<cr>g$a<space>

inoremap <C-l> <Nop>

nnoremap H <Nop>
nnoremap L <Nop>

nnoremap Y y$
nnoremap <silent> X vg_"_x
nnoremap <silent> <Leader>o o<esc>

inoremap <F1> <Nop>
inoremap <F2> <Nop>
inoremap <F3> <Nop>
inoremap <F4> <Nop>
inoremap <F5> <Nop>
inoremap <F6> <Nop>
inoremap <F7> <Nop>
inoremap <F8> <Nop>
inoremap <F9> <Nop>
inoremap <F10> <Nop>
inoremap <F11> <Nop>
inoremap <F12> <Nop>

" replace paste 時にレジスタに格納しない
vnoremap p "_dP

" nnoremap <silent><expr> * v:count ? '*'
" 			\ : ':sil exe "keepj norm! *" <Bar> call winrestview(' . string(winsaveview()) . ')<CR>'

nnoremap <silent> * yiw/<C-R>"<CR>N
vnoremap <silent> * y/<C-R>"<CR>N

" qfで <CR>押下で qf windowを閉じながら移動する
" let g:qf_disle_statusline = 1
augroup QuickFixWindow
	autocmd!
	au FileType qf call s:qf_mapping()
augroup END

function! s:qf_mapping() abort
  nnoremap <buffer><silent> o <CR>
	nnoremap <buffer><silent> <CR> <CR>:<C-u>ccl<CR>
	nnoremap <buffer><silent> <esc> :<C-u>ccl<CR>
	nnoremap <buffer><silent> <C-c> :<C-u>ccl<CR>
	nnoremap <buffer><silent> q :<C-u>ccl<CR>
	nnoremap <buffer><Up> <Nop>
	nnoremap <buffer><Down> <Nop>
	nnoremap <buffer><Left> <Nop>
	nnoremap <buffer><Right> <Nop>
	nnoremap <buffer><silent> <CR> <CR>:<C-u>ccl<CR>
endfunction

autocmd VimEnter * imap <Nul> <c-space>

" snake to camel
" vnoremap sc

function! SynGroupUnderCursor()
  let l:current_syntax_id = synID(line('.'), col('.'), 0)
  let l:current_group_name = synIDattr(l:current_syntax_id, 'name')
  echo l:current_group_name
endfunction

nnoremap <silent> sg :<c-u>call SynGroupUnderCursor()<CR>
