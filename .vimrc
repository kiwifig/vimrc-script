set nocompatible
set nu sts=2 ts=2 sw=2 et si ai
set ruler
set hlsearch
syntax on
filetype plugin on
set whichwrap+=<,>,h,l
set backspace=indent,eol,start
set clipboard+=unnamed

map <F5> :call CompileRunGcc()<CR>
fun! CompileRunGcc()
exec "w"
exec "!gcc % -o %<"
exec "! ./%<"
endfunc

map <F6> :call CompileRunGpp()<CR>
fun! CompileRunGpp()
exec "w"
exec "!g++ % -o %<"
exec "! ./%<"
endfunc

map <F7> :call Rungdb()<CR><CR><CR>
fun! Rungdb()
exec "w"
exec "!gcc % -g -o %<"
exec "!gdb %<"
endfunc

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"call vundle#rc(~/some/path/here)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'file:///home/gmarik/path/to/plugin'
" ...
filetype plugin indent on     " required

Bundle 'Valloric/YouCompleteMe'
"let mapleader = ","
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cxx/.ycm_extra_conf.py'
nnoremap <leader>] :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tag_files = 1

Bundle 'majutsushi/tagbar'
nmap <Leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=36
map <F3> :Tagbar<CR>
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

Bundle 'scrooloose/nerdtree'
"let NERDTreeWinPos='right'
let NERDTreeWinSize=30
map <F2> :NERDTreeToggle<CR>

Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'

Bundle 'bling/vim-airline'
set laststatus=2