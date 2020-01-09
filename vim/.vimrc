
" dein
if &compatible
  set nocompatible
endif

runtime! uautoload/init/*.vim
runtime! uautoload/plugins/*.vim

if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

