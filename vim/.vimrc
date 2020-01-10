
" dein
if &compatible
  set nocompatible
endif

runtime! _config/init/*.vim
runtime! _config/plugins/*.vim

if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

