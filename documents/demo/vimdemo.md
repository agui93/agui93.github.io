##vimrc demo one in docker
```
let mapleader=";"
inoremap <Leader>jk <esc>
set encoding=utf-8
filetype plugin on


nmap LB 0
nmap LE $

vnoremap <Leader>y "+y

nmap <Leader>p "+p

nmap <Leader>q :q<CR>

nmap <Leader>w :w<CR>

nmap <Leader>WQ :wa<CR>:q<CR>

nmap <Leader>Q :qa!<CR>

nnoremap nw <C-W><C-W>

nnoremap <Leader>lw <C-W>l

nnoremap <Leader>hw <C-W>h

nnoremap <Leader>kw <C-W>k

nnoremap <Leader>jw <C-W>j

nmap <Leader>M %


autocmd BufWritePost $MYVIMRC source $MYVIMRC



set incsearch

set ignorecase

set nocompatible

set wildmenu

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() 
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'Valloric/YouCompleteMe'
call vundle#end() 
filetype plugin indent on


set background=dark
colorscheme default


set gcr=a:block-blinkon0

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

set guioptions-=m
set guioptions-=T

fun! ToggleFullscreen()
    call system("wmctrl -ir " . v:windowid . " -btoggle,fullscreen")
endf

map <silent> <F10> :call ToggleFullscreen()<CR>

autocmd VimEnter * call ToggleFullscreen()

set laststatus=2

set ruler

set number

set cursorline
set cursorcolumn

set hlsearch



set nowrap

syntax enable

syntax on
syntax keyword cppSTLtype initializer_list


filetype indent on

set expandtab

set tabstop=4

set shiftwidth=4

set softtabstop=4



"vim-indent-guides
"
"let g:indent_guides_enable_on_vim_startup=1
"
"let g:indent_guides_start_level=1
"
"let g:indent_guides_guide_size=1
"
"nmap <silent> <Leader>i <Plug>IndentGuidesToggle
"
"
"set foldmethod=indent
""set foldmethod=syntax

set nofoldenable


nmap <silent> <Leader>sw :FSHere<cr>



map <Leader>bl :MBEToggle<cr>
map <Leader>el :MBEbn<cr>
map <Leader>eh :MBEbp<cr>

nmap <Leader>fl :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeWinPos='left'
let g:NERDTreeSize=30
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeHidden=0
autocmd vimenter * if !argc()|NERDTree|endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd vimenter * NERDTree



let tagbar_left=0 
nnoremap <Leader>ilt :TagbarToggle<CR> 
let tagbar_width=32 
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
     \ }


let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"




highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
inoremap <leader>; <C-x><C-o>
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

```

## 快捷键
```
let mapleader=";"
inoremap <Leader>jk <esc>
nmap LB 0
nmap LE $
vnoremap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>WQ :wa<CR>:q<CR>
nmap <Leader>Q :qa!<CR>
nnoremap nw <C-W><C-W>
nnoremap <Leader>lw <C-W>l
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>kw <C-W>k
nnoremap <Leader>jw <C-W>j
nmap <Leader>M %
map <silent> <F10> :call ToggleFullscreen()<CR>
"nmap <silent> <Leader>i <Plug>IndentGuidesToggle
nmap <silent> <Leader>sw :FSHere<cr>
map <Leader>bl :MBEToggle<cr>
map <Leader>el :MBEbn<cr>
map <Leader>eh :MBEbp<cr>
nmap <Leader>fl :NERDTreeToggle<CR>
nnoremap <Leader>ilt :TagbarToggle<CR> 
inoremap <leader>; <C-x><C-o>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>


```


## 构建docker
```
 docker run -it -d --name ubuntu16_vim --cap-add=SYS_PTRACE --security-opt seccomp=unconfined ubuntu:16.04 /bin/bash
 
 docker exec -it ubuntu16_vim /bin/bash
 
 apt-get update
 apt-get install gdb git make g++ gcc build-essential cmake python3-dev ctags vim

 
 git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
 	
 cd ~/.vim/bundle/YouCompleteMe/
 python3 install.py --clang-completer
 python3 install.py --clangd-completer
 
 
 项目demo
 git clone https://github.com/antirez/redis.git
 cd redis
 make
 
 
``` 




