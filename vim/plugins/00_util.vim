
" IsPlugged returns true if the plugin given as an argment is installed else
" returns false.
function! IsPlugged(name)
	return  exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
endfunction

" https://github.com/trrrrrys/ambiguousud.git
function! Ambiguousud() abort
	let tmp = @@
	silent normal yiw
	let @@ = system('ambiguousud "'.@@.'"')
	silent normal viw"_xP`[
	let @@ = tmp
endfunction

function! VisualAmbiguousud() abort
	let tmp = @@
	" gv -> 最後にvisualmodeで選択した範囲を再選択する 	
	silent normal gvy
	let @@ = system('ambiguousud "'.@@.'"')
	silent normal gv"_xP`[
	let @@ = tmp
endfunction

nnoremap <silent> sd :call Ambiguousud()<cr>
vnoremap <silent> sd :call VisualAmbiguousud()<cr>

command! -nargs=1 EditCommand :call EditCommand(<q-args>)
function! EditCommand(cmd) abort
	new 
	setlocal buftype=nofile
 	redir @a
	silent execute a:cmd
	redir END
	put a
endfunction


