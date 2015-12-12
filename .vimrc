set nocompatible
set nu sts=2 ts=2 sw=2 et si ai
set ruler
set hlsearch
syntax on
filetype plugin on
set whichwrap+=<,>,h,l
set backspace=indent,eol,start
set clipboard+=unnamed
set autoindent
set pastetoggle=<F9>

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

filetype off   " required

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

" Bundle 'Valloric/YouCompleteMe'
" "let mapleader = ","
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cxx/.ycm_extra_conf.py'
" nnoremap <leader>] :YcmCompleter GoToDefinitionElseDeclaration<CR>
" let g:ycm_confirm_extra_conf=0
" let g:ycm_collect_identifiers_from_tag_files = 1

Bundle 'scrooloose/nerdtree'
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
map <F2> :NERDTreeToggle<CR>

Bundle 'majutsushi/tagbar'
nmap <Leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=36
map <F3> :Tagbar<CR>
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'

Bundle 'bling/vim-airline'
set laststatus=2

Bundle 'wesleyche/SrcExpl'
nmap <F4> :SrcExplToggle<CR>
let g:Srcexpl_winHeight = 8
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_pluginList = ["__Tag_List__", "_NERD_tree_"]
set tags=tags;

"-- Cscope setting --
if has("cscope")
  set csprg=/usr/local/bin/cscope 
  set csto=0               " 0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库
  set cst                  " 同时搜索cscope数据库和标签文件
  set cscopequickfix=s-,c-,d-,i-,t-,e-    " 使用QuickFix窗口来显示cscope查找结果
  set nocsverb
  if filereadable("cscope.out")      " 若当前目录下存在cscope数据库，添加该数据库到vim
      cs add cscope.out
  elseif $CSCOPE_DB != ""            " 否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
      cs add $CSCOPE_DB
  endif
  set csverb
endif
map <F5> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
imap <F5> <ESC>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>

