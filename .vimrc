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
	elseif &filetype == 'c'
		exec "! gcc % -o %<"
		exec "! ./%<"
	elseif &filetype == 'python'
		exec "! python ./%"
	elseif &filetype == 'sh'
		exec "! sh ./%"
	elseif &filetype == 'tex'
		exec "! xelatex -shell-escape ./%"
		exec "! open ./%<.pdf"
	elseif &filetype == 'java'
		exec "! javac %"
		exec "! java %<"
	elseif &filetype == 'markdown'
		exec "! pandoc -N --toc -s --latex-engine=xelatex -V CJKmainfont='Songti SC' -V mainfont='Times New Roman' -M geometry:'top=1in, inner=1in,outer=1in,bottom=1in, headheight=3ex, headsep=2ex' % -o %<.pdf"
		exec "! open ./%<.pdf"
	endif
endfunc 

set autoindent

map <F7> :exec "split"<CR>
map <F6> :exec "vsplit"<CR>
map <F10> :exec "wq"<CR>
map <F12><F12> :exec "q!"<CR>
map <F9> :call Make(  )<CR>
func! Make(  )
	exec "w"
	exec "make"
endfunc

set history=10000

set completeopt=preview,menu

set nocompatible

inoremap <C-c> <esc>

syntax on

set backspace=2

imap kj <Esc>


if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

nmap <F5> :NERDTreeToggle<cr>

colorscheme default

 augroup filetype
   au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
 augroup END
 au Syntax jflex    so ~/.vim/syntax/jflex.vim

 " YouCompleteMe
set runtimepath+=~/.vim/bundle/YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
