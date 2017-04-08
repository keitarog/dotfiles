
" vim-plug 
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'valloric/youcompleteme'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/twilight'

" Must be installed manually.
" rename google.vim to cpp.vim
Plug 'vim-scripts/google.vim' 

call plug#end()

" Theme
color twilight

" Line Numbers
set number

" Status Line
set laststatus=2

set tabstop=2  
set softtabstop=0 
set shiftwidth=2

set autoindent
set smartindent

" Plugins
autocmd VimEnter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

" nerdcommenter
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" ------------------------------------
"   Misc
" ------------------------------------

" Quickrun - Make
function Run()
	write
	!make -j && `find . -perm +111 -type f -maxdepth 1`
endfunction

nnoremap \c :!make clean<CR>
nnoremap \m :!make -j<CR>
nnoremap \r :call Run()<CR>

" Macro
" Source Edit - header guard
function HGuard(s)
	call append(1, ["#ifndef " . a:s, "#define " . a:s, ""])
	call append(line("$"), ["#endif /* " . a:s . " */", ""])
	call cursor(4, 0)
endfunction

function HGuardPrefix(s)
	let l:base = expand('%:t:r')
	let l:ext = expand('%:e')
	let l:name = toupper("__" . a:s . "_" . l:base . "_" . l:ext . "__")
	call HGuard(l:name)
endfunction

command -nargs=1 Sg :call HGuard(<f-args>)
command -nargs=1 Sgp :call HGuardPrefix(<f-args>)


" Namespace insert
function Namespace(...)
	let l:line = line(".")
	for s in a:000
		call append(l:line, ["namespace " . s . " {"])
		let l:line += 1
	endfor
	
	call append(l:line, [""])
	let l:line += 1
	call cursor(l:line, 0)

	for s in reverse(copy(a:000))
		call append(l:line, ["} // namespace " . s])
		let l:line += 1
	endfor
	call append(l:line, [""])
endfunction

command -nargs=+ Sns :call Namespace(<f-args>)

" Source traverse
" Alternate - find corresponding file
function Alt()
	let l:dict = {'cpp': 'hpp', 'm': 'h'}
	let l:ext = tolower(expand('%:e'))
	let l:base = expand('%:t:r')
	if has_key(l:dict, l:ext)
		" source to header
		let l:altext = l:dict[l:ext]
		let l:altname = l:base . '.' . l:altext
		" first search
		let l:mpath = 'include/' . expand('%:h:t') . '/' . l:altname
		if filereadable(l:mpath)
			execute 'vertical' 'belowright' 'split' fnameescape(l:mpath)
			return
		endif
		" second search
		let l:path = findfile(l:altname, getcwd() . '/include/**')
		if filereadable(l:path)
			execute 'vertical' 'belowright' 'split' fnameescape(l:path)
			return	
		endif

		echo 'Source traverse: Nothing is found'
	endif
endfunction

command -nargs=0 Alt :call Alt()
nnoremap \a :call Alt()<CR>

