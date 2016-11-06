set nu

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

map <F8> :call RunGdb(  )<CR>
func! RunGdb(  ) 
	exec "w"
	if &filetype == 'cpp'
		exec "! g++ % -std=c++11 -o %<"
		exec "! ./%<"
	elseif &filetype == 'python'
		exec "! python ./%"
	elseif &filetype == 'sh'
		exec "! sh ./%"
	endif
endfunc 

set autoindent

map <F5> :exec "split"<CR>
map <F6> :exec "vsplit"<CR>
map <F10> :exec "wq"<CR>
map <F12><F12> :exec "q!"<CR>
map <F9> :call Make(  )<CR>
func! Make(  )
	exec "w"
	exec "make"
endfunc

set history=10000

set background=dark
colorscheme koehler

map <F7> :exec "!"<CR>

set completeopt=preview,menu

set nocompatible

inoremap <C-c> <esc>
