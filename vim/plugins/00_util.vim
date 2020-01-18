
" IsPlugged returns true if the plugin given as an argment is installed else
" returns false.
function! IsPlugged(name)
	return  exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
endfunction
