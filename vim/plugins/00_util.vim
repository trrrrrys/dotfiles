
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
	silent normal gvy
	let @@ = system('ambiguousud "'.@@.'"')
	silent normal gv"_xP`[
	let @@ = tmp
endfunction

function! Base64Encode() abort
	let tmp = @@
	silent normal gvy
  echo @@
	let @@ = systemlist('echo -n '.@@.' | base64 | tr -d "\n"')
	silent normal gv"_xP
	let @@ = tmp
endfunction

function! Base64Decode() abort
	let tmp = @@
	silent normal gvy
	let l:result = systemlist('echo -n '.@@.' | base64 --decode')
  new
  setlocal buftype=nofile
  setlocal bufhidden=wipe
  call setline(1, l:result)
	let @@ = tmp
endfunction

nnoremap <silent> sd :call Ambiguousud()<cr>
vnoremap <silent> sd :call VisualAmbiguousud()<cr>

vnoremap <silent> sbe :call Base64Encode()<cr>
vnoremap <silent> sbd :call Base64Decode()<cr>

command! -nargs=1 EditCommand :call EditCommand(<q-args>)
function! EditCommand(cmd) abort
	new
	setlocal buftype=nofile
 	redir @a
	silent execute a:cmd
	redir END
	put a
endfunction

function! GitBranchName() abort
	let tmp = @@
	silent normal gvy
  let @@ = system("git branch --show-current | grep -o 'sc-[1-9][0-9]*' | rev | cut -d'-' -f1 | rev | tr -d '\n'")
	silent normal gv"_xP`[
	let @@ = tmp
endfunction
vnoremap <silent> gb :call GitBranchName()<cr>

function! Pwf() abort
  echo expand('%:p')
endfunction
command! Pwf :call Pwf()


function! Uuid() abort
  echo system("deno eval 'Deno.stdout.writeSync(new TextEncoder().encode(crypto.randomUUID()))'")
endfunction

function! Ulid() abort
  echo system("deno eval 'import * as mod from \"https://deno.land/x/ulid@v0.3.0/mod.ts\"; Deno.stdout.writeSync(new TextEncoder().encode(mod.ulid()))'")
endfunction

function! Ulidz() abort
  echo system("deno eval 'import * as mod from \"https://deno.land/x/ulid@v0.3.0/mod.ts\"; Deno.stdout.writeSync(new TextEncoder().encode(mod.ulid().substring(0,10)+\"0\".repeat(16)))'")
endfunction

"
let g:silicon = {
      \   'theme':              'Dracula',
      \   'font':                  'Hack',
      \   'background':         '#AAAAFF',
      \   'shadow-color':       '#555555',
      \   'line-pad':                   2,
      \   'pad-horiz':                  0,
      \   'pad-vert':                   0,
      \   'shadow-blur-radius':         0,
      \   'shadow-offset-x':            0,
      \   'shadow-offset-y':            0,
      \   'line-number':           v:true,
      \   'round-corner':          v:true,
      \   'window-controls':       v:true,
      \ }
